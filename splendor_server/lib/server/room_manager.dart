import 'package:splendor_shared/splendor_shared.dart';
import 'dart:async';
// Class: RoomManager
// Purpose: Manages active game rooms and their associated engines.
// Libraries: splendor_shared (GameEngine, SetupHelper, WinStrategy)



class GameRoom {
  final String roomId;
  final String ownerId;
  final SplendorGameEngine engine; // The authoritative game state
  final List<String> playerIds;    // Connected players (mapped to engine indices via PlayerIdentity)
  final List<PlayerIdentity> playerIdentities; 
  final int turnDuration; // Configurable duration
  
  Timer? _turnTimer;
  void Function(GameRoom room, String type, Map<String, dynamic> data)? onBroadcast;

  GameRoom({
    required this.roomId, 
    required this.ownerId, 
    required this.engine,
    required this.playerIds,
    required this.playerIdentities,
    this.turnDuration = 45, // Default
    this.onBroadcast,
  });

  void startTurnTimer() {
    _turnTimer?.cancel();
    _turnTimer = Timer(Duration(seconds: turnDuration), _onTimeout);
  }

  void stopTimer() {
    _turnTimer?.cancel();
  }

  void _onTimeout() {
    print("Room $roomId: Turn Timeout");
    engine.resolveTimeout();
    
    // Broadcast update
    if (onBroadcast != null) {
        onBroadcast!(this, 'game_update', {
             'state': engine.currentState.toJson(),
             'lastAction': {'type': 'timeout'}
        });
    }
    
    // Restart timer for next player
    if (engine.currentState.status == GameStatus.playing) {
        startTurnTimer();
    }
  }
}

class RoomManager {
  final Map<String, GameRoom> _rooms = {};
  final Map<String, List<PlayerIdentity>> _lobbies = {};
  final Map<String, Map<String, dynamic>> _lobbySettings = {}; // Store settings for lobbies

  String createLobby(String hostId, String hostName, {String? customId, Map<String, dynamic>? settings}) {
     // Check if custom ID is unique and valid
     final roomId = (customId != null && customId.isNotEmpty && !_lobbies.containsKey(customId) && !_rooms.containsKey(customId))
         ? customId 
         : "room_${DateTime.now().millisecondsSinceEpoch % 100000}";
     
     _lobbies[roomId] = [PlayerIdentity(uuid: hostId, name: hostName, avatarId: '1')];
     if (settings != null) {
        _lobbySettings[roomId] = settings;
     }
     return roomId;
  }
  
  bool joinLobby(String roomId, String playerId, String playerName) {
     if (!_lobbies.containsKey(roomId)) return false;
     if (_lobbies[roomId]!.length >= 4) return false; // Max 4
     
     // Avoid duplicates
     if (_lobbies[roomId]!.any((p) => p.uuid == playerId)) return true;

     _lobbies[roomId]!.add(PlayerIdentity(uuid: playerId, name: playerName, avatarId: '2'));
     return true;
  }

  List<PlayerIdentity>? getLobbyPlayers(String roomId) => _lobbies[roomId];
  
  GameRoom? startGame(String roomId) {
     if (!_lobbies.containsKey(roomId)) return null;
     
     final players = List<PlayerIdentity>.from(_lobbies[roomId]!);
     // Use Shared Setup Helper
     final setup = GameSetupHelper.setupGame(players);
     
     final engine = SplendorGameEngine(
        initialState: setup.initialState,
        winStrategy: PointsWinStrategy(targetPoints: 15)
     );
     
     final room = GameRoom(
       roomId: roomId,
       ownerId: players.first.uuid,
       engine: engine,
       playerIds: players.map((p) => p.uuid).toList(),
       playerIdentities: players,
       turnDuration: _lobbySettings[roomId]?['turnDuration'] ?? 45,
     );
     
     _rooms[roomId] = room;
     _lobbies.remove(roomId); // Lobby promoted to Room
     _lobbySettings.remove(roomId);
     return room;
  }
  
  GameRoom? getRoom(String roomId) => _rooms[roomId];
}
