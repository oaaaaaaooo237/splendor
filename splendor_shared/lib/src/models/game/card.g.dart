// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SplendorCard _$$_SplendorCardFromJson(Map<String, dynamic> json) =>
    _$_SplendorCard(
      id: json['id'] as String,
      tier: json['tier'] as int,
      points: json['points'] as int,
      bonusGem: $enumDecode(_$GemEnumMap, json['bonusGem']),
      cost: (json['cost'] as Map<String, dynamic>).map(
        (k, e) => MapEntry($enumDecode(_$GemEnumMap, k), e as int),
      ),
    );

Map<String, dynamic> _$$_SplendorCardToJson(_$_SplendorCard instance) =>
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
