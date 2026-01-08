import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/providers/identity_provider.dart';
import '../lobby/lobby_page.dart';
import '../game/game_page.dart';
import '../settings/settings_page.dart';
import 'package:splendor_shared/splendor_shared.dart';

// CONTEXT:
// Purpose: First screen. Sets up User Identity and choose mode.

class WelcomePage extends ConsumerStatefulWidget {
  const WelcomePage({super.key});

  @override
  ConsumerState<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends ConsumerState<WelcomePage> {
  final TextEditingController _nameController = TextEditingController();
  
  void _startSinglePlayer() {
    final name = _nameController.text.isEmpty ? "Player 1" : _nameController.text;
    ref.read(identityServiceProvider).setIdentity(name, "avatar_1");
    
    showDialog(
       context: context, 
       builder: (ctx) => _BotSetupDialog(
          playerName: name,
          onStart: (count, difficulty) {
             final me = PlayerIdentity(uuid: ref.read(identityProvider)!.uuid, name: name, avatarId: "1");
             final bots = List.generate(count, (i) {
                String diffLabel = "STD";
                if (difficulty == BotDifficulty.easy) diffLabel = "EASY";
                if (difficulty == BotDifficulty.hard) diffLabel = "HARD";
                return PlayerIdentity(
                   uuid: "bot_$i", 
                   name: "$diffLabel BOT ${i+1}", 
                   avatarId: "${i+2}", 
                   isBot: true
                );
             });
             
             Navigator.push(context, MaterialPageRoute(builder: (_) => GamePage(players: [me, ...bots])));
          }
       )
    );
  }
  
  void _startMultiplayer() {
     final name = _nameController.text.isEmpty ? "Player 1" : _nameController.text;
     ref.read(identityServiceProvider).setIdentity(name, "avatar_1");
     
     Navigator.push(context, MaterialPageRoute(builder: (_) => const LobbyPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.blueGrey[900],
       appBar: AppBar(
          backgroundColor: Colors.transparent, 
          elevation: 0,
          actions: [
             IconButton(
                icon: const Icon(Icons.settings, color: Colors.white54),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsPage())),
             )
          ],
       ),
       body: Center(
          child: Container(
             padding: const EdgeInsets.all(32),
             constraints: const BoxConstraints(maxWidth: 400),
             decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(16)
             ),
             child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                   const Text("SPLENDOR", style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.amber)),
                   const Text("PRIVATE CLOUD v3.2", style: TextStyle(fontSize: 12, color: Colors.grey)),
                   const SizedBox(height: 48),
                   
                   TextField(
                      controller: _nameController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                         labelText: "请输入您的昵称",
                         labelStyle: TextStyle(color: Colors.white70),
                         border: OutlineInputBorder(),
                         enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white30))
                      ),
                   ),
                   const SizedBox(height: 24),
                   
                   SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                         onPressed: _startSinglePlayer,
                         icon: const Icon(Icons.person),
                         label: const Text("单人游戏 (vs AI)"),
                         style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(16), backgroundColor: Colors.teal),
                      ),
                   ),
                   const SizedBox(height: 16),
                   SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                         onPressed: _startMultiplayer,
                         icon: const Icon(Icons.cloud),
                         label: const Text("多人大厅"),
                         style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(16), backgroundColor: Colors.indigo),
                      ),
                   ),
                ],
             ),
          ),
       ),
    );
  }
}

class _BotSetupDialog extends StatefulWidget {
  final String playerName;
  final Function(int count, BotDifficulty difficulty) onStart;

  const _BotSetupDialog({required this.playerName, required this.onStart});

  @override
  State<_BotSetupDialog> createState() => _BotSetupDialogState();
}

class _BotSetupDialogState extends State<_BotSetupDialog> {
  int _botCount = 1;
  BotDifficulty _difficulty = BotDifficulty.standard;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFF2C2C2C),
      title: const Text("单人游戏设置", style: TextStyle(color: Colors.amber)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           const Text("电脑数量", style: TextStyle(color: Colors.white70)),
           Row(
              children: [1, 2, 3].map((i) => Padding(
                 padding: const EdgeInsets.only(right: 8),
                 child: ChoiceChip(
                    label: Text("$i", style: TextStyle(color: _botCount == i ? Colors.black : Colors.white)),
                    selected: _botCount == i,
                    selectedColor: Colors.amber,
                    backgroundColor: Colors.grey[800],
                    onSelected: (v) => setState(() => _botCount = i),
                 ),
              )).toList(),
           ),
           const SizedBox(height: 16),
           const Text("电脑难度", style: TextStyle(color: Colors.white70)),
           DropdownButton<BotDifficulty>(
              value: _difficulty,
              dropdownColor: Colors.grey[900],
              isExpanded: true,
              style: const TextStyle(color: Colors.white),
              items: const [
                 DropdownMenuItem(value: BotDifficulty.easy, child: Text("简单 (Easy)")),
                 DropdownMenuItem(value: BotDifficulty.standard, child: Text("标准 (Standard)")),
                 DropdownMenuItem(value: BotDifficulty.hard, child: Text("困难 (Hard)")),
              ],
              onChanged: (v) => setState(() => _difficulty = v!),
           )
        ],
      ),
      actions: [
         TextButton(onPressed: () => Navigator.pop(context), child: const Text("取消")),
         ElevatedButton(
            onPressed: () {
               Navigator.pop(context);
               widget.onStart(_botCount, _difficulty);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
            child: const Text("开始", style: TextStyle(color: Colors.black)),
         )
      ],
    );
  }
}
