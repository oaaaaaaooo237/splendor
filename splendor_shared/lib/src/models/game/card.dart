import 'package:freezed_annotation/freezed_annotation.dart';
import 'gem.dart';

part 'card.freezed.dart';
part 'card.g.dart';

@freezed
class SplendorCard with _$SplendorCard {
  const factory SplendorCard({
    required String id,
    required int tier, // 1, 2, 3
    required int points,
    required Gem bonusGem, // The gem this card provides
    required Map<Gem, int> cost, // Cost to buy this card
  }) = _SplendorCard;

  factory SplendorCard.fromJson(Map<String, dynamic> json) => _$SplendorCardFromJson(json);
}
