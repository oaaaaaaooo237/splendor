// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoomInfoImpl _$$RoomInfoImplFromJson(Map<String, dynamic> json) =>
    _$RoomInfoImpl(
      roomId: json['roomId'] as String,
      hostName: json['hostName'] as String,
      playerCount: (json['playerCount'] as num).toInt(),
      maxPlayers: (json['maxPlayers'] as num).toInt(),
      isLocked: json['isLocked'] as bool,
      status: json['status'] as String,
    );

Map<String, dynamic> _$$RoomInfoImplToJson(_$RoomInfoImpl instance) =>
    <String, dynamic>{
      'roomId': instance.roomId,
      'hostName': instance.hostName,
      'playerCount': instance.playerCount,
      'maxPlayers': instance.maxPlayers,
      'isLocked': instance.isLocked,
      'status': instance.status,
    };

_$RoomDetailImpl _$$RoomDetailImplFromJson(Map<String, dynamic> json) =>
    _$RoomDetailImpl(
      roomId: json['roomId'] as String,
      hostId: json['hostId'] as String,
      players: (json['players'] as List<dynamic>)
          .map((e) => PlayerIdentity.fromJson(e as Map<String, dynamic>))
          .toList(),
      readyStates: Map<String, bool>.from(json['readyStates'] as Map),
      settings: GameSettings.fromJson(json['settings'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RoomDetailImplToJson(_$RoomDetailImpl instance) =>
    <String, dynamic>{
      'roomId': instance.roomId,
      'hostId': instance.hostId,
      'players': instance.players,
      'readyStates': instance.readyStates,
      'settings': instance.settings,
    };

_$GameSettingsImpl _$$GameSettingsImplFromJson(Map<String, dynamic> json) =>
    _$GameSettingsImpl(
      winScore: (json['winScore'] as num?)?.toInt() ?? 15,
      maxTurnTimeSeconds: (json['maxTurnTimeSeconds'] as num?)?.toInt() ?? 30,
      winMode: json['winMode'] as String? ?? 'score',
    );

Map<String, dynamic> _$$GameSettingsImplToJson(_$GameSettingsImpl instance) =>
    <String, dynamic>{
      'winScore': instance.winScore,
      'maxTurnTimeSeconds': instance.maxTurnTimeSeconds,
      'winMode': instance.winMode,
    };
