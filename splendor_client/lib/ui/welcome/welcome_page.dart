import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/providers/identity_provider.dart';
import '../lobby/lobby_page.dart';
import '../setup/local_setup_page.dart';
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
  
  void _startLocalGame() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => const LocalGameSetupPage()));
  }
  
  void _startOnlineGame() {
     showDialog(
        context: context, 
        builder: (ctx) => _OnlineLoginDialog(
          onConfirm: (name) {
             ref.read(identityServiceProvider).setIdentity(name, "avatar_1");
             Navigator.push(context, MaterialPageRoute(builder: (_) => const LobbyPage()));
          }
        )
     );
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
                   const Text("PRIVATE CLOUD v3.8.2", style: TextStyle(fontSize: 12, color: Colors.grey)),
                   const SizedBox(height: 64),
                   
                   // Option 1: Local Game (No Identity Required)
                   SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                         onPressed: _startLocalGame,
                         icon: const Icon(Icons.computer),
                         label: const Text("本地游戏 (Local Game)"),
                         style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(16), backgroundColor: Colors.teal),
                      ),
                   ),
                   const SizedBox(height: 16),
                   
                   // Option 2: Online Game (Requires Identity)
                   SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                         onPressed: _startOnlineGame,
                         icon: const Icon(Icons.cloud),
                         label: const Text("线上游戏 (Online Game)"),
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

class _OnlineLoginDialog extends StatefulWidget {
  final Function(String name) onConfirm;
  const _OnlineLoginDialog({required this.onConfirm});

  @override
  State<_OnlineLoginDialog> createState() => _OnlineLoginDialogState();
}

class _OnlineLoginDialogState extends State<_OnlineLoginDialog> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFF2C2C2C),
      title: const Text("使用昵称登录", style: TextStyle(color: Colors.amber)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
           const Text("联机游戏需要一个临时身份", style: TextStyle(color: Colors.white70)),
           const SizedBox(height: 16),
           TextField(
              controller: _controller,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                 labelText: "昵称",
                 labelStyle: TextStyle(color: Colors.white70),
                 enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white30))
              ),
           )
        ],
      ),
      actions: [
         TextButton(onPressed: () => Navigator.pop(context), child: const Text("取消")),
         ElevatedButton(
            onPressed: () {
               final name = _controller.text.isEmpty ? "Player ${DateTime.now().second}" : _controller.text;
               Navigator.pop(context);
               widget.onConfirm(name);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
            child: const Text("进入大厅"),
         )
      ],
    );
  }
}
