// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JoinRoomImpl _$$JoinRoomImplFromJson(Map<String, dynamic> json) =>
    _$JoinRoomImpl(
      roomId: json['roomId'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$JoinRoomImplToJson(_$JoinRoomImpl instance) =>
    <String, dynamic>{'roomId': instance.roomId, 'runtimeType': instance.$type};

_$ReadyImpl _$$ReadyImplFromJson(Map<String, dynamic> json) => _$ReadyImpl(
  isReady: json['isReady'] as bool,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$$ReadyImplToJson(_$ReadyImpl instance) =>
    <String, dynamic>{
      'isReady': instance.isReady,
      'runtimeType': instance.$type,
    };

_$ActionImpl _$$ActionImplFromJson(Map<String, dynamic> json) => _$ActionImpl(
  actionData: json['actionData'] as Map<String, dynamic>,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$$ActionImplToJson(_$ActionImpl instance) =>
    <String, dynamic>{
      'actionData': instance.actionData,
      'runtimeType': instance.$type,
    };

_$ChatImpl _$$ChatImplFromJson(Map<String, dynamic> json) => _$ChatImpl(
  message: json['message'] as String,
  emoji: json['emoji'] as String?,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$$ChatImplToJson(_$ChatImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'emoji': instance.emoji,
      'runtimeType': instance.$type,
    };

_$LobbyUpdateImpl _$$LobbyUpdateImplFromJson(Map<String, dynamic> json) =>
    _$LobbyUpdateImpl(
      rooms: json['rooms'] as List<dynamic>,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$LobbyUpdateImplToJson(_$LobbyUpdateImpl instance) =>
    <String, dynamic>{'rooms': instance.rooms, 'runtimeType': instance.$type};

_$GameStateUpdateImpl _$$GameStateUpdateImplFromJson(
  Map<String, dynamic> json,
) => _$GameStateUpdateImpl(
  state: json['state'] as Map<String, dynamic>,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$$GameStateUpdateImplToJson(
  _$GameStateUpdateImpl instance,
) => <String, dynamic>{'state': instance.state, 'runtimeType': instance.$type};

_$ErrorImpl _$$ErrorImplFromJson(Map<String, dynamic> json) => _$ErrorImpl(
  message: json['message'] as String,
  code: json['code'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$$ErrorImplToJson(_$ErrorImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'runtimeType': instance.$type,
    };

_$NotificationImpl _$$NotificationImplFromJson(Map<String, dynamic> json) =>
    _$NotificationImpl(
      message: json['message'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$NotificationImplToJson(_$NotificationImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'runtimeType': instance.$type,
    };
