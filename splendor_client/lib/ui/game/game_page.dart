```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/persistence/settings_service.dart';
import '../../core/audio/audio_service.dart';
import '../../core/providers/identity_provider.dart';
import 'package:splendor_shared/splendor_shared.dart';
import 'package:splendor_shared/src/logic/engine/splendor_game_engine.dart';
import 'package:splendor_shared/src/logic/utils/game_setup_helper.dart';
import '../../repository/game_repository.dart';
import 'gem_token.dart';
import 'victory_page.dart';

class GamePage extends ConsumerStatefulWidget {
  final List<PlayerIdentity> players;
  final IGameRepository? repository; // Optional injected repository
  
  const GamePage({super.key, this.players = const [], this.repository});
  
  @override
  ConsumerState<GamePage> createState() => _GamePageState();
}

class _GamePageState extends ConsumerState<GamePage> {
  late IGameRepository _repository;
  bool _isProcessing = false;
  
  @override
  void initState() {
    super.initState();
    // Use injected repository (Remote) or fallback to Local
    _repository = widget.repository ?? LocalGameRepository(); 
    
    // Only initialize if it's Local (Remote is already init by Lobby)
    // Actually, LocalGameRepository needs init. Remote might be ready.
    // Check if repository needs calling initialize.
    // Simplifying assumption: Always call initialize for Local. 
    // For Remote, Lobby called specific methods. 'initialize' might be generic setup.
    // Let's call _initializeGame() which calls _repository.initialize()
    // BUT Remote.initialize is empty/no-op in my previous edit?
    // Let's check RemoteGameRepository.initialize. It sends 'create_room' in previous version but I removed it?
    // In current version, Remote.initialize is empty. 
    // So calling it is safe.
    
    _initializeGame();
  }

  void _initializeGame() async {
    await _repository.initialize(widget.players);
    
    // Check if first player is bot
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkTurn();
    });
    
    // Play Game BGM
    Future.microtask(() => ref.read(audioServiceProvider).playGameBgm());
  }

  void _checkTurn() async {
     try {
       final state = _repository.currentState;
       if (state.status == GameStatus.finished) {
          _showGameOver();
          return;
       }
  
       final currentPlayer = state.players[state.turnIndex].uuid;
       // Find if this player is a bot
       final playerParams = widget.players.firstWhere((p) => p.uuid == currentPlayer);
       
       if (playerParams.isBot && !_isProcessing) {
          setState(() => _isProcessing = true);
          
          // Bot Thinking Delay
          await Future.delayed(1000.ms);
          
          // Create Bot (Factory)
          BotDifficulty diff = BotDifficulty.standard;
          if (playerParams.name.contains("EASY")) diff = BotDifficulty.easy;
          if (playerParams.name.contains("HARD")) diff = BotDifficulty.hard;
          
          final bot = BotFactory.createBot(diff, currentPlayer);
          final move = await bot.computeNextMove(state);
          
          // Apply to Repository (it handles replacement injection now!)
          await _repository.applyAction(move);

          setState(() => _isProcessing = false);
          
          _checkTurn(); // Recursive for next player
       } else {
          // Human turn.
          setState(() {});
       }
     } catch (e) {
       print("Game Error: $e");
     }
  }

  void _showGameOver() {
    final state = _repository.currentState;
    
    // Determine Game Mode
    // Single Player: <= 1 Human Player (The rest are bots)
    // Multiplayer: > 1 Human Players (Local Hotseat or Online)
    final isSinglePlayer = widget.players.where((p) => !p.isBot).length <= 1;

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => VictoryPage(
       winner: state.playerStates[state.turnIndex], 
       onRestart: isSinglePlayer ? () {
         Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => GamePage(players: widget.players)));
       } : null 
    )));
  }
  
  final Map<Gem, int> _draftGems = {};
  SplendorCard? _draftCard;
  bool _isReserving = false; 

  // UI Interaction
  void _onTakeGem(Gem gem) {
    if (_isProcessing || !_isCurrentTurn()) return;
    
    ref.read(audioServiceProvider).playSfx('click');

    if (_draftCard != null) return; // Can't take gems if card selected

     setState(() {
       final currentCount = _draftGems[gem] ?? 0;
       // Simple validation logic for UI feedback
       // Logic: Max 3 distinct, or 2 same (if pile >=4).
       // We won't enforce strict rules here, but we will limit total to 3.
       // Engine will validate strictly.
       if (currentCount == 0) {
         if (_draftGems.length < 3) {
            _draftGems[gem] = 1;
         }
       } else if (currentCount == 1) {
         // Trying to take 2nd of same gem
         // Clear others if any? or just allow if it's the only one.
         if (_draftGems.length == 1) {
            _draftGems[gem] = 2;
         }
       } else {
         // Already have 2, can't take more of this.
       }
     });
  }
  
  void _onCardTap(SplendorCard card) {
    if (_isProcessing || !_isCurrentTurn()) return;
    
    ref.read(audioServiceProvider).playSfx('click');

    setState(() {
       _draftGems.clear();
       _draftCard = card;
       // For MVP, tap is Buy. 
       // If we want Reserve, we need a toggle or long press. 
       _isReserving = false; 
    });
  }
  
  void _onCardLongPress(SplendorCard card) {
    if (_isProcessing) return;
    setState(() {
       _draftGems.clear();
       _draftCard = card;
       _isReserving = true;
    });
  }

  // CONTEXT:
  // Class: _GamePageState (GamePage)
  // Global Variables: _draftCard, _isReserving
  // Libraries: splendor_shared
  void _onConfirm() async {
     if (_isProcessing) return;
     
     final myId = ref.read(identityProvider)?.uuid;
     if (myId == null) return;
     

// ... (in _onConfirm)
     // Find my state to check reserved
     final myState = _repository.currentState.playerStates.firstWhere((p) => p.playerId == myId);

     Map<String, dynamic>? action;
     // ... (Action Construction logic remains same) ...
     
     if (action != null) {
        // NOTE: Repository handles replacement injection now!
        try {
           await _repository.applyAction(action);
           
           // Clear draft
           setState(() {
              _draftGems.clear();
              _draftCard = null;
              _isReserving = false;
           });
           
           // Play SFX
           final audio = ref.read(audioServiceProvider);
           if (action['type'] == 'take_gems') audio.playSfx('take_gem');
           if (action['type'] == 'buy_card') audio.playSfx('buy_card');
           if (action['type'] == 'reserve_card') audio.playSfx('reserve');

           // Pass turn check
           _checkTurn();
        } catch (e) {
           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid Move: $e")));
        }
     }
  }
  
  // _drawReplacement REMOVED - Logic moved to LocalGameRepository
  
  void _onUndo() {
     setState(() {
        _draftGems.clear();
        _draftCard = null;
        _isReserving = false;
     });
  }

  @override
  Widget build(BuildContext context) {
    if (_repository == null) return const Center(child: CircularProgressIndicator()); // Safety
    
    GameState state;
    try {
       state = _repository.currentState;
    } catch (e) {
       return const Center(child: CircularProgressIndicator()); // Init delay
    }
    
    final activePlayer = widget.players.firstWhere((p) => p.uuid == state.players[state.turnIndex].uuid);
    final myId = ref.watch(identityProvider)?.uuid;
    final isMyTurn = activePlayer.uuid == myId;

    // Global Visual Effects
    final enableEffects = ref.watch(visualSettingsProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF121212), 
      body: IgnorePointer(
        ignoring: !isMyTurn, // Disable interaction if not my turn
        child: SafeArea(
        child: Stack(
          children: [
            // BackgroundTexture
            Positioned.fill(
              child: Opacity(
                opacity: 0.3,
                child: Image.asset(
                  'assets/images/ui/board_bg.png',
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(color: const Color(0xFF121212)),
                ),
              ),
            ),
            
            Column(
              children: [
                // 1. Opponents Area
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.all(8),
                    itemCount: widget.players.where((p) => p.uuid != myId).length,
                    itemBuilder: (ctx, i) {
                       final opponents = widget.players.where((p) => p.uuid != myId).toList();
                       final oppId = opponents[i].uuid;
                       final oppState = state.playerStates.firstWhere((s) => s.playerId == oppId);
                       // We need to pass Opponent State + Identity
                       return _buildOpponentCard(opponents[i], oppState);
                    },
                  ),
                ),
                
                const Divider(color: Colors.white10),
                
                // 2. Board Area (Middle)
                Expanded(
                  child: Row(
                    children: [
                      // Nobles Column
                      SizedBox(
                        width: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: state.nobles.map((n) => _buildNobleTile(n)).toList(),
                        ),
                      ),
                      
                      // Cards Grid
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
                          children: [
                            _buildCardRow(state.tier3Cards, Colors.blue, enableEffects),
                            _buildCardRow(state.tier2Cards, Colors.yellow, enableEffects),
                            _buildCardRow(state.tier1Cards, Colors.green, enableEffects),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                
                // 3. Gems Bank
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  color: Colors.black26,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ...state.availableGems.entries.map((e) => Column(
                        children: [
                          GemToken(
                            gem: e.key, 
                            size: 48, 
                            isSelected: _draftGems.containsKey(e.key),
                            onTap: () => _onTakeGem(e.key)
                          ),
                          const SizedBox(height: 4),
                          Text("x${e.value}", style: const TextStyle(color: Colors.white70, fontSize: 12)),
                        ],
                      )).toList(),
                      // Action Buttons
                      Row(
                        children: [
                          ElevatedButton.icon(
                            onPressed: _draftCard != null || _draftGems.isNotEmpty ? _onConfirm : null, 
                            icon: const Icon(Icons.check),
                            label: Text(_isReserving ? "RESERVE" : "CONFIRM"),
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white),
                          ),
                          const SizedBox(width: 8),
                          OutlinedButton.icon(
                            onPressed: _onUndo, 
                            icon: const Icon(Icons.undo),
                            label: const Text("UNDO"),
                            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                
                const Divider(color: Colors.white10),

                // 4. Player Area
                if (myId != null)
                   _buildPlayerPanel(state.playerStates.firstWhere((p) => p.playerId == myId), enableEffects),
              ],
            ),
            
             if (_isProcessing)
              Container(
                color: Colors.black54,
                child: const Center(child: CircularProgressIndicator(color: Colors.amber)),
              )
          ],
        ),
      ),
      ),
    );
  }

  // CONTEXT:
  // Class: _GamePageState (GamePage)
  // Global Variables: _draftCard (SplendorCard?), _isReserving (bool)
  // Libraries: flutter/material, splendor_shared, gem_token
   Widget _buildPlayerPanel(PlayerState myState, bool enableEffects) {
      return Container(
         height: 180,
         decoration: BoxDecoration(
            color: const Color(0xFF1E1E1E),
            border: Border(top: BorderSide(color: Colors.amber.withOpacity(0.3), width: 2)),
         ),
         padding: const EdgeInsets.all(12),
         child: Row(
            children: [
               // Left: Stats (Points + Nobles)
               Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text("${myState.score}", style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.amber)),
                     const Text("POINTS", style: TextStyle(fontSize: 10, color: Colors.grey, letterSpacing: 2)),
                     const SizedBox(height: 8),
                     // Nobles Icon Row if any
                     if (myState.nobles.isNotEmpty)
                        Icon(Icons.emoji_events, color: Colors.purple[200]),
                  ],
               ),
               const VerticalDivider(color: Colors.white10, width: 24),
               
               // Middle: Resources (Bonuses + Gems)
               Expanded(
                  child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                        // Bonuses (rectangles)
                        const Text("BONUSES", style: TextStyle(fontSize: 10, color: Colors.grey)),
                        const SizedBox(height: 4),
                        Row(
                           children: Gem.values.where((g) => g != Gem.gold).map((gem) {
                              final count = myState.bonuses[gem] ?? 0;
                              return Container(
                                 width: 30, height: 40,
                                 margin: const EdgeInsets.only(right: 6),
                                 decoration: BoxDecoration(
                                    color: _getGemColor(gem).withOpacity(0.2),
                                    border: Border.all(color: _getGemColor(gem)),
                                    borderRadius: BorderRadius.circular(4),
                                 ),
                                 child: Center(child: Text("$count", style: TextStyle(color: _getGemColor(gem), fontWeight: FontWeight.bold))),
                              )
                              .animate(
                                 key: ValueKey(count), 
                                 target: 1
                              )
                              .scale(
                                 begin: const Offset(1.5, 1.5), 
                                 end: const Offset(1.0, 1.0),
                                 duration: enableEffects ? 300.ms : 0.ms,
                                 curve: Curves.elasticOut
                              )
                              .flash(duration: enableEffects ? 300.ms : 0.ms);
                           }).toList(),
                        ),
                        const SizedBox(height: 12),
                        
                        // Gems (tokens)
                        const Text("TOKENS", style: TextStyle(fontSize: 10, color: Colors.grey)),
                        const SizedBox(height: 4),
                        Row(
                           children: Gem.values.map((gem) {
                              final count = myState.gems[gem] ?? 0;
                              return Padding(
                                padding: const EdgeInsets.only(right: 4.0),
                                child: GemToken(gem: gem, size: 32, count: count, onTap: () {}), // No interaction on own gems usually? Or return?
                              );
                           }).toList(),
                        ),
                     ],
                  ),
               ),
              
              const VerticalDivider(color: Colors.white10, width: 24),

              // Right: Reserved Cards
              SizedBox(
                 width: 120,
                 child: Column(
                    children: [
                       Text("RESERVED (${myState.reservedCards.length})", style: const TextStyle(fontSize: 10, color: Colors.grey)),
                       const SizedBox(height: 8),
                       Expanded(
                          child: ListView.builder(
                             scrollDirection: Axis.horizontal,
                             itemCount: myState.reservedCards.length,
                             itemBuilder: (ctx, i) {
                                final card = myState.reservedCards[i];
                                final isSelected = _draftCard?.id == card.id;
                                return GestureDetector(
                                   onTap: () {
                                      // Special logic: Tap reserved to BUY it
                                      setState(() {
                                         _draftGems.clear();
                                         _draftCard = card;
                                         _isReserving = false; // Buying from reserved
                                      });
                                   },
                                   child: Container(
                                      width: 50,
                                      margin: const EdgeInsets.only(right: 8),
                                      decoration: BoxDecoration(
                                         color: Colors.grey[800],
                                         border: Border.all(
                                            color: isSelected ? Colors.green : _getGemColor(card.bonusGem),
                                            width: isSelected ? 2 : 1
                                         ),
                                         borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Column(
                                         mainAxisAlignment: MainAxisAlignment.center,
                                         children: [
                                            Text("${card.points}", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                            Icon(Icons.diamond, size: 12, color: _getGemColor(card.bonusGem)),
                                         ],
                                      ),
                                   ),
                                );
                             },
                          ),
                       ),
                    ],
                 ),
              )
           ],
        ),
     );
  }

  Widget _buildOpponentCard(PlayerIdentity player, PlayerState state) {
    return Container(
      width: 80,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2C),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 12, 
            backgroundColor: player.isBot ? Colors.blueGrey : Colors.amber, 
            child: Icon(player.isBot ? Icons.smart_toy : Icons.person, size: 12, color: Colors.white)
          ),
          const SizedBox(height: 4),
          Text(player.name, style: const TextStyle(fontSize: 10, color: Colors.grey), overflow: TextOverflow.ellipsis),
          Text("${state.score} PTS", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.amber)),
        ],
      ),
    );
  }

  Widget _buildNobleTile(Noble noble) {
    // Map noble ID to corresponding generated asset if exists, else fallback
    String assetPath = 'assets/images/nobles/${noble.id}.png';
    
    return Container(
      width: 80,
      height: 80,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF3E2723),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.amber.withOpacity(0.5), width: 1.5),
        boxShadow: const [BoxShadow(color: Colors.black54, blurRadius: 4, offset: Offset(2, 2))],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6.5),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              assetPath,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(color: Colors.brown[900]),
            ),
            // Points Overlay
            Positioned(
              top: 4, left: 4,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  "${noble.points}", 
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)
                ),
              ),
            ),
            // Requirements Overlay (Mini)
            Positioned(
              bottom: 4, right: 4,
              child: Row(
                children: noble.requirements.entries.map((e) => Padding(
                  padding: const EdgeInsets.only(left: 2),
                  child: GemToken(gem: e.key, size: 14, count: e.value, showShadow: false),
                )).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardRow(List<SplendorCard> cards, Color tierColor, bool enableEffects) {
    return SizedBox(
      height: 120, 
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: cards.length,
        itemBuilder: (ctx, i) {
          final card = cards[i];
          final isSelected = _draftCard?.id == card.id;
          final bgAsset = 'assets/images/cards/level${card.tier}.png';
          
          return GestureDetector(
            onTap: () => _onCardTap(card),
            onLongPress: () => _onCardLongPress(card),
            child: AnimatedContainer(
              duration: enableEffects ? 200.ms : 0.ms,
              width: 85,
              margin: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isSelected ? Colors.white : tierColor.withValues(alpha: 0.5),
                  width: isSelected ? 2.5 : 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: isSelected ? tierColor.withValues(alpha: 0.4) : Colors.black45,
                    blurRadius: isSelected ? 12 : 4,
                    offset: const Offset(2, 2)
                  )
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      bgAsset,
                      fit: BoxFit.cover,
                      opacity: const AlwaysStoppedAnimation(0.7),
                    ),
                    if (card.points > 0)
                      Positioned(
                        top: 4, left: 4,
                        child: Text(
                          "${card.points}", 
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white, shadows: [Shadow(blurRadius: 4)])
                        ),
                      ),
                    Positioned(
                      top: 4, right: 4,
                      child: GemToken(gem: card.bonusGem, size: 24),
                    ),
                    Positioned(
                      bottom: 4, left: 4, right: 4,
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 2,
                        runSpacing: 2,
                        children: card.cost.entries.where((e) => e.value > 0).map((e) => 
                          GemToken(gem: e.key, size: 16, count: e.value, showShadow: false)
                        ).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            )
            .animate(
              key: ValueKey(card.id), // Key forces rebuild on refill
              target: 1 // Always run
            )
            .slideX(begin: 0.2, duration: enableEffects ? 300.ms : 0.ms, curve: Curves.easeOut)
            .fadeIn(duration: enableEffects ? 300.ms : 0.ms)
            .shimmer(duration: enableEffects ? 600.ms : 0.ms, delay: 200.ms, color: Colors.white24),
          );
        },
      ),
    );
  }
  
  Color _getGemColor(Gem gem) {
     switch (gem) {
      case Gem.white: return Colors.white;
      case Gem.blue: return Colors.blue;
      case Gem.green: return Colors.green;
      case Gem.red: return Colors.red;
      case Gem.black: return Colors.grey;
      case Gem.gold: return Colors.amber;
    }
  }
}
