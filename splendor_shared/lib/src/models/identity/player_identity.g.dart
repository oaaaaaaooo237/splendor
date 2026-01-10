// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_identity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PlayerIdentity _$$_PlayerIdentityFromJson(Map<String, dynamic> json) =>
    _$_PlayerIdentity(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      avatarId: json['avatarId'] as String,
      isBot: json['isBot'] as bool? ?? false,
    );

Map<String, dynamic> _$$_PlayerIdentityToJson(_$_PlayerIdentity instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'avatarId': instance.avatarId,
      'isBot': instance.isBot,
    };
