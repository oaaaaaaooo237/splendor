// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'noble.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NobleImpl _$$NobleImplFromJson(Map<String, dynamic> json) => _$NobleImpl(
  id: json['id'] as String,
  points: (json['points'] as num).toInt(),
  requirements: (json['requirements'] as Map<String, dynamic>).map(
    (k, e) => MapEntry($enumDecode(_$GemEnumMap, k), (e as num).toInt()),
  ),
);

Map<String, dynamic> _$$NobleImplToJson(_$NobleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'points': instance.points,
      'requirements': instance.requirements.map(
        (k, e) => MapEntry(_$GemEnumMap[k]!, e),
      ),
    };

const _$GemEnumMap = {
  Gem.white: 'white',
  Gem.blue: 'blue',
  Gem.green: 'green',
  Gem.red: 'red',
  Gem.black: 'black',
  Gem.gold: 'gold',
};
