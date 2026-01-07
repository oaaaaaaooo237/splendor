import 'package:splendor_shared/splendor_shared.dart';
import 'package:splendor_shared/src/logic/engine/splendor_game_engine.dart';
import 'package:splendor_shared/src/logic/utils/game_setup_helper.dart';
import 'package:splendor_shared/src/logic/strategies/win_strategy.dart';

// CONTEXT:
// Class: RoomManager
// Purpose: Manages active game rooms and their associated engines.
// Libraries: splendor_shared (GameEngine, SetupHelper, WinStrategy)

class GameRoom {
  final String roomId;
  final String ownerId;
  final SplendorGameEngine engine; // The authoritative game state
  final List<String> playerIds;    // Connected players (mapped to engine indices via PlayerIdentity)
  
  GameRoom({
    required this.roomId, 
    required this.ownerId, 
    required this.engine,
    required this.playerIds
  });
}

class RoomManager {
  final Map<String, GameRoom> _rooms = {};

  /// Creates a new room with the host as the first player.
  /// Returns the roomId.
  String createRoom(String hostId, String hostName) {
    final roomId = "room_${DateTime.now().millisecondsSinceEpoch}_${hostId.substring(0, 3)}";
    
    // Setup initial game state (Host vs ?). 
    // For MVP phase 4, we might start with just Host or empty slots?
    // Let's assume Room creation just Reserves the ID. 
    // BUT checking GameSetupHelper, it requires a list of players to init logic.
    // Approach: Create room -> Lobby State (not engine yet). 
    // Start Game -> Init Engine.
    
    // For V3.2 MVP: Simplify. CreateRoom = Start Lobby. 
    // But since we skipped Lobby UI logic in Phase 3, let's implement the "Auto-Start" or "Lobby" logic here.
    // Let's store a "Lobby" first.
    // Wait, reusing Engine logic from shared? Shared doesn't have "LobbyState".
    // Architect Decision: RoomManager holds `Lobby` state until start.
    
    // To allow Immediate testing: Create Room = Host plays against Bot? Or wait for P2?
    // Let's implement: Create Room -> Waiting (Lobby). Join -> Waiting. Start -> Engine.
    return roomId;
  }
  
  // Actually, to keep it simple and consistent with "Senior Engineer" stability:
  // We need a simple data structure.
  
  final Map<String, List<PlayerIdentity>> _lobbies = {};
  
  String createLobby(String hostId, String hostName) {
     final roomId = "room_${DateTime.now().millisecondsSinceEpoch}";
     _lobbies[roomId] = [PlayerIdentity(uuid: hostId, name: hostName, avatarId: '1')];
     return roomId;
  }
  
  bool joinLobby(String roomId, String playerId, String playerName) {
     if (!_lobbies.containsKey(roomId)) return false;
     if (_lobbies[roomId]!.length >= 4) return false; // Max 4
     
     _lobbies[roomId]!.add(PlayerIdentity(uuid: playerId, name: playerName, avatarId: '2'));
     return true;
  }
  
  GameRoom? startGame(String roomId) {
     if (!_lobbies.containsKey(roomId)) return null;
     
     final players = _lobbies[roomId]!;
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
       playerIds: players.map((p) => p.uuid).toList()
     );
     
     _rooms[roomId] = room;
     _lobbies.remove(roomId); // Lobby promoted to Room
     return room;
  }
  
  GameRoom? getRoom(String roomId) => _rooms[roomId];
}
