// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SplendorCardImpl _$$SplendorCardImplFromJson(Map<String, dynamic> json) =>
    _$SplendorCardImpl(
      id: json['id'] as String,
      tier: (json['tier'] as num).toInt(),
      points: (json['points'] as num).toInt(),
      bonusGem: $enumDecode(_$GemEnumMap, json['bonusGem']),
      cost: (json['cost'] as Map<String, dynamic>).map(
        (k, e) => MapEntry($enumDecode(_$GemEnumMap, k), (e as num).toInt()),
      ),
    );

Map<String, dynamic> _$$SplendorCardImplToJson(_$SplendorCardImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tier': instance.tier,
      'points': instance.points,
      'bonusGem': _$GemEnumMap[instance.bonusGem]!,
      'cost': instance.cost.map((k, e) => MapEntry(_$GemEnumMap[k]!, e)),
    };

const _$GemEnumMap = {
  Gem.white: 'white',
  Gem.blue: 'blue',
  Gem.green: 'green',
  Gem.red: 'red',
  Gem.black: 'black',
  Gem.gold: 'gold',
};
