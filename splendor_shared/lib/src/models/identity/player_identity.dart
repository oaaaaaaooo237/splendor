import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_identity.freezed.dart';
part 'player_identity.g.dart';

@freezed
class PlayerIdentity with _$PlayerIdentity {
  const factory PlayerIdentity({
    required String uuid,
    required String name,
    required String avatarId,
    @Default(false) bool isBot,
  }) = _PlayerIdentity;

  factory PlayerIdentity.fromJson(Map<String, dynamic> json) => _$PlayerIdentityFromJson(json);
}
