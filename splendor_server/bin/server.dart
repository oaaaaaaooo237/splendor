import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf_web_socket/shelf_web_socket.dart';
import 'package:splendor_server/server/game_server.dart';

// CONTEXT:
// Purpose: Entry point for the server application.
// Libraries: shelf_io, shelf_web_socket, splendor_server
void main() async {
  final gameServer = GameServer();
  
  // Define Routes
  final app = Router();

  // 1. Health Check (for Client "test connection")
  app.get('/health', (Request request) {
    return Response.ok('Splendor Server is Running');
  });

  // 2. WebSocket Handler (for Game)
  final wsHandler = webSocketHandler(gameServer.handleConnection);
  app.all('/', wsHandler); // Handle WS at root
  // Some clients might connect to /game or /ws, let's catch-all or alias if needed
  // For now, root is standard.

  // Serve with 0.0.0.0 (CRITICAL for Docker)
  // Use 'InternetAddress.anyIPv4' to listen on all interfaces.
  final server = await shelf_io.serve(app, InternetAddress.anyIPv4, 8080);
  
  print('Splendor Server v3.2 running at ws://${server.address.host}:${server.port}');
  print('Health check available at http://${server.address.host}:${server.port}/health');
}
