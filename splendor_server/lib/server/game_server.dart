import 'room_manager.dart';
import 'client_connection.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:splendor_shared/splendor_shared.dart';

// CONTEXT:
// Class: GameServer
// Purpose: Central controller. Handles 'login', 'create', 'join', 'start', 'action'.
// Roles: Orchestrator of server logic.
class GameServer {
  final RoomManager roomManager = RoomManager();
  final Map<String, ClientConnection> _clients = {}; // Map by PlayerID

  void handleConnection(WebSocketChannel channel) {
    // Wrap channel in ClientConnection
    // It registers its own listeners.
    ClientConnection(channel, this);
  }

  void handleRequest(ClientConnection client, String type, Map<String, dynamic> payload) {
    // 1. Auth / Login
    // Simple Protocol: 'login' -> { 'playerId': 'p1', 'name': 'Gary' }
    if (type == 'login') {
       final pid = payload['playerId'] as String;
       final name = payload['name'] ?? 'Guest';
       
       client.playerId = pid;
       client.name = name;
       _clients[pid] = client;
       
       client.send('login_ack', {'playerId': pid, 'message': 'Welcome $name'});
       return;
    }
    
    // Require Login for other actions
    if (client.playerId == null) {
       client.sendError("Auth required");
       return;
    }
    
    final pid = client.playerId!; // non-null asserted
    
     // 2. Room Management
    if (type == 'create_room') {
       // Support custom Room Name/ID
       final requestedId = payload['roomId'];
       final settings = payload['settings'] as Map<String, dynamic>?; // [NEW]
       
       final roomId = roomManager.createLobby(pid, client.name, customId: requestedId, settings: settings);
       client.roomId = roomId;
       client.send('room_created', {'roomId': roomId});
       _broadcastLobbyUpdate(roomId);
       return;
    }
    
    if (type == 'join_room') {
       final roomId = payload['roomId'];
       final success = roomManager.joinLobby(roomId, pid, client.name);
       if (success) {
          client.roomId = roomId;
          client.send('joined_room', {'roomId': roomId});
          _broadcastLobbyUpdate(roomId);
       } else {
          client.sendError("Join failed (Room full or not found)");
       }
       return;
    }
    
    if (type == 'start_game') {
       final roomId = client.roomId;
       if (roomId == null) return client.sendError("Not in a room");
       
       final room = roomManager.startGame(roomId);
       if (room != null) {
          // Inject broadcast callback
          room.onBroadcast = (r, t, d) => _broadcastToRoom(r, t, d);
          
          // Broadcast Game Start with full player list for mapping
          _broadcastToRoom(room, 'game_started', {
             'initialState': room.engine.currentState.toJson(),
             'players': room.playerIdentities.map((p) => p.toJson()).toList(),
             'settings': {'turnDuration': room.turnDuration} // [NEW]
          });
          
          // Start Timer
          room.startTurnTimer();
       } else {
          client.sendError("Start failed (Not owner or invalid room)");
       }
       return;
    }
    
    // 3. Game Actions
    if (type == 'game_action') {
       final roomId = client.roomId;
       if (roomId == null) return client.sendError("Not in a room");
       
       final room = roomManager.getRoom(roomId);
       if (room == null) return client.sendError("Game not running");
       
       try {
          // Inject playerId into action for security (trust server auth, not client payload)
          final action = Map<String, dynamic>.from(payload['action']);
          action['playerId'] = pid; 
          
          // Apply to Engine
          room.engine.applyAction(action);
          
          // Success? Broadcast new state
          _broadcastToRoom(room, 'game_update', {
             'state': room.engine.currentState.toJson(),
             'lastAction': action
          });
          
          // Restart Timer for next player
          if (room.engine.currentState.status == GameStatus.playing) {
             room.startTurnTimer();
          } else {
             room.stopTimer();
          }
       } catch (e) {
          client.sendError("Action failed: $e");
       }
    }
  }

  void _broadcastLobbyUpdate(String roomId) {
     final players = roomManager.getLobbyPlayers(roomId);
     if (players == null) return;
     
     final data = {
        'type': 'lobby_update',
        'data': {
           'roomId': roomId,
           'players': players.map((p) => p.toJson()).toList(),
        }
     };
     
     for (var p in players) {
        final c = _clients[p.uuid];
        if (c != null) {
           c.sendRaw(data);
        }
     }
  }
  
  void _broadcastToRoom(GameRoom room, String type, Map<String, dynamic> data) {
     for (var pid in room.playerIds) {
        final client = _clients[pid];
        if (client != null) {
           client.send(type, data);
        }
     }
  }
}
