import 'dart:async';
import 'dart:convert';
import 'package:splendor_shared/splendor_shared.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'game_repository.dart';

// CONTEXT:
// Purpose: Implementation of IGameRepository for Online Play via WebSocket.
// Libraries: splendor_shared, web_socket_channel, dart:convert

class RemoteGameRepository implements IGameRepository {
  final WebSocketChannel _channel;
  final StreamController<GameState> _controller = StreamController<GameState>.broadcast();
  GameState? _cachedState;
  
  // Note: Remote repo relies on Server for Decks. Client does NOT track decks locally.
  // The 'drawReplacement' method returns null because the Server provides the replacement in the 'game_update' broadcast.
  // However, IGameRepository interface demands it. 
  // Architect decision: RemoteGameRepository returns null, assuming Server State already has the new card in the slot?
  // Actually, Splendor protocol we defined sends 'state' json.
  // So client just renders the new state. 
  // The `drawReplacement` on Client is only for UI prediction or Local engine.
  
  RemoteGameRepository(String wsUrl) : _channel = WebSocketChannel.connect(Uri.parse(wsUrl)) {
    _channel.stream.listen(
      (message) => _onMessage(message),
      onError: (e) => print("WS Error: $e"),
      onDone: () => print("WS Closed"),
    );
  }

  final StreamController<Map<String, dynamic>> _eventController = StreamController<Map<String, dynamic>>.broadcast();
  
  Stream<Map<String, dynamic>> get eventStream => _eventController.stream;

  @override
  Stream<GameState> get stateStream => _controller.stream;

  @override
  GameState get currentState {
     if (_cachedState == null) throw Exception("Game state not yet received from server");
     return _cachedState!;
  }

  void _onMessage(dynamic message) {
    try {
      final json = jsonDecode(message as String);
      final type = json['type'];
      final data = json['data'] ?? {};
      
      // Handle Game State updates
      if (type == 'game_started' || type == 'game_update') {
         final stateJson = data['initialState'] ?? data['state'];
         _cachedState = GameState.fromJson(stateJson);
         _controller.add(_cachedState!);
      }
      
      // Forward all messages to event stream (for Lobby UI feedback)
      _eventController.add({'type': type, 'data': data});
      
      if (type == 'error') {
         print("Server Error: ${data['message']}");
      }
    } catch (e) {
      print("Parse Error: $e");
    }
  }

  @override
  Future<void> initialize(List<PlayerIdentity> players) async {
    // For Remote, 'initialize' is generic.
    // If we rely on manual setup via Lobby, this might be unused or just a no-op 
    // to satisfy interface if we treat 'startGame' as the real init.
  }
  
  // Explicit Lobby Actions
  void login(String name) {
     final uuid = "p_${DateTime.now().millisecondsSinceEpoch}"; // Simple ID generation
     // Ideally get from IdentityProvider
     _send('login', {'playerId': uuid, 'name': name});
  }
  
  // Overload for proper ID
  void loginWithId(String uuid, String name) {
     _send('login', {'playerId': uuid, 'name': name});
  }
  
  void createRoom() {
     _send('create_room', {});
  }
  
  void joinRoom(String roomId) {
     _send('join_room', {'roomId': roomId});
  }
  
  void startGame() {
     _send('start_game', {});
  }
  
  void _send(String type, Map<String, dynamic> payload) {
     _channel.sink.add(jsonEncode({'type': type, 'payload': payload}));
  }

  @override
  Future<void> applyAction(Map<String, dynamic> action) async {
    // Send action to server
    // Server expects { 'action': actionMap } inside payload
    _send('game_action', {'action': action});
  }

  @override
  SplendorCard? drawReplacement(int tier) {
    // Server handles this. We return null.
    // The Engine logic in Local needs this, but Remote Engine is on Server.
    return null; 
  }

  @override
  void dispose() {
    _channel.sink.close();
    _controller.close();
  }
}
