import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'game_server.dart';

// CONTEXT:
// Class: ClientConnection
// Purpose: Wraps a single WebSocket connection.
// Libraries: web_socket_channel, dart:convert
class ClientConnection {
  final WebSocketChannel channel;
  final GameServer server;
  String? playerId;
  String name = 'Guest';
  String? roomId; // Current room (lobby or game)

  ClientConnection(this.channel, this.server) {
    channel.stream.listen(
      (message) => _handleMessage(message),
      onDone: () => _handleDisconnect(),
      onError: (e) => _handleError(e),
    );
  }

  void _handleMessage(dynamic message) {
    try {
      final json = jsonDecode(message as String) as Map<String, dynamic>;
      final type = json['type'] as String;
      final payload = json['payload'] as Map<String, dynamic>;
      
      server.handleRequest(this, type, payload);
      
    } catch (e) {
      sendError("Invalid request format: $e");
    }
  }

  void _handleDisconnect() {
    print("Client $playerId disconnected");
    // TODO: Notify room, handle reconnect logic?
  }
  
  void _handleError(error) {
    print("Client error: $error");
  }

  void send(String type, Map<String, dynamic> data) {
    final message = jsonEncode({
      'type': type,
      'data': data
    });
    channel.sink.add(message);
  }

  void sendRaw(Map<String, dynamic> data) {
    channel.sink.add(jsonEncode(data));
  }
  
  void sendError(String message) {
    send('error', {'message': message});
  }
}
