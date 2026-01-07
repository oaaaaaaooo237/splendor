import 'package:json_annotation/json_annotation.dart';

enum Gem {
  @JsonValue('white') white,
  @JsonValue('blue') blue,
  @JsonValue('green') green,
  @JsonValue('red') red,
  @JsonValue('black') black,
  @JsonValue('gold') gold; // Joker

  bool get isJoker => this == Gem.gold;
}
