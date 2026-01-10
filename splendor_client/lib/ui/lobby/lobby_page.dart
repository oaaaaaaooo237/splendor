import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../repository/remote_game_repository.dart';
import '../../core/providers/identity_provider.dart';
import '../../core/providers/gameplay_settings_provider.dart'; // [NEW]
import 'package:splendor_shared/splendor_shared.dart';
import '../game/game_page.dart';

// CONTEXT:
// Purpose: Network Entry Point. Handles Server Connection, Login, Room Creation/Join.
// Logic:
// 1. Connects to WS.
// 2. Logins with local Identity.
// 3. Allows Create or Join.
// 4. Waits for 'game_started' event to Push GamePage.

class LobbyPage extends ConsumerStatefulWidget {
  const LobbyPage({super.key});

  @override
  ConsumerState<LobbyPage> createState() => _LobbyPageState();
}

class _LobbyPageState extends ConsumerState<LobbyPage> {
  final TextEditingController _ipController = TextEditingController(text: 'ws://localhost:8080'); // Dev Default
  final TextEditingController _roomIdController = TextEditingController();
  
  RemoteGameRepository? _repository;
  
  String _status = "Disconnected";
  String? _currentRoomId;
  bool _isHost = false;
  bool _isConnected = false;

  @override
  void dispose() {
    _ipController.dispose();
    _roomIdController.dispose();
    // Don't dispose repository if we pushed GamePage! Pass it.
    // If we leave Lobby without game, dispose.
    super.dispose();
  }

  void _connect() {
    if (_repository != null) return;
    
    setState(() => _status = "Connecting...");
    
    try {
       _repository = RemoteGameRepository(_ipController.text);
       
       // Listen to events
       _repository!.eventStream.listen((event) {
          _handleEvent(event);
       }, onError: (e) {
          setState(() {
             _status = "Connection Error: $e";
             _repository = null;
             _isConnected = false;
          });
       });
       
       // Auto Login
       final identity = ref.read(identityProvider);
       if (identity != null) {
          _repository!.loginWithId(identity.uuid, identity.name);
       } else {
          _repository!.login("Guest");
       }
       
    } catch (e) {
       setState(() => _status = "Invalid URL: $e");
    }
  }
  
  void _handleEvent(Map<String, dynamic> event) {
     final type = event['type'];
     final data = event['data'];
     
     if (type == 'login_ack') {
        setState(() {
           _status = "Connected as ${data['playerId']}";
           _isConnected = true;
        });
     }
     
     if (type == 'room_created') {
        setState(() {
           _currentRoomId = data['roomId'];
           _status = "Room Created: $_currentRoomId. Waiting for players...";
           _isHost = true;
        });
     }
     
     if (type == 'joined_room') {
        setState(() {
           _currentRoomId = data['roomId'];
           _status = "Joined Room: $_currentRoomId. Waiting for host...";
           _isHost = false;
        });
     }
     
     if (type == 'game_started') {
        // Game Started! Navigate to GamePage
        if (mounted) {
           Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => GamePage(
                 players: [], // Player list comes from Engine State
                 repository: _repository!, // Pass the connected repo
              )
           ));
        }
     }
     
     if (type == 'error') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(data['message'])));
     }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Multiplayer Lobby")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
           children: [
              // Connection Section
              if (!_isConnected) ...[
                 TextField(
                    controller: _ipController,
                    decoration: const InputDecoration(labelText: "Server URL", border: OutlineInputBorder()),
                 ),
                 const SizedBox(height: 16),
                 ElevatedButton(onPressed: _connect, child: const Text("Connect to Server")),
              ] else ...[
                 // Connected Actions
                 Text("Status: $_status", style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
                 const SizedBox(height: 24),
                 
                 if (_currentRoomId == null) ...[
                    ElevatedButton(
                       onPressed: () {
                          final settings = ref.read(gameplaySettingsProvider);
                          _repository!.createRoom(turnDuration: settings.turnDuration);
                       }, 
                       child: const Text("Create Room")
                    ),
                    const SizedBox(height: 16),
                    Row(
                       children: [
                          Expanded(child: TextField(
                             controller: _roomIdController,
                             decoration: const InputDecoration(labelText: "Room ID", border: OutlineInputBorder()),
                          )),
                          const SizedBox(width: 8),
                          ElevatedButton(
                             onPressed: () => _repository!.joinRoom(_roomIdController.text), 
                             child: const Text("Join")
                          ),
                       ],
                    )
                 ] else ...[
                    // Waiting Room UI
                    Container(
                       padding: const EdgeInsets.all(16),
                       decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent), borderRadius: BorderRadius.circular(8)),
                       child: Column(
                          children: [
                             Text("Room: $_currentRoomId", style: const TextStyle(fontSize: 18)),
                             const SizedBox(height: 16),
                             const CircularProgressIndicator(),
                             const SizedBox(height: 16),
                             if (_isHost)
                                ElevatedButton(
                                   onPressed: () => _repository!.startGame(), 
                                   style: ElevatedButton.styleFrom(backgroundColor: Colors.amber, foregroundColor: Colors.black),
                                   child: const Text("START GAME")
                                )
                             else
                                const Text("Waiting for Host to start...")
                          ],
                       ),
                    )
                 ]
              ],
              
              const Spacer(),
              Text(_status, style: const TextStyle(color: Colors.grey)),
           ],
        ),
      ),
    );
  }
}
