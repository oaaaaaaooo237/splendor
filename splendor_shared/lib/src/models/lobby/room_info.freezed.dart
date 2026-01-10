// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RoomInfo _$RoomInfoFromJson(Map<String, dynamic> json) {
  return _RoomInfo.fromJson(json);
}

/// @nodoc
mixin _$RoomInfo {
  String get roomId => throw _privateConstructorUsedError;
  String get hostName => throw _privateConstructorUsedError;
  int get playerCount => throw _privateConstructorUsedError;
  int get maxPlayers => throw _privateConstructorUsedError;
  bool get isLocked => throw _privateConstructorUsedError; // Has password
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoomInfoCopyWith<RoomInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomInfoCopyWith<$Res> {
  factory $RoomInfoCopyWith(RoomInfo value, $Res Function(RoomInfo) then) =
      _$RoomInfoCopyWithImpl<$Res, RoomInfo>;
  @useResult
  $Res call(
      {String roomId,
      String hostName,
      int playerCount,
      int maxPlayers,
      bool isLocked,
      String status});
}

/// @nodoc
class _$RoomInfoCopyWithImpl<$Res, $Val extends RoomInfo>
    implements $RoomInfoCopyWith<$Res> {
  _$RoomInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? hostName = null,
    Object? playerCount = null,
    Object? maxPlayers = null,
    Object? isLocked = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      hostName: null == hostName
          ? _value.hostName
          : hostName // ignore: cast_nullable_to_non_nullable
              as String,
      playerCount: null == playerCount
          ? _value.playerCount
          : playerCount // ignore: cast_nullable_to_non_nullable
              as int,
      maxPlayers: null == maxPlayers
          ? _value.maxPlayers
          : maxPlayers // ignore: cast_nullable_to_non_nullable
              as int,
      isLocked: null == isLocked
          ? _value.isLocked
          : isLocked // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RoomInfoCopyWith<$Res> implements $RoomInfoCopyWith<$Res> {
  factory _$$_RoomInfoCopyWith(
          _$_RoomInfo value, $Res Function(_$_RoomInfo) then) =
      __$$_RoomInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String roomId,
      String hostName,
      int playerCount,
      int maxPlayers,
      bool isLocked,
      String status});
}

/// @nodoc
class __$$_RoomInfoCopyWithImpl<$Res>
    extends _$RoomInfoCopyWithImpl<$Res, _$_RoomInfo>
    implements _$$_RoomInfoCopyWith<$Res> {
  __$$_RoomInfoCopyWithImpl(
      _$_RoomInfo _value, $Res Function(_$_RoomInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? hostName = null,
    Object? playerCount = null,
    Object? maxPlayers = null,
    Object? isLocked = null,
    Object? status = null,
  }) {
    return _then(_$_RoomInfo(
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      hostName: null == hostName
          ? _value.hostName
          : hostName // ignore: cast_nullable_to_non_nullable
              as String,
      playerCount: null == playerCount
          ? _value.playerCount
          : playerCount // ignore: cast_nullable_to_non_nullable
              as int,
      maxPlayers: null == maxPlayers
          ? _value.maxPlayers
          : maxPlayers // ignore: cast_nullable_to_non_nullable
              as int,
      isLocked: null == isLocked
          ? _value.isLocked
          : isLocked // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RoomInfo implements _RoomInfo {
  const _$_RoomInfo(
      {required this.roomId,
      required this.hostName,
      required this.playerCount,
      required this.maxPlayers,
      required this.isLocked,
      required this.status});

  factory _$_RoomInfo.fromJson(Map<String, dynamic> json) =>
      _$$_RoomInfoFromJson(json);

  @override
  final String roomId;
  @override
  final String hostName;
  @override
  final int playerCount;
  @override
  final int maxPlayers;
  @override
  final bool isLocked;
// Has password
  @override
  final String status;

  @override
  String toString() {
    return 'RoomInfo(roomId: $roomId, hostName: $hostName, playerCount: $playerCount, maxPlayers: $maxPlayers, isLocked: $isLocked, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RoomInfo &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.hostName, hostName) ||
                other.hostName == hostName) &&
            (identical(other.playerCount, playerCount) ||
                other.playerCount == playerCount) &&
            (identical(other.maxPlayers, maxPlayers) ||
                other.maxPlayers == maxPlayers) &&
            (identical(other.isLocked, isLocked) ||
                other.isLocked == isLocked) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, roomId, hostName, playerCount, maxPlayers, isLocked, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RoomInfoCopyWith<_$_RoomInfo> get copyWith =>
      __$$_RoomInfoCopyWithImpl<_$_RoomInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RoomInfoToJson(
      this,
    );
  }
}

abstract class _RoomInfo implements RoomInfo {
  const factory _RoomInfo(
      {required final String roomId,
      required final String hostName,
      required final int playerCount,
      required final int maxPlayers,
      required final bool isLocked,
      required final String status}) = _$_RoomInfo;

  factory _RoomInfo.fromJson(Map<String, dynamic> json) = _$_RoomInfo.fromJson;

  @override
  String get roomId;
  @override
  String get hostName;
  @override
  int get playerCount;
  @override
  int get maxPlayers;
  @override
  bool get isLocked;
  @override // Has password
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$_RoomInfoCopyWith<_$_RoomInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

RoomDetail _$RoomDetailFromJson(Map<String, dynamic> json) {
  return _RoomDetail.fromJson(json);
}

/// @nodoc
mixin _$RoomDetail {
  String get roomId => throw _privateConstructorUsedError;
  String get hostId => throw _privateConstructorUsedError;
  List<PlayerIdentity> get players => throw _privateConstructorUsedError;
  Map<String, bool> get readyStates =>
      throw _privateConstructorUsedError; // playerId -> isReady
  GameSettings get settings => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoomDetailCopyWith<RoomDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomDetailCopyWith<$Res> {
  factory $RoomDetailCopyWith(
          RoomDetail value, $Res Function(RoomDetail) then) =
      _$RoomDetailCopyWithImpl<$Res, RoomDetail>;
  @useResult
  $Res call(
      {String roomId,
      String hostId,
      List<PlayerIdentity> players,
      Map<String, bool> readyStates,
      GameSettings settings});

  $GameSettingsCopyWith<$Res> get settings;
}

/// @nodoc
class _$RoomDetailCopyWithImpl<$Res, $Val extends RoomDetail>
    implements $RoomDetailCopyWith<$Res> {
  _$RoomDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? hostId = null,
    Object? players = null,
    Object? readyStates = null,
    Object? settings = null,
  }) {
    return _then(_value.copyWith(
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      hostId: null == hostId
          ? _value.hostId
          : hostId // ignore: cast_nullable_to_non_nullable
              as String,
      players: null == players
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as List<PlayerIdentity>,
      readyStates: null == readyStates
          ? _value.readyStates
          : readyStates // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as GameSettings,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GameSettingsCopyWith<$Res> get settings {
    return $GameSettingsCopyWith<$Res>(_value.settings, (value) {
      return _then(_value.copyWith(settings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_RoomDetailCopyWith<$Res>
    implements $RoomDetailCopyWith<$Res> {
  factory _$$_RoomDetailCopyWith(
          _$_RoomDetail value, $Res Function(_$_RoomDetail) then) =
      __$$_RoomDetailCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String roomId,
      String hostId,
      List<PlayerIdentity> players,
      Map<String, bool> readyStates,
      GameSettings settings});

  @override
  $GameSettingsCopyWith<$Res> get settings;
}

/// @nodoc
class __$$_RoomDetailCopyWithImpl<$Res>
    extends _$RoomDetailCopyWithImpl<$Res, _$_RoomDetail>
    implements _$$_RoomDetailCopyWith<$Res> {
  __$$_RoomDetailCopyWithImpl(
      _$_RoomDetail _value, $Res Function(_$_RoomDetail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? hostId = null,
    Object? players = null,
    Object? readyStates = null,
    Object? settings = null,
  }) {
    return _then(_$_RoomDetail(
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      hostId: null == hostId
          ? _value.hostId
          : hostId // ignore: cast_nullable_to_non_nullable
              as String,
      players: null == players
          ? _value._players
          : players // ignore: cast_nullable_to_non_nullable
              as List<PlayerIdentity>,
      readyStates: null == readyStates
          ? _value._readyStates
          : readyStates // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as GameSettings,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RoomDetail implements _RoomDetail {
  const _$_RoomDetail(
      {required this.roomId,
      required this.hostId,
      required final List<PlayerIdentity> players,
      required final Map<String, bool> readyStates,
      required this.settings})
      : _players = players,
        _readyStates = readyStates;

  factory _$_RoomDetail.fromJson(Map<String, dynamic> json) =>
      _$$_RoomDetailFromJson(json);

  @override
  final String roomId;
  @override
  final String hostId;
  final List<PlayerIdentity> _players;
  @override
  List<PlayerIdentity> get players {
    if (_players is EqualUnmodifiableListView) return _players;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_players);
  }

  final Map<String, bool> _readyStates;
  @override
  Map<String, bool> get readyStates {
    if (_readyStates is EqualUnmodifiableMapView) return _readyStates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_readyStates);
  }

// playerId -> isReady
  @override
  final GameSettings settings;

  @override
  String toString() {
    return 'RoomDetail(roomId: $roomId, hostId: $hostId, players: $players, readyStates: $readyStates, settings: $settings)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RoomDetail &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.hostId, hostId) || other.hostId == hostId) &&
            const DeepCollectionEquality().equals(other._players, _players) &&
            const DeepCollectionEquality()
                .equals(other._readyStates, _readyStates) &&
            (identical(other.settings, settings) ||
                other.settings == settings));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      roomId,
      hostId,
      const DeepCollectionEquality().hash(_players),
      const DeepCollectionEquality().hash(_readyStates),
      settings);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RoomDetailCopyWith<_$_RoomDetail> get copyWith =>
      __$$_RoomDetailCopyWithImpl<_$_RoomDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RoomDetailToJson(
      this,
    );
  }
}

abstract class _RoomDetail implements RoomDetail {
  const factory _RoomDetail(
      {required final String roomId,
      required final String hostId,
      required final List<PlayerIdentity> players,
      required final Map<String, bool> readyStates,
      required final GameSettings settings}) = _$_RoomDetail;

  factory _RoomDetail.fromJson(Map<String, dynamic> json) =
      _$_RoomDetail.fromJson;

  @override
  String get roomId;
  @override
  String get hostId;
  @override
  List<PlayerIdentity> get players;
  @override
  Map<String, bool> get readyStates;
  @override // playerId -> isReady
  GameSettings get settings;
  @override
  @JsonKey(ignore: true)
  _$$_RoomDetailCopyWith<_$_RoomDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

GameSettings _$GameSettingsFromJson(Map<String, dynamic> json) {
  return _GameSettings.fromJson(json);
}

/// @nodoc
mixin _$GameSettings {
  int get winScore => throw _privateConstructorUsedError;
  int get maxTurnTimeSeconds => throw _privateConstructorUsedError;
  String get winMode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameSettingsCopyWith<GameSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameSettingsCopyWith<$Res> {
  factory $GameSettingsCopyWith(
          GameSettings value, $Res Function(GameSettings) then) =
      _$GameSettingsCopyWithImpl<$Res, GameSettings>;
  @useResult
  $Res call({int winScore, int maxTurnTimeSeconds, String winMode});
}

/// @nodoc
class _$GameSettingsCopyWithImpl<$Res, $Val extends GameSettings>
    implements $GameSettingsCopyWith<$Res> {
  _$GameSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? winScore = null,
    Object? maxTurnTimeSeconds = null,
    Object? winMode = null,
  }) {
    return _then(_value.copyWith(
      winScore: null == winScore
          ? _value.winScore
          : winScore // ignore: cast_nullable_to_non_nullable
              as int,
      maxTurnTimeSeconds: null == maxTurnTimeSeconds
          ? _value.maxTurnTimeSeconds
          : maxTurnTimeSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      winMode: null == winMode
          ? _value.winMode
          : winMode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GameSettingsCopyWith<$Res>
    implements $GameSettingsCopyWith<$Res> {
  factory _$$_GameSettingsCopyWith(
          _$_GameSettings value, $Res Function(_$_GameSettings) then) =
      __$$_GameSettingsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int winScore, int maxTurnTimeSeconds, String winMode});
}

/// @nodoc
class __$$_GameSettingsCopyWithImpl<$Res>
    extends _$GameSettingsCopyWithImpl<$Res, _$_GameSettings>
    implements _$$_GameSettingsCopyWith<$Res> {
  __$$_GameSettingsCopyWithImpl(
      _$_GameSettings _value, $Res Function(_$_GameSettings) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? winScore = null,
    Object? maxTurnTimeSeconds = null,
    Object? winMode = null,
  }) {
    return _then(_$_GameSettings(
      winScore: null == winScore
          ? _value.winScore
          : winScore // ignore: cast_nullable_to_non_nullable
              as int,
      maxTurnTimeSeconds: null == maxTurnTimeSeconds
          ? _value.maxTurnTimeSeconds
          : maxTurnTimeSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      winMode: null == winMode
          ? _value.winMode
          : winMode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GameSettings implements _GameSettings {
  const _$_GameSettings(
      {this.winScore = 15,
      this.maxTurnTimeSeconds = 30,
      this.winMode = 'score'});

  factory _$_GameSettings.fromJson(Map<String, dynamic> json) =>
      _$$_GameSettingsFromJson(json);

  @override
  @JsonKey()
  final int winScore;
  @override
  @JsonKey()
  final int maxTurnTimeSeconds;
  @override
  @JsonKey()
  final String winMode;

  @override
  String toString() {
    return 'GameSettings(winScore: $winScore, maxTurnTimeSeconds: $maxTurnTimeSeconds, winMode: $winMode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GameSettings &&
            (identical(other.winScore, winScore) ||
                other.winScore == winScore) &&
            (identical(other.maxTurnTimeSeconds, maxTurnTimeSeconds) ||
                other.maxTurnTimeSeconds == maxTurnTimeSeconds) &&
            (identical(other.winMode, winMode) || other.winMode == winMode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, winScore, maxTurnTimeSeconds, winMode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GameSettingsCopyWith<_$_GameSettings> get copyWith =>
      __$$_GameSettingsCopyWithImpl<_$_GameSettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GameSettingsToJson(
      this,
    );
  }
}

abstract class _GameSettings implements GameSettings {
  const factory _GameSettings(
      {final int winScore,
      final int maxTurnTimeSeconds,
      final String winMode}) = _$_GameSettings;

  factory _GameSettings.fromJson(Map<String, dynamic> json) =
      _$_GameSettings.fromJson;

  @override
  int get winScore;
  @override
  int get maxTurnTimeSeconds;
  @override
  String get winMode;
  @override
  @JsonKey(ignore: true)
  _$$_GameSettingsCopyWith<_$_GameSettings> get copyWith =>
      throw _privateConstructorUsedError;
}
