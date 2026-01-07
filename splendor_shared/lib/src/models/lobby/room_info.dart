import 'package:freezed_annotation/freezed_annotation.dart';
import '../identity/player_identity.dart';

part 'room_info.freezed.dart';
part 'room_info.g.dart';

@freezed
class RoomInfo with _$RoomInfo {
  const factory RoomInfo({
    required String roomId,
    required String hostName,
    required int playerCount,
    required int maxPlayers,
    required bool isLocked, // Has password
    required String status, // 'waiting', 'playing'
  }) = _RoomInfo;

  factory RoomInfo.fromJson(Map<String, dynamic> json) => _$RoomInfoFromJson(json);
}

@freezed
class RoomDetail with _$RoomDetail {
  const factory RoomDetail({
    required String roomId,
    required String hostId,
    required List<PlayerIdentity> players,
    required Map<String, bool> readyStates, // playerId -> isReady
    required GameSettings settings,
  }) = _RoomDetail;

  factory RoomDetail.fromJson(Map<String, dynamic> json) => _$RoomDetailFromJson(json);
}

@freezed
class GameSettings with _$GameSettings {
  const factory GameSettings({
    @Default(15) int winScore,
    @Default(30) int maxTurnTimeSeconds,
    @Default('score') String winMode, // 'score', 'rounds', 'time'
  }) = _GameSettings;

  factory GameSettings.fromJson(Map<String, dynamic> json) => _$GameSettingsFromJson(json);
}
