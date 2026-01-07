import 'package:freezed_annotation/freezed_annotation.dart';

part 'messages.freezed.dart';
part 'messages.g.dart';

@freezed
class ClientMessage with _$ClientMessage {
  const factory ClientMessage.joinRoom({required String roomId}) = _JoinRoom;
  const factory ClientMessage.ready({required bool isReady}) = _Ready;
  const factory ClientMessage.action({required Map<String, dynamic> actionData}) = _Action;
  const factory ClientMessage.chat({required String message, String? emoji}) = _Chat;
  
  factory ClientMessage.fromJson(Map<String, dynamic> json) => _$ClientMessageFromJson(json);
}

@freezed
class ServerMessage with _$ServerMessage {
  const factory ServerMessage.lobbyUpdate({required List<dynamic> rooms}) = _LobbyUpdate; // Replace dynamic with RoomInfo
  const factory ServerMessage.gameStateUpdate({required Map<String, dynamic> state}) = _GameStateUpdate; // Replace dynamic with GameState
  const factory ServerMessage.error({required String message, required String code}) = _Error;
  const factory ServerMessage.notification({required String message}) = _Notification;
  
  factory ServerMessage.fromJson(Map<String, dynamic> json) => _$ServerMessageFromJson(json);
}
