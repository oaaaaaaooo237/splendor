// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_JoinRoom _$$_JoinRoomFromJson(Map<String, dynamic> json) => _$_JoinRoom(
      roomId: json['roomId'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_JoinRoomToJson(_$_JoinRoom instance) =>
    <String, dynamic>{
      'roomId': instance.roomId,
      'runtimeType': instance.$type,
    };

_$_Ready _$$_ReadyFromJson(Map<String, dynamic> json) => _$_Ready(
      isReady: json['isReady'] as bool,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_ReadyToJson(_$_Ready instance) => <String, dynamic>{
      'isReady': instance.isReady,
      'runtimeType': instance.$type,
    };

_$_Action _$$_ActionFromJson(Map<String, dynamic> json) => _$_Action(
      actionData: json['actionData'] as Map<String, dynamic>,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_ActionToJson(_$_Action instance) => <String, dynamic>{
      'actionData': instance.actionData,
      'runtimeType': instance.$type,
    };

_$_Chat _$$_ChatFromJson(Map<String, dynamic> json) => _$_Chat(
      message: json['message'] as String,
      emoji: json['emoji'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_ChatToJson(_$_Chat instance) => <String, dynamic>{
      'message': instance.message,
      'emoji': instance.emoji,
      'runtimeType': instance.$type,
    };

_$_LobbyUpdate _$$_LobbyUpdateFromJson(Map<String, dynamic> json) =>
    _$_LobbyUpdate(
      rooms: json['rooms'] as List<dynamic>,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_LobbyUpdateToJson(_$_LobbyUpdate instance) =>
    <String, dynamic>{
      'rooms': instance.rooms,
      'runtimeType': instance.$type,
    };

_$_GameStateUpdate _$$_GameStateUpdateFromJson(Map<String, dynamic> json) =>
    _$_GameStateUpdate(
      state: json['state'] as Map<String, dynamic>,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_GameStateUpdateToJson(_$_GameStateUpdate instance) =>
    <String, dynamic>{
      'state': instance.state,
      'runtimeType': instance.$type,
    };

_$_Error _$$_ErrorFromJson(Map<String, dynamic> json) => _$_Error(
      message: json['message'] as String,
      code: json['code'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_ErrorToJson(_$_Error instance) => <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'runtimeType': instance.$type,
    };

_$_Notification _$$_NotificationFromJson(Map<String, dynamic> json) =>
    _$_Notification(
      message: json['message'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_NotificationToJson(_$_Notification instance) =>
    <String, dynamic>{
      'message': instance.message,
      'runtimeType': instance.$type,
    };
