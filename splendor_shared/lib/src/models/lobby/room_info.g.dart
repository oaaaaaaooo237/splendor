// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RoomInfo _$$_RoomInfoFromJson(Map<String, dynamic> json) => _$_RoomInfo(
      roomId: json['roomId'] as String,
      hostName: json['hostName'] as String,
      playerCount: json['playerCount'] as int,
      maxPlayers: json['maxPlayers'] as int,
      isLocked: json['isLocked'] as bool,
      status: json['status'] as String,
    );

Map<String, dynamic> _$$_RoomInfoToJson(_$_RoomInfo instance) =>
    <String, dynamic>{
      'roomId': instance.roomId,
      'hostName': instance.hostName,
      'playerCount': instance.playerCount,
      'maxPlayers': instance.maxPlayers,
      'isLocked': instance.isLocked,
      'status': instance.status,
    };

_$_RoomDetail _$$_RoomDetailFromJson(Map<String, dynamic> json) =>
    _$_RoomDetail(
      roomId: json['roomId'] as String,
      hostId: json['hostId'] as String,
      players: (json['players'] as List<dynamic>)
          .map((e) => PlayerIdentity.fromJson(e as Map<String, dynamic>))
          .toList(),
      readyStates: Map<String, bool>.from(json['readyStates'] as Map),
      settings: GameSettings.fromJson(json['settings'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_RoomDetailToJson(_$_RoomDetail instance) =>
    <String, dynamic>{
      'roomId': instance.roomId,
      'hostId': instance.hostId,
      'players': instance.players,
      'readyStates': instance.readyStates,
      'settings': instance.settings,
    };

_$_GameSettings _$$_GameSettingsFromJson(Map<String, dynamic> json) =>
    _$_GameSettings(
      winScore: json['winScore'] as int? ?? 15,
      maxTurnTimeSeconds: json['maxTurnTimeSeconds'] as int? ?? 30,
      winMode: json['winMode'] as String? ?? 'score',
    );

Map<String, dynamic> _$$_GameSettingsToJson(_$_GameSettings instance) =>
    <String, dynamic>{
      'winScore': instance.winScore,
      'maxTurnTimeSeconds': instance.maxTurnTimeSeconds,
      'winMode': instance.winMode,
    };
