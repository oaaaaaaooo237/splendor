// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_identity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlayerIdentityImpl _$$PlayerIdentityImplFromJson(Map<String, dynamic> json) =>
    _$PlayerIdentityImpl(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      avatarId: json['avatarId'] as String,
      isBot: json['isBot'] as bool? ?? false,
    );

Map<String, dynamic> _$$PlayerIdentityImplToJson(
  _$PlayerIdentityImpl instance,
) => <String, dynamic>{
  'uuid': instance.uuid,
  'name': instance.name,
  'avatarId': instance.avatarId,
  'isBot': instance.isBot,
};
