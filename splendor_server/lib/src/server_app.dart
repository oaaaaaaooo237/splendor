import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf_web_socket/shelf_web_socket.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:splendor_shared/splendor_shared.dart';
import 'room_manager.dart';

// CONTEXT:
// Global Variables: _roomManager (Singleton within App instance for now, or static)
// Libraries: shelf, shelf_router, shelf_web_socket, splendor_shared, [room_manager.dart]

class ServerApp {
  final RoomManager _roomManager = RoomManager();

  Handler createHandler() {
    final router = Router()
      ..get('/', _rootHandler)
      ..post('/api/create_room', _createRoomPostHandler)
      ..get('/ws/game/<roomId>', _wsHandler);

    return Pipeline()
        .addMiddleware(logRequests())
        .addMiddleware(_corsMiddleware())
        .addHandler(router.call);
  }

  Response _rootHandler(Request req) {
    return Response.ok('Splendor Game Server Running\n');
  }

  Future<Response> _createRoomPostHandler(Request request) async {
     try {
       final payload = await request.readAsString();
       final data = jsonDecode(payload);
       final playersData = (data['players'] as List).cast<Map<String, dynamic>>();
       final players = playersData.map((p) => PlayerIdentity.fromJson(p)).toList();
       
       final roomId = _roomManager.createRoom(players);
       
       return Response.ok(jsonEncode({'roomId': roomId}), headers: {'content-type': 'application/json'});
     } catch (e) {
       return Response.internalServerError(body: "Error creating room: $e");
     }
  }

  Handler get _wsHandler => (Request request) {
      final roomId = request.params['roomId']!;
      final playerId = request.url.queryParameters['playerId'];
      
      if (playerId == null) return Response.forbidden("Missing playerId");
      
      final room = _roomManager.getRoom(roomId);
      if (room == null) return Response.notFound("Room not found");
      
      final handler = webSocketHandler((WebSocketChannel webSocket, String? protocol) {
         print("WS Connected: $playerId -> $roomId");
         room.addClient(playerId, webSocket);
      });
      
      return handler(request);
  };

  Middleware _corsMiddleware() {
    return createMiddleware(
      requestHandler: (request) {
        if (request.method == 'OPTIONS') {
          return Response.ok('', headers: {
            'Access-Control-Allow-Origin': '*',
            'Access-Control-Allow-Methods': 'GET, POST, OPTIONS',
            'Access-Control-Allow-Headers': 'Origin, Content-Type',
          });
        }
        return null;
      },
      responseHandler: (response) {
        return response.change(headers: {
          'Access-Control-Allow-Origin': '*',
        });
      },
    );
  }
}
