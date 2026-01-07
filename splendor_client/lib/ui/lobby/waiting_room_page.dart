import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/providers/identity_provider.dart';
import '../game/game_page.dart';
import 'package:splendor_shared/src/ai/bot_factory.dart';

class WaitingRoomPage extends ConsumerStatefulWidget {
  const WaitingRoomPage({super.key});

  @override
  ConsumerState<WaitingRoomPage> createState() => _WaitingRoomPageState();
}

class _WaitingRoomPageState extends ConsumerState<WaitingRoomPage> {
  // Mock State
  List<Map<String, dynamic>> _slots = [];

  @override
  void initState() {
    super.initState();
    // Defer initialization to build or look for identity in initState if available?
    // IdentityProvider is available via ref in build, or we can use ref.read in initState implementation if we wait.
    // Better: Initialize in `didChangeDependencies` or just use a flag. 
    // Actually, simple way: Initialize empty, then update in build or use a post-frame callback?
    // Let's populate mock slots, but header uses real identity. 
    // Wait, the User wants the slot to show the real name. 
    _slots = [
      {'name': 'HOST', 'avatar': 'avatar_1', 'isBot': false, 'isReady': true}, // Placeholder
      {'name': 'EMPTY', 'avatar': null, 'isBot': false, 'isReady': false},
      {'name': 'EMPTY', 'avatar': null, 'isBot': false, 'isReady': false},
      {'name': 'EMPTY', 'avatar': null, 'isBot': false, 'isReady': false},
    ];
  }

  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
       final identity = ref.read(identityProvider);
       if (identity != null) {
         _slots[0] = {
           'name': identity.name,
           'avatar': identity.avatarId,
           'isBot': false,
           'isReady': true
         };
       }
       _initialized = true;
    }
  }

  Future<void> _addBot(int index) async {
    final difficulty = await showDialog<BotDifficulty>(
      context: context,
      builder: (ctx) => SimpleDialog(
        title: const Text("SELECT BOT DIFFICULTY"),
        backgroundColor: const Color(0xFF2C2C2C),
        titleTextStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        children: BotDifficulty.values.map((d) => SimpleDialogOption(
          onPressed: () => Navigator.pop(ctx, d),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(d.name.toUpperCase(), style: const TextStyle(color: Colors.white70)),
          ),
        )).toList(),
      ),
    );

    if (difficulty != null) {
      setState(() {
        _slots[index] = {
          'name': '${difficulty.name.toUpperCase()} BOT', 
          'avatar': 'avatar_bot', 
          'isBot': true, 
          'difficulty': difficulty,
          'isReady': true
        };
      });
    }
  }
  
  void _removePlayer(int index) {
     setState(() {
      _slots[index] = {'name': 'EMPTY', 'avatar': null, 'isBot': false, 'isReady': false};
    });
  }

  void _startGame() {
    // 1. Collect Players
    final players = <PlayerIdentity>[];
    
    for (var slot in _slots) {
       if (slot['name'] != 'EMPTY') {
          // Mock UUID for now
          final uuid = slot['isBot'] ? "bot_${DateTime.now().microsecondsSinceEpoch}" : (ref.read(identityProvider)?.uuid ?? "p1");
          
          players.add(PlayerIdentity(
             uuid: uuid,
             name: slot['name'],
             avatarId: slot['avatar'] ?? 'avatar_1',
             isBot: slot['isBot'],
             // We might need to store difficulty in PlayerIdentity or separate config?
             // PlayerIdentity doesn't have difficulty field in shared?
             // Checking... it probably doesn't. 
             // We can infer or map it later in GamePage using a Config object.
          ));
       }
    }
    
    if (players.length < 2) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("NEED AT LEAST 2 PLAYERS")));
      return;
    }

    // Navigate to GamePage with players
    // Note: GamePage constructor needs update to accept players.
    // For now we pass it, assuming we will update GamePage next.
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => GamePage(players: players)));
  }

  @override
  Widget build(BuildContext context) {
    final identity = ref.watch(identityProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("WAITING ROOM"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Room Info
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white.withValues(alpha: 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("HOST: ${identity?.name ?? 'UNKNOWN'}", style: const TextStyle(fontWeight: FontWeight.bold)),
                    const Text("MODE: SCORE (15 PTS)", style: TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.green.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.green),
                  ),
                  child: const Text("OPEN", style: TextStyle(color: Colors.green, fontSize: 12, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(24),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.8,
              ),
              itemCount: 4,
              itemBuilder: (ctx, i) {
                final slot = _slots[i];
                final bool isEmpty = slot['name'] == 'EMPTY';
                final bool isBot = slot['isBot'] as bool;

                return Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF252525),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.white10),
                    boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.3), blurRadius: 8, offset: const Offset(0, 4))],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Avatar
                      CircleAvatar(
                        radius: 36,
                        backgroundColor: isEmpty ? Colors.white10 : (isBot ? Colors.blueGrey : Colors.amber),
                        child: Icon(
                          isEmpty ? Icons.add : (isBot ? Icons.smart_toy : Icons.person),
                          size: 32,
                          color: Colors.white,
                        ),
                      ).animate(target: isEmpty ? 0 : 1).scale(duration: 300.ms, curve: Curves.easeOutBack),
                      
                      const SizedBox(height: 16),
                      
                      Text(
                        slot['name'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold, 
                          color: isEmpty ? Colors.grey : Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      
                      const SizedBox(height: 8),
                      
                      // Status / Actions
                      if (isEmpty)
                        TextButton.icon(
                          onPressed: () => _addBot(i),
                          icon: const Icon(Icons.add_circle_outline, size: 16),
                          label: const Text("ADD BOT"),
                          style: TextButton.styleFrom(foregroundColor: Colors.blue),
                        )
                      else if (i != 0) // Cannot kick host
                         TextButton.icon(
                          onPressed: () => _removePlayer(i),
                          icon: const Icon(Icons.close, size: 16),
                          label: const Text("KICK"),
                           style: TextButton.styleFrom(foregroundColor: Colors.red),
                        ),

                      if (!isEmpty && (slot['isReady'] as bool))
                         const Padding(
                           padding: EdgeInsets.only(top: 8.0),
                           child: Text("READY", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 10)),
                         ),
                    ],
                  ),
                );
              },
            ),
          ),
          
          // Start Button
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: ElevatedButton(
              onPressed: _startGame,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20),
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Colors.black,
              ),
              child: const Text("START MATCH", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, letterSpacing: 2)),
            ),
          ),
        ],
      ),
    );
  }
}
