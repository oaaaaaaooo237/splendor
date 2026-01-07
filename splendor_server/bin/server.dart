import 'dart:io';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_web_socket/shelf_web_socket.dart';
import '../lib/server/game_server.dart';

// CONTEXT:
// Purpose: Entry point for the server application.
// Libraries: shelf_io, shelf_web_socket, splendor_server
void main() async {
  final gameServer = GameServer();
  
  // Create the WebSocket handler
  final handler = webSocketHandler(gameServer.handleConnection);

  // Serve on localhost:8080
  final server = await shelf_io.serve(handler, 'localhost', 8080);
  print('Splendor Server v3.2 running at ws://${server.address.host}:${server.port}');
}
