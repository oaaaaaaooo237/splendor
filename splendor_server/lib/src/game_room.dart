import 'dart:convert';
import 'package:splendor_shared/splendor_shared.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

// CONTEXT:
// Global Variables: None
// Libraries:
// - dart:async, dart:convert
// - splendor_shared (GameEngine, GameState, etc.)
// - web_socket_channel (WebSocketChannel)

class GameRoom {
  final String roomId;
  final SplendorGameEngine _engine;
  
  // Players: Map<PlayerId, WebSocketChannel>
  final Map<String, WebSocketChannel> _clients = {};
  
  // Decks (Hidden from Clients, managed here)
  final List<SplendorCard> _tier1Deck;
  final List<SplendorCard> _tier2Deck;
  final List<SplendorCard> _tier3Deck;

  GameRoom({
    required this.roomId,
    required SplendorGameEngine engine,
    required List<SplendorCard> tier1Deck,
    required List<SplendorCard> tier2Deck,
    required List<SplendorCard> tier3Deck,
  }) : _engine = engine,
       _tier1Deck = tier1Deck,
       _tier2Deck = tier2Deck,
       _tier3Deck = tier3Deck;

  GameState get state => _engine.currentState;

  void addClient(String playerId, WebSocketChannel channel) {
    _clients[playerId] = channel;
    
    // Listen to messages
    channel.stream.listen((message) {
      _handleMessage(playerId, message);
    }, onDone: () {
      _removeClient(playerId);
    }, onError: (e) {
      print("WS Error for $playerId: $e");
      _removeClient(playerId);
    });
    
    // Send initial state
    _sendState(channel);
  }

  void _removeClient(String playerId) {
    _clients.remove(playerId);
    // Determine if game should pause or player replaced by Bot?
    // For MVP, just log it.
    print("Player $playerId disconnected.");
  }

  void _handleMessage(String playerId, dynamic message) {
    try {
      final decoded = jsonDecode(message as String);
      final type = decoded['type'];
      
      if (type == 'action') {
        final action = decoded['payload'];
        // Ensure action has playerId and it matches sender
        action['playerId'] = playerId; 
        
        // Handle Deck replacements if buying/reserving
        // NOTE: Engine.applyAction expects 'replacementCard' in payload if needed.
        // We must inspect the action type and Inject replacement card from our hidden deck BEFORE calling engine.
        _injectReplacementCard(action);

        _engine.applyAction(action);
        _broadcastState();
      
      } else if (type == 'chat') {
        // Broadcast chat
      }
    } catch (e) {
       _sendError(_clients[playerId], e.toString());
    }
  }

  void _injectReplacementCard(Map<String, dynamic> action) {
     final type = action['type'];
     bool needsReplacement = false;
     int tier = 0;
     
     // Logic to determine if card is removed from board
     if (type == 'buy_card' || type == 'reserve_card') {
        final cardId = action['cardId'];
        // Find card locally in current state to know tier
        // This is tricky if ID doesn't contain tier info.
        // My IDs are 't1_x', 't2_x'.
        if (cardId.toString().startsWith('t1_')) {
          tier = 1;
        } else if (cardId.toString().startsWith('t2_')) {
          tier = 2;
        } else if (cardId.toString().startsWith('t3_')) {
          tier = 3;
        }
        
        needsReplacement = true;
     }
     
     if (needsReplacement && tier > 0) {
        SplendorCard? replacement;
        if (tier == 1 && _tier1Deck.isNotEmpty) {
           replacement = _tier1Deck.removeLast();
        }
        if (tier == 2 && _tier2Deck.isNotEmpty) {
           replacement = _tier2Deck.removeLast();
        }
        if (tier == 3 && _tier3Deck.isNotEmpty) {
           replacement = _tier3Deck.removeLast();
        }
        
        if (replacement != null) {
           action['replacementCard'] = replacement.toJson();
        }
     }
  }

  void _broadcastState() {
    final stateJson = jsonEncode({
      'type': 'state_update',
      'payload': _engine.currentState.toJson()
    });
    
    for (final client in _clients.values) {
      client.sink.add(stateJson);
    }
  }
  
  void _sendState(WebSocketChannel channel) {
    channel.sink.add(jsonEncode({
      'type': 'state_update',
      'payload': _engine.currentState.toJson()
    }));
  }

  void _sendError(WebSocketChannel? channel, String error) {
    channel?.sink.add(jsonEncode({
      'type': 'error',
      'message': error
    }));
  }
}
