import 'package:uuid/uuid.dart';
import 'package:splendor_shared/splendor_shared.dart';
import 'game_room.dart';

// CONTEXT:
// Global Variables: None
// Libraries:
// - uuid
// - splendor_shared
// - game_room.dart (Local)

class RoomManager {
  final Map<String, GameRoom> _rooms = {};
  
  // Creates a new room and returns its ID
  String createRoom(List<PlayerIdentity> players) {
     final roomId = const Uuid().v4();
     
     // Use GameSetupHelper to generate State + Decks
     final setup = GameSetupHelper.setupGame(players);
     
     final engine = SplendorGameEngine(
        initialState: setup.initialState,
        winStrategy: PointsWinStrategy(targetPoints: 15),
     );
     
     final room = GameRoom(
       roomId: roomId, 
       engine: engine,
       tier1Deck: setup.deck1,
       tier2Deck: setup.deck2,
       tier3Deck: setup.deck3
     );
     
     _rooms[roomId] = room;
     return roomId;
  }
  
  GameRoom? getRoom(String roomId) {
    return _rooms[roomId];
  }
  
  void removeRoom(String roomId) {
    _rooms.remove(roomId);
  }
}
