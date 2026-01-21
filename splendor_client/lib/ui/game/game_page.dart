import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../core/audio/audio_service.dart';
import '../../core/providers/identity_provider.dart';
import 'package:splendor_shared/splendor_shared.dart';

import '../../repository/game_repository.dart';
import 'gem_token.dart';
import 'victory_page.dart';

import '../../core/providers/gameplay_settings_provider.dart'; // [NEW]
import '../settings/settings_page.dart';
import '../welcome/welcome_page.dart'; // [NEW]
// New Widgets
import 'widgets/game_hud.dart';
import 'widgets/splendor_card_widget.dart';
import 'widgets/noble_hover_widget.dart';

class GamePage extends ConsumerStatefulWidget {
  final List<PlayerIdentity> players;
  final IGameRepository? repository; // Optional injected repository
  final int? turnDuration; // [NEW] Optional override
  final int? targetScore; // [NEW]
  
  const GamePage({super.key, this.players = const [], this.repository, this.turnDuration, this.targetScore});
  
  @override
  ConsumerState<GamePage> createState() => _GamePageState();
}

class _GamePageState extends ConsumerState<GamePage> {
  late IGameRepository _repository;
  bool _isProcessing = false;
  final int _roundCount = 1; // Track basic rounds (Turn Index / Player Count)
  
  @override
  void initState() {
    super.initState();
    final settings = ref.read(gameplaySettingsProvider);
    // Use widget override if exists, otherwise global settings
    final effectiveDuration = widget.turnDuration ?? settings.turnDuration;
    final effectiveTargetScore = widget.targetScore ?? 15;
    
    _repository = widget.repository ?? LocalGameRepository(
       turnDuration: effectiveDuration, 
       targetScore: effectiveTargetScore
    );
    
    // Listen to State Changes (Important for Timeout / Bot updates)
    _subscription = _repository.stateStream.listen((newState) {
        if (mounted) {
           setState(() {
              // Update Round Count if needed
              // check game over...
           });
           // Trigger Bot Check if turn changed?
           _checkTurn(); 
        }
    });

    _initializeGame();
  }

  StreamSubscription<GameState>? _subscription;

  @override
  void dispose() {
    _subscription?.cancel();
    _repository.dispose();
    super.dispose();
  }

  void _onExitGame() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
         backgroundColor: Colors.blueGrey[900],
         title: const Text("Exit Game?", style: TextStyle(color: Colors.white)),
         content: const Text("Are you sure you want to leave the game? Progress will be lost.", style: TextStyle(color: Colors.white70)),
         actions: [
            TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("Cancel")),
            ElevatedButton(
               style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
               onPressed: () {
                  Navigator.pop(ctx); // Close dialog
                  // Navigate to Main Menu logic (WelcomePage handles Menu now)
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => const WelcomePage()), 
                    (route) => false
                  );
               }, 
               child: const Text("Exit")
            )
         ],
      )
    );
  }

  bool _isCurrentTurn() {
     try {
       final state = _repository.currentState;
       if (state.status != GameStatus.playing) return false;
       final currentId = state.players[state.turnIndex].uuid;
       final myId = ref.read(identityProvider)?.uuid;
       
       // Rule 1: Always my turn if identity matches
       if (currentId == myId) return true;

       // Rule 2: In Local Game, strict identity check is relaxed for Human Hotseat
       // If repository is Local (implicit check or explicit if available), allow if currentPlayer is NOT a bot
       // We can distinguish by checking if the current player is in our local list and is Human
       final currentPlayerParams = widget.players.firstWhere((p) => p.uuid == currentId, orElse: () => widget.players.first);
       
       // If we are strictly in a local game context (started from LocalGameSetupPage), 
       // then the user 'controls' all non-bot players.
       if (_repository is LocalGameRepository && !currentPlayerParams.isBot) {
          return true;
       }
       
       return false;
     } catch (e) {
       return false;
     }
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
       
       // Update Round Count approx (Not supported in shared state yet)
       // setState(() {
       //    _roundCount = (state.turnCount / state.players.length).ceil();
       //    if (_roundCount < 1) _roundCount = 1;
       // });
  
       final currentPlayer = state.players[state.turnIndex].uuid;
       final playerParams = widget.players.firstWhere((p) => p.uuid == currentPlayer);
       
       if (playerParams.isBot && !_isProcessing) {
          setState(() => _isProcessing = true);
          
          // Bot Thinking Delay
          await Future.delayed(1000.ms);
           
          // Create Bot
          BotDifficulty diff = BotDifficulty.standard;
          if (playerParams.name.contains("EASY")) diff = BotDifficulty.easy;
          if (playerParams.name.contains("HARD")) diff = BotDifficulty.hard;
          
          final bot = BotFactory.createBot(diff, currentPlayer);
          final move = await bot.computeNextMove(state);
          
          await _repository.applyAction(move);

          setState(() => _isProcessing = false);
          
          _checkTurn(); 
       } else {
          setState(() {});
       }
     } catch (e) {
       print("Game Error: $e");
     }
  }

  void _showGameOver() {
    final state = _repository.currentState;
    final isSinglePlayer = widget.players.where((p) => !p.isBot).length <= 1;

    // [FIX] Sort players to find true winner (Standard Rules)
    // 1. Highest Score
    // 2. Fewest Purchased Cards (Tier Breaker)
    final sortedPlayers = List<PlayerState>.from(state.playerStates);
    sortedPlayers.sort((a, b) {
       final scoreDiff = b.score.compareTo(a.score);
       if (scoreDiff != 0) return scoreDiff;
       return a.purchasedCards.length.compareTo(b.purchasedCards.length); 
    });
    
    final winner = sortedPlayers.first;

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => VictoryPage(
       winner: winner, 
       onRestart: isSinglePlayer ? () {
         Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => GamePage(players: widget.players)));
       } : null 
    )));
  }
  
  final Map<Gem, int> _draftGems = {};
  SplendorCard? _draftCard;
  bool _isReserving = false; 
  
  // Hover State
  String? _hoveredOpponentId;
  PlayerState? _hoveredOpponentState;
  
  // Card Hover Overlay State
  final GlobalKey _stackKey = GlobalKey();
  SplendorCard? _hoveredCard;
  Rect? _hoveredCardRect;

  void _clearHover([SplendorCard? target]) {
     if (_hoveredCard != null) {
        // [FIX] Robustness: Only clear if we are clearing the currently hovered card.
        // This prevents 'onExit' of Card A from clearing 'onEnter' of Card B if events overlap.
        if (target != null && _hoveredCard != target) return;
        
        setState(() {
           _hoveredCard = null;
           _hoveredCardRect = null;
        });
     }
  }

  // UI Interaction
  void _onTakeGem(Gem gem) {
    if (!_isCurrentTurn()) {
      _showError("Not your turn!");
      return;
    }
    if (_isProcessing) return;
    
    // RULE FIX: Cannot take Gold directly
    if (gem == Gem.gold) {
       _showError("黄金筹码不能直接拿取，必须通过'预留卡牌'获得");
       return;
    }

    // Logic: Smart Toggle
    // ... rest of logic
    setState(() {
       // Reset Card Draft if standard gem action
       if (_draftCard != null) {
          _draftCard = null;
          _draftGems.clear();
       }
       
       final current = _draftGems[gem] ?? 0;
       
       if (current == 0) {
          // Check availability first
          final available = _repository.currentState.availableGems[gem] ?? 0;
          if (available <= 0) {
             _showError("该筹码已无剩余");
             return;
          }

          // Attempt to add 1
          bool hasDouble = _draftGems.values.any((v) => v == 2);
          if (_draftGems.length < 3 && !hasDouble) {
             _draftGems[gem] = 1;
             ref.read(audioServiceProvider).playSfx('click');
          } else {
             _showError("最多只能拿3枚不同筹码，或2枚同色筹码");
          }
       } else if (current == 1) {
          // Attempt to add 2nd (Double) OR Cancel
          final available = _repository.currentState.availableGems[gem] ?? 0;
          bool isOnlySelection = _draftGems.length == 1;
          
          if (available >= 4 && isOnlySelection) {
             _draftGems[gem] = 2; // Upgrade to Double
             ref.read(audioServiceProvider).playSfx('click');
          } else {
             _draftGems.remove(gem);
             ref.read(audioServiceProvider).playSfx('click');
          }
       } else {
          // current == 2 -> Toggle OFF
          _draftGems.remove(gem);
          ref.read(audioServiceProvider).playSfx('click');
       }
    });
  }

  void _showError(String msg) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(msg, style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
        duration: 1.seconds,
      ));
  }
  
  // Use new Card Widget logic
  void _onCardTap(SplendorCard card) {
    if (_isProcessing) return; // Keep processing check
    if (!_isCurrentTurn()) {
       _showError("Not your turn!");
       return;
    }
    ref.read(audioServiceProvider).playSfx('click');
    
    // Check affordability
    final canBuy = _canBuy(card);
    final canReserve = _canReserve();
    
    showDialog(
       context: context,
       builder: (ctx) => AlertDialog(
          backgroundColor: const Color(0xFF2C2C2C),
          contentPadding: const EdgeInsets.all(24),
          content: Column(
             mainAxisSize: MainAxisSize.min,
             children: [
                SplendorCardWidget(card: card),
                const SizedBox(height: 24),
                Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                      // Buy Button
                      _buildActionButton("购买", Colors.green, canBuy, () {
                          Navigator.pop(ctx);
                          _setDraftCard(card, false);
                          // Auto Confirm for smoother UX
                          _onConfirm();
                      }),
                      const SizedBox(width: 16),
                      // Reserve Button
                      _buildActionButton("预留", Colors.amber, canReserve, () {
                          Navigator.pop(ctx);
                          _setDraftCard(card, true);
                          // Auto Confirm for smoother UX
                          _onConfirm();
                      }),
                   ],
                )
             ],
          ),
       )
    );
  }
  
  Widget _buildActionButton(String label, Color color, bool enabled, VoidCallback onTap) {
      return AnimatedContainer(
         duration: 300.ms,
         decoration: BoxDecoration(
            boxShadow: enabled ? [BoxShadow(color: color.withValues(alpha: 0.5), blurRadius: 10, spreadRadius: 1)] : []
         ),
         child: ElevatedButton(
            onPressed: enabled ? onTap : null,
            style: ElevatedButton.styleFrom(
               backgroundColor: color,
               disabledBackgroundColor: Colors.grey[800],
               padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12)
            ),
            child: Text(label, style: TextStyle(color: enabled ? Colors.white : Colors.white30)),
         ),
      );
  }

  void _setDraftCard(SplendorCard card, bool reserve) {
     setState(() {
        _draftGems.clear();
        _draftCard = card;
        _isReserving = reserve;
     });
  }

  bool _canBuy(SplendorCard card) {
     // [FIX] Handles null identity for Local/Hotseat games
     final identity = ref.read(identityProvider);
     String? targetPlayerId;
     
     if (identity != null) {
        targetPlayerId = identity.uuid;
        // Verify this player is actually in the game (might be spectator or outdated)
        if (!_repository.currentState.playerStates.any((p) => p.playerId == targetPlayerId)) {
           targetPlayerId = null;
        }
     }
     
     // Fallback: If no identity (or not in game), assume we want to check affordability for the CURRENT TURN player
     // This is standard for Hotseat mode.
     if (targetPlayerId == null) {
        targetPlayerId = _repository.currentState.playerStates[_repository.currentState.turnIndex].playerId;
     }

     final myState = _repository.currentState.playerStates.firstWhere((p) => p.playerId == targetPlayerId);
     
     int missing = 0;
     for (final entry in card.cost.entries) {
        final gem = entry.key;
        final cost = entry.value;
        final held = myState.gems[gem] ?? 0;
        final bonus = myState.bonuses[gem] ?? 0;
        
        final needed = cost - bonus;
        if (needed > 0) {
           final stillNeeded = needed - held;
           if (stillNeeded > 0) missing += stillNeeded;
        }
     }
     
     final gold = myState.gems[Gem.gold] ?? 0;
     return missing <= gold;
  }

  bool _canReserve() {
     // [FIX] Same logic for reserve
     final identity = ref.read(identityProvider);
     String? targetPlayerId;
     
     if (identity != null) {
        targetPlayerId = identity.uuid;
        if (!_repository.currentState.playerStates.any((p) => p.playerId == targetPlayerId)) {
           targetPlayerId = null;
        }
     }
     
     if (targetPlayerId == null) {
        targetPlayerId = _repository.currentState.playerStates[_repository.currentState.turnIndex].playerId;
     }

     final myState = _repository.currentState.playerStates.firstWhere((p) => p.playerId == targetPlayerId);
     return myState.reservedCards.length < 3;
  }

  void _onConfirm() async {
     if (_isProcessing) return;
     // [FIX] Identity Fallback
     final identity = ref.read(identityProvider)?.uuid;
     String? actingPlayerId = identity;
     if (actingPlayerId == null) {
        // Fallback to current turn player if Hotseat
        actingPlayerId = _repository.currentState.playerStates[_repository.currentState.turnIndex].playerId;
     }
     
     if (actingPlayerId == null) return;
     final myId = actingPlayerId; // Assign to existing var name to minimize diff

     Map<String, dynamic>? action;
     
     if (_draftGems.isNotEmpty) {
        action = {'type': 'take_gems', 'playerId': myId, 'gems': _draftGems.map((k, v) => MapEntry(k.name, v))};
     } else if (_draftCard != null) {
        String type;
        if (_isReserving) {
           type = 'reserve_card';
        } else {
           // [FIX] Check if buying from reserved
           final myState = _repository.currentState.playerStates.firstWhere((p) => p.playerId == myId);
           final isReserved = myState.reservedCards.any((c) => c.id == _draftCard!.id);
           type = isReserved ? 'buy_reserved' : 'buy_card';
        }
        action = {'type': type, 'playerId': myId, 'cardId': _draftCard!.id};
     }

     if (action != null) {
        setState(() => _isProcessing = true);
        try {
           await _repository.applyAction(action);
           setState(() { _draftGems.clear(); _draftCard = null; _isReserving = false; _isProcessing = false; });
           
           final audio = ref.read(audioServiceProvider);
           if (action['type'] == 'take_gems') audio.playSfx('take_gem');
           if (action['type'] == 'buy_card') audio.playSfx('buy_card');
           if (action['type'] == 'reserve_card') audio.playSfx('reserve');

           _checkTurn();
        } catch (e) {
           setState(() => _isProcessing = false);
           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Action Failed: $e"), backgroundColor: Colors.red));
        }
     } else {
         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("请先选择筹码或卡牌"), backgroundColor: Colors.orange));
     }
  }
  
  void _onUndo() {
     setState(() { _draftGems.clear(); _draftCard = null; _isReserving = false; });
  }

  @override
  Widget build(BuildContext context) {
    // if (_repository == null) return const Center(child: CircularProgressIndicator()); 
    
    GameState state;
    try { state = _repository.currentState; } catch (e) { return const Center(child: CircularProgressIndicator()); }
    
    final activePlayer = widget.players.firstWhere((p) => p.uuid == state.players[state.turnIndex].uuid);
    final myId = ref.watch(identityProvider)?.uuid;
    // [FIX] Determine who the "Local User" is controlling/viewing.
    // If identity exists, it's that user.
    // If null (Local/Hotseat), it defaults to the Current Turn Player (Active View).
    final actingPlayerId = myId ?? state.players[state.turnIndex].uuid;
    final isMyTurn = _isCurrentTurn(); // Use the shared logic

    return Scaffold(
      backgroundColor: const Color(0xFF121212), 
      body: SafeArea(
      child: Stack(
        key: _stackKey,
        children: [
            // Background
            Positioned.fill(
              child: MouseRegion( // [FIX] Safety Net: Clear hover when touching background
                onEnter: (_) => _clearHover(),
                child: Opacity(
                  opacity: 0.3,
                  child: Image.asset('assets/images/ui/board_bg.png', fit: BoxFit.cover, errorBuilder: (_, __, ___) => Container(color: const Color(0xFF121212))),
                ),
              ),
            ),
            
            Column(
              children: [
                  // 1. HUD
                  GameHUD(
                     turnCount: state.turnIndex ~/ state.players.length + 1, // Simple Round Calc
                     activePlayerName: activePlayer.name,
                     isMyTurn: isMyTurn,
                     turnDuration: _repository.turnDuration,
                     onPause: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsPage())),
                     onExit: _onExitGame, // [NEW]
                  ),
                
                const Divider(color: Colors.white10, height: 1),

                // Main Content Area (Sidebar + Board + Gems + Sidebar)
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch, // [FIX] Ensure columns fill height
                    children: [
                         // 1. Left Sidebar: Opponents
                         Container(
                            width: 120, 
                            color: Colors.black26, 
                            child: ListView.separated(
                               padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                               itemCount: widget.players.where((p) => p.uuid != myId).length,
                               separatorBuilder: (_, __) => const SizedBox(height: 16),
                               itemBuilder: (ctx, i) {
                                  final opponents = widget.players.where((p) => p.uuid != myId).toList();
                                  final oppState = state.playerStates.firstWhere((s) => s.playerId == opponents[i].uuid);
                                  return MouseRegion(
                                     onEnter: (_) => setState(() {
                                        _hoveredOpponentId = opponents[i].uuid;
                                        _hoveredOpponentState = oppState;
                                        _clearHover(); // [FIX] Clear card hover
                                     }),
                                     onExit: (_) => setState(() {
                                        _hoveredOpponentId = null;
                                        _hoveredOpponentState = null;
                                     }),
                                     child: _buildCompactOpponentCard(opponents[i], oppState),
                                  );
                               },
                            ),
                         ),
                         
                         const VerticalDivider(width: 1, color: Colors.white10),

                         // 2. Center: Cards Board + Gems Bank
                         Expanded(
                           child: Column(
                             children: [
                               // Board
                               Expanded(
                                 child: Padding(
                                   padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                                   child: FittedBox(
                                     key: const ValueKey("CardsBoard"),
                                     fit: BoxFit.contain, 
                                     alignment: Alignment.center,
                                     child: Row(
                                       mainAxisAlignment: MainAxisAlignment.center,
                                       crossAxisAlignment: CrossAxisAlignment.center,
                                       children: [
                                           _buildTierBlock(state.tier3Cards, Colors.blue, "III"),
                                           const SizedBox(width: 16),
                                           _buildTierBlock(state.tier2Cards, Colors.amber, "II"),
                                           const SizedBox(width: 16),
                                           _buildTierBlock(state.tier1Cards, Colors.green, "I"),
                                       ],
                                     ),
                                   ),
                                 ),
                               ),
                               
                               const Divider(color: Colors.white10, height: 1),

                               // Gems Bank
                               Container(
                                 padding: const EdgeInsets.symmetric(vertical: 8),
                                 color: Colors.black26,
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                   children: [
                                     ...state.availableGems.entries.map((e) => Column(
                                       children: [
                                         GemToken(gem: e.key, size: 50, isSelected: _draftGems.containsKey(e.key), onTap: () => _onTakeGem(e.key)), 
                                         if (_draftGems.containsKey(e.key))
                                            Container(
                                               margin: const EdgeInsets.only(top: 4),
                                               padding: const EdgeInsets.symmetric(horizontal: 4),
                                               decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4)),
                                               child: Text("拿取: ${_draftGems[e.key]}", style: const TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold)),
                                            ),
                                         const SizedBox(height: 4),
                                         Text("${e.value}", style: const TextStyle(color: Colors.white70, fontSize: 14, fontWeight: FontWeight.bold)),
                                       ],
                                     )).toList(),
                                     // Confirm Buttons
                                     Row(
                                       children: [
                                          IconButton(
                                            onPressed: _draftCard != null || _draftGems.isNotEmpty ? _onConfirm : null,
                                            icon: Container(
                                               padding: const EdgeInsets.all(8),
                                               decoration: BoxDecoration(
                                                  color: _draftCard != null || _draftGems.isNotEmpty ? Colors.green : Colors.grey[800],
                                                  shape: BoxShape.circle,
                                                  boxShadow: _draftCard != null || _draftGems.isNotEmpty ? [const BoxShadow(color: Colors.greenAccent, blurRadius: 10)] : []
                                               ),
                                               child: const Icon(Icons.check, color: Colors.white, size: 28),
                                            ),
                                          ),
                                          const SizedBox(width: 16),
                                          IconButton(
                                            onPressed: _onUndo,
                                            icon: Container(
                                               padding: const EdgeInsets.all(8),
                                               decoration: BoxDecoration(color: Colors.grey[800], shape: BoxShape.circle, border: Border.all(color: Colors.white24)),
                                               child: const Icon(Icons.undo, color: Colors.white, size: 28),
                                            ),
                                          ),
                                       ],
                                     ),
                                   ],
                                 ),
                               ),
                             ],
                           ),
                         ),

                         const VerticalDivider(width: 1, color: Colors.white10),

                         // 3. Right Sidebar: Nobles
                         Container(
                            width: 120,
                            color: Colors.black12,
                            padding: const EdgeInsets.only(top: 16),
                            child: Column(
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: [
                                  const Text("NOBLES", style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
                                  const SizedBox(height: 16),
                                  const SizedBox(height: 16),
                                  Expanded(
                                    child: Scrollbar(
                                       thumbVisibility: true,
                                       // Using PrimaryScrollController to ensure Scrollbar finds the List's controller
                                       child: ListView(
                                          primary: true, 
                                          children: state.nobles.map((n) => Padding(
                                             padding: const EdgeInsets.only(bottom: 12.0),
                                             child: Center(
                                                // Using a custom widget that handles its own overlay
                                                child: NobleHoverWidget(noble: n),
                                             ),
                                          )).toList(),
                                       ),
                                    ),
                                  ),
                               ],
                            ),
                         ),
                    ],
                  ),
                ),
                
                const Divider(color: Colors.white10, height: 1),
                
                // 4. Player Area
                // [FIX] Always show panel for actingPlayerId
                _buildPlayerPanel(state.playerStates.firstWhere((p) => p.playerId == actingPlayerId)),
              ],
            ),
             if (_isProcessing)
              Container(color: Colors.black54, child: const Center(child: CircularProgressIndicator(color: Colors.amber))),

            // Hover Overlay for Opponents (Top Level of Stack)
            if (_hoveredOpponentId != null && _hoveredOpponentState != null)
               Positioned(
                  top: 50,
                  left: 140, 
                  child: _buildOpponentDetailOverlay(_hoveredOpponentState!),
               ),

            // Card Hover Overlay (Fixes Occlusion)
            if (_hoveredCard != null && _hoveredCardRect != null) ...[
               // Capture current for closure
               (() {
                  final currentCard = _hoveredCard!;
                  return Positioned(
                     left: _hoveredCardRect!.left,
                     top: _hoveredCardRect!.top,
                     width: _hoveredCardRect!.width,
                     height: _hoveredCardRect!.height,
                     child: MouseRegion(
                        onExit: (_) => _clearHover(currentCard), // Only clear if this card is still active
                        child: SplendorCardWidget(
                           card: currentCard,
                           isAffordable: _canBuy(currentCard),
                           isReserved: false, 
                           isHoveredOverride: true, 
                           onTap: () => _onCardTap(currentCard),
                        ),
                     ),
                  );
               })(),
            ]
          ],
      ),
      ),
    );
  }

   Widget _buildPlayerPanel(PlayerState myState) {
      return Container(
         height: 170, 
         decoration: BoxDecoration(color: const Color(0xFF1E1E1E), border: Border(top: BorderSide(color: Colors.amber.withValues(alpha: 0.3), width: 2))),
         padding: const EdgeInsets.all(12),
         child: Row(
            children: [
               // Stats
               Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text("${myState.score}", style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.amber)),
                     const Text("分数", style: TextStyle(fontSize: 10, color: Colors.grey, letterSpacing: 2)),
                     if (myState.nobles.isNotEmpty) Icon(Icons.emoji_events, color: Colors.purple[200]),
                  ],
               ),
               const VerticalDivider(color: Colors.white10, width: 24),
               
               // Resources
               Expanded(
                  child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                        const Text("红利", style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Row(
                           children: Gem.values.where((g) => g != Gem.gold).map((gem) {
                              final count = myState.bonuses[gem] ?? 0;
                              final gemColor = _getGemColor(gem);
                              return Container(
                                 width: 32, height: 42,
                                 margin: const EdgeInsets.only(right: 6),
                                 decoration: BoxDecoration(
                                     color: gemColor.withValues(alpha: 0.3), 
                                     border: Border.all(color: gemColor, width: 1.5), 
                                     borderRadius: BorderRadius.circular(4)
                                 ),
                                 child: Center(
                                     child: Text("$count", 
                                         style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16, shadows: [Shadow(blurRadius: 2, color: Colors.black)])
                                     )
                                 ),
                              );
                           }).toList(),
                        ),
                        const SizedBox(height: 12),
                        const Text("筹码", style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Row(
                           children: Gem.values.map<Widget>((gem) {
                              final count = myState.gems[gem] ?? 0;
                              return Padding(padding: const EdgeInsets.only(right: 4.0),child: GemToken(gem: gem, size: 32, count: count, onTap: () {}));
                           }).toList(),
                        ),
                     ],
                  ),
               ),
              
              const VerticalDivider(color: Colors.white10, width: 24),

              // Reserved Cards
              Container(
                 width: 320, 
                 padding: const EdgeInsets.only(left: 12),
                 decoration: const BoxDecoration(
                    border: Border(left: BorderSide(color: Colors.white10, width: 1))
                 ),
                 child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text("预留 (${myState.reservedCards.length}/3)", style: const TextStyle(fontSize: 10, color: Colors.grey)),
                       const SizedBox(height: 8),
                       Expanded(
                          child: Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                             children: myState.reservedCards.map((card) => 
                               Padding(
                                 padding: const EdgeInsets.only(right: 12.0),
                                 child: AspectRatio(
                                   aspectRatio: 0.7, 
                                   child: FittedBox(
                                     fit: BoxFit.contain,
                                     child: SplendorCardWidget(
                                        card: card, 
                                        isAffordable: _canBuy(card), 
                                        isReserved: true,
                                        onTap: () => _onCardTap(card)
                                     ),
                                   ),
                                 ),
                               )
                             ).toList(),
                          ),
                       ),
                    ],
                 ),
              )
           ],
        ),
     );
  }

  Widget _buildCompactOpponentCard(PlayerIdentity player, PlayerState state) {
    return Container(
      // width: 100, // Removed fixed width
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
         color: const Color(0xFF2C2C2C), 
         borderRadius: BorderRadius.circular(8), 
         border: Border.all(
            color: _hoveredOpponentId == player.uuid ? Colors.amber : Colors.white12,
            width: _hoveredOpponentId == player.uuid ? 2 : 1
         )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           CircleAvatar(
              radius: 16, 
              backgroundColor: player.isBot ? Colors.blueGrey : Colors.amber, 
              child: Icon(player.isBot ? Icons.smart_toy : Icons.person, size: 18, color: Colors.white)
           ),
           const SizedBox(height: 4),
           Text(player.name, style: const TextStyle(fontSize: 10, color: Colors.white70), overflow: TextOverflow.ellipsis),
           const SizedBox(height: 4),
           // Simple Score
           Text("${state.score} pts", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.amber)),
        ],
      ),
    );
  }

   Widget _buildOpponentDetailOverlay(PlayerState state) {
      return Container(
         width: 500, // Large Overlay as requested (Red Box size)
         padding: const EdgeInsets.all(20),
         decoration: BoxDecoration(
            color: const Color(0xFF1E1E1E),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.amber, width: 3),
            boxShadow: const [BoxShadow(color: Colors.black, blurRadius: 20, spreadRadius: 5)]
         ),
         child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
               // Header
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                    Text("Score: ${state.score}", style: const TextStyle(color: Colors.amber, fontSize: 32, fontWeight: FontWeight.bold)),
                    if (state.nobles.isNotEmpty)
                       Row(children: [const Icon(Icons.emoji_events, color: Colors.purpleAccent, size: 32), const SizedBox(width: 8), Text("${state.nobles.length}", style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold))])
                 ],
               ),
               const Divider(color: Colors.white24, height: 32),
               
               // 1. Nobles Detail
               if (state.nobles.isNotEmpty) ...[
                  const Text("Nobles:", style: TextStyle(color: Colors.purpleAccent, fontSize: 14, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Wrap(
                     spacing: 12,
                     children: state.nobles.map((n) => 
                        Container(
                           width: 50, height: 50,
                           decoration: BoxDecoration(
                             border: Border.all(color: Colors.amber),
                             borderRadius: BorderRadius.circular(4),
                             image: DecorationImage(image: AssetImage('assets/images/nobles/${n.id}.png'), fit: BoxFit.cover)
                           ),
                        )
                     ).toList(),
                  ),
                  const SizedBox(height: 20),
               ],

               // 2. Reserved Cards (Revealed)
               Row(
                  children: [
                     const Text("Reserved Cards:", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
                     const SizedBox(width: 8),
                     Text("(${state.reservedCards.length}/3)", style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
               ),
               const SizedBox(height: 12),
               if (state.reservedCards.isEmpty) 
                  const Text("No Reserved Cards", style: TextStyle(color: Colors.white30, fontSize: 14, fontStyle: FontStyle.italic))
               else
                  Container(
                     height: 200, // Reduced from 140 to 200? No, Increased to 200.
                     alignment: Alignment.centerLeft,
                     child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: state.reservedCards.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 12),
                        itemBuilder: (ctx, i) {
                           final card = state.reservedCards[i];
                           return AspectRatio(
                              aspectRatio: 0.7,
                              child: SplendorCardWidget(
                                 card: card,
                                 isReserved: true, // Now safe to use true as style is improved
                              ),
                           );
                        },
                     ),
                  ),
                  
               const SizedBox(height: 20),
               
                // 3. Resources (Visual Tokens)
                const Text("Resources:", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
                const Divider(color: Colors.white24),
                const SizedBox(height: 12),
                Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   crossAxisAlignment: CrossAxisAlignment.end,
                   children: Gem.values.map((gem) {
                      final bonus = state.bonuses[gem] ?? 0;
                      final gemCount = state.gems[gem] ?? 0;
                      final color = _getGemColor(gem);
                      
                      return Column(
                         mainAxisSize: MainAxisSize.min,
                         children: [
                            // Bonus Indicator
                            if (gem != Gem.gold)
                              Container(
                                 width: 28, height: 36,
                                 margin: const EdgeInsets.only(bottom: 8),
                                 decoration: BoxDecoration(
                                    color: color.withValues(alpha: 0.3),
                                    border: Border.all(color: color, width: 1.5),
                                    borderRadius: BorderRadius.circular(4)
                                 ),
                                 child: Center(
                                     child: Text("$bonus", 
                                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14, shadows: [Shadow(blurRadius: 2, color: Colors.black)])
                                     )
                                 ),
                              )
                            else 
                               const SizedBox(height: 44), // Spacer for Gold 
                            
                            // Gem Token (Interactive look but just display)
                            GemToken(gem: gem, count: gemCount, size: 40, onTap: () {}),
                         ],
                      );
                   }).toList(),
                )
             ],
          ),
       );
    }
   
   // Updated to return a 2x2 Grid Block with Hover Capture
   Widget _buildTierBlock(List<SplendorCard> cards, Color tierColor, String label) {
       // Check if there are cards to display
       if (cards.isEmpty) return const SizedBox.shrink();

       // We want 2 rows of 2 cards
       final row1 = cards.take(2).toList();
       final row2 = cards.skip(2).take(2).toList();
       
       return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
             border: Border.all(color: tierColor.withValues(alpha: 0.3), width: 2),
             borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
                Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: row1.map((c) => _buildHoverableCard(c)).toList(),
                ),
                if (row2.isNotEmpty)
                  Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: row2.map((c) => _buildHoverableCard(c)).toList(),
                  )
             ],
          ),
       );
   }

   Widget _buildHoverableCard(SplendorCard card) {
       return SplendorCardWidget(
          card: card, 
          isAffordable: _canBuy(card), 
          isReserved: false,
          isHoveredOverride: null, // Allow internal hover logic
          onTap: () => _onCardTap(card)
       );
   }


   Color _getGemColor(Gem gem) {
     switch (gem) {
       case Gem.red: return Colors.red;
       case Gem.blue: return Colors.blue;
       case Gem.green: return Colors.green;
       case Gem.black: return const Color(0xFF333333);
       case Gem.white: return Colors.white;
       case Gem.gold: return Colors.amber;
     }
   }
}
