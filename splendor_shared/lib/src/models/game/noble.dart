import 'package:freezed_annotation/freezed_annotation.dart';
import 'gem.dart';

part 'noble.freezed.dart';
part 'noble.g.dart';

@freezed
class Noble with _$Noble {
  const factory Noble({
    required String id,
    required int points,
    required Map<Gem, int> requirements,
  }) = _Noble;

  factory Noble.fromJson(Map<String, dynamic> json) => _$NobleFromJson(json);
}
