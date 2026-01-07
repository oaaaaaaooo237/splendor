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
     // Save Identity
     final name = _nameController.text.isEmpty ? "Player 1" : _nameController.text;
     ref.read(identityProvider.notifier).setIdentity(name, "avatar_1");
     
     // Launch Local Game (vs Bots)
     final me = PlayerIdentity(uuid: ref.read(identityProvider)!.uuid, name: name, avatarId: "1");
     final bot1 = PlayerIdentity(uuid: "bot_easy", name: "EASY BOT", avatarId: "2", isBot: true);
     
     Navigator.push(context, MaterialPageRoute(builder: (_) => GamePage(players: [me, bot1]))); 
  }
  
  void _startMultiplayer() {
     final name = _nameController.text.isEmpty ? "Player 1" : _nameController.text;
     ref.read(identityProvider.notifier).setIdentity(name, "avatar_1");
     
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
                         labelText: "Enter Your Name",
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
                         label: const Text("SINGLE PLAYER (vs BOT)"),
                         style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(16), backgroundColor: Colors.teal),
                      ),
                   ),
                   const SizedBox(height: 16),
                   SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                         onPressed: _startMultiplayer,
                         icon: const Icon(Icons.cloud),
                         label: const Text("MULTIPLAYER LOBBY"),
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
