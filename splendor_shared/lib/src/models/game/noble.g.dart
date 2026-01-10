// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'noble.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Noble _$$_NobleFromJson(Map<String, dynamic> json) => _$_Noble(
      id: json['id'] as String,
      points: json['points'] as int,
      requirements: (json['requirements'] as Map<String, dynamic>).map(
        (k, e) => MapEntry($enumDecode(_$GemEnumMap, k), e as int),
      ),
    );

Map<String, dynamic> _$$_NobleToJson(_$_Noble instance) => <String, dynamic>{
      'id': instance.id,
      'points': instance.points,
      'requirements':
          instance.requirements.map((k, e) => MapEntry(_$GemEnumMap[k]!, e)),
    };

const _$GemEnumMap = {
  Gem.white: 'white',
  Gem.blue: 'blue',
  Gem.green: 'green',
  Gem.red: 'red',
  Gem.black: 'black',
  Gem.gold: 'gold',
};
