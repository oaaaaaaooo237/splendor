// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameStateImpl _$$GameStateImplFromJson(Map<String, dynamic> json) =>
    _$GameStateImpl(
      id: json['id'] as String,
      players: (json['players'] as List<dynamic>)
          .map((e) => PlayerIdentity.fromJson(e as Map<String, dynamic>))
          .toList(),
      turnIndex: (json['turnIndex'] as num).toInt(),
      status: $enumDecode(_$GameStatusEnumMap, json['status']),
      availableGems: (json['availableGems'] as Map<String, dynamic>).map(
        (k, e) => MapEntry($enumDecode(_$GemEnumMap, k), (e as num).toInt()),
      ),
      tier1Cards: (json['tier1Cards'] as List<dynamic>)
          .map((e) => SplendorCard.fromJson(e as Map<String, dynamic>))
          .toList(),
      tier2Cards: (json['tier2Cards'] as List<dynamic>)
          .map((e) => SplendorCard.fromJson(e as Map<String, dynamic>))
          .toList(),
      tier3Cards: (json['tier3Cards'] as List<dynamic>)
          .map((e) => SplendorCard.fromJson(e as Map<String, dynamic>))
          .toList(),
      nobles: (json['nobles'] as List<dynamic>)
          .map((e) => Noble.fromJson(e as Map<String, dynamic>))
          .toList(),
      tier1DeckCount: (json['tier1DeckCount'] as num?)?.toInt() ?? 0,
      tier2DeckCount: (json['tier2DeckCount'] as num?)?.toInt() ?? 0,
      tier3DeckCount: (json['tier3DeckCount'] as num?)?.toInt() ?? 0,
      playerStates: (json['playerStates'] as List<dynamic>)
          .map((e) => PlayerState.fromJson(e as Map<String, dynamic>))
          .toList(),
      draftAction: json['draftAction'] as Map<String, dynamic>?,
      isDraftValid: json['isDraftValid'] as bool? ?? false,
    );

Map<String, dynamic> _$$GameStateImplToJson(_$GameStateImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'players': instance.players,
      'turnIndex': instance.turnIndex,
      'status': _$GameStatusEnumMap[instance.status]!,
      'availableGems': instance.availableGems.map(
        (k, e) => MapEntry(_$GemEnumMap[k]!, e),
      ),
      'tier1Cards': instance.tier1Cards,
      'tier2Cards': instance.tier2Cards,
      'tier3Cards': instance.tier3Cards,
      'nobles': instance.nobles,
      'tier1DeckCount': instance.tier1DeckCount,
      'tier2DeckCount': instance.tier2DeckCount,
      'tier3DeckCount': instance.tier3DeckCount,
      'playerStates': instance.playerStates,
      'draftAction': instance.draftAction,
      'isDraftValid': instance.isDraftValid,
    };

const _$GameStatusEnumMap = {
  GameStatus.lobby: 'lobby',
  GameStatus.playing: 'playing',
  GameStatus.finished: 'finished',
};

const _$GemEnumMap = {
  Gem.white: 'white',
  Gem.blue: 'blue',
  Gem.green: 'green',
  Gem.red: 'red',
  Gem.black: 'black',
  Gem.gold: 'gold',
};

_$PlayerStateImpl _$$PlayerStateImplFromJson(Map<String, dynamic> json) =>
    _$PlayerStateImpl(
      playerId: json['playerId'] as String,
      gems: (json['gems'] as Map<String, dynamic>).map(
        (k, e) => MapEntry($enumDecode(_$GemEnumMap, k), (e as num).toInt()),
      ),
      bonuses: (json['bonuses'] as Map<String, dynamic>).map(
        (k, e) => MapEntry($enumDecode(_$GemEnumMap, k), (e as num).toInt()),
      ),
      reservedCards: (json['reservedCards'] as List<dynamic>)
          .map((e) => SplendorCard.fromJson(e as Map<String, dynamic>))
          .toList(),
      purchasedCards: (json['purchasedCards'] as List<dynamic>)
          .map((e) => SplendorCard.fromJson(e as Map<String, dynamic>))
          .toList(),
      nobles: (json['nobles'] as List<dynamic>)
          .map((e) => Noble.fromJson(e as Map<String, dynamic>))
          .toList(),
      score: (json['score'] as num).toInt(),
    );

Map<String, dynamic> _$$PlayerStateImplToJson(_$PlayerStateImpl instance) =>
    <String, dynamic>{
      'playerId': instance.playerId,
      'gems': instance.gems.map((k, e) => MapEntry(_$GemEnumMap[k]!, e)),
      'bonuses': instance.bonuses.map((k, e) => MapEntry(_$GemEnumMap[k]!, e)),
      'reservedCards': instance.reservedCards,
      'purchasedCards': instance.purchasedCards,
      'nobles': instance.nobles,
      'score': instance.score,
    };
