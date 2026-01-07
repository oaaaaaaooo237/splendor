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
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

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

  /// Serializes this RoomInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RoomInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RoomInfoCopyWith<RoomInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomInfoCopyWith<$Res> {
  factory $RoomInfoCopyWith(RoomInfo value, $Res Function(RoomInfo) then) =
      _$RoomInfoCopyWithImpl<$Res, RoomInfo>;
  @useResult
  $Res call({
    String roomId,
    String hostName,
    int playerCount,
    int maxPlayers,
    bool isLocked,
    String status,
  });
}

/// @nodoc
class _$RoomInfoCopyWithImpl<$Res, $Val extends RoomInfo>
    implements $RoomInfoCopyWith<$Res> {
  _$RoomInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RoomInfo
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(
      _value.copyWith(
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RoomInfoImplCopyWith<$Res>
    implements $RoomInfoCopyWith<$Res> {
  factory _$$RoomInfoImplCopyWith(
    _$RoomInfoImpl value,
    $Res Function(_$RoomInfoImpl) then,
  ) = __$$RoomInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String roomId,
    String hostName,
    int playerCount,
    int maxPlayers,
    bool isLocked,
    String status,
  });
}

/// @nodoc
class __$$RoomInfoImplCopyWithImpl<$Res>
    extends _$RoomInfoCopyWithImpl<$Res, _$RoomInfoImpl>
    implements _$$RoomInfoImplCopyWith<$Res> {
  __$$RoomInfoImplCopyWithImpl(
    _$RoomInfoImpl _value,
    $Res Function(_$RoomInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RoomInfo
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(
      _$RoomInfoImpl(
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RoomInfoImpl implements _RoomInfo {
  const _$RoomInfoImpl({
    required this.roomId,
    required this.hostName,
    required this.playerCount,
    required this.maxPlayers,
    required this.isLocked,
    required this.status,
  });

  factory _$RoomInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoomInfoImplFromJson(json);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomInfoImpl &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    roomId,
    hostName,
    playerCount,
    maxPlayers,
    isLocked,
    status,
  );

  /// Create a copy of RoomInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomInfoImplCopyWith<_$RoomInfoImpl> get copyWith =>
      __$$RoomInfoImplCopyWithImpl<_$RoomInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoomInfoImplToJson(this);
  }
}

abstract class _RoomInfo implements RoomInfo {
  const factory _RoomInfo({
    required final String roomId,
    required final String hostName,
    required final int playerCount,
    required final int maxPlayers,
    required final bool isLocked,
    required final String status,
  }) = _$RoomInfoImpl;

  factory _RoomInfo.fromJson(Map<String, dynamic> json) =
      _$RoomInfoImpl.fromJson;

  @override
  String get roomId;
  @override
  String get hostName;
  @override
  int get playerCount;
  @override
  int get maxPlayers;
  @override
  bool get isLocked; // Has password
  @override
  String get status;

  /// Create a copy of RoomInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RoomInfoImplCopyWith<_$RoomInfoImpl> get copyWith =>
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

  /// Serializes this RoomDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RoomDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RoomDetailCopyWith<RoomDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomDetailCopyWith<$Res> {
  factory $RoomDetailCopyWith(
    RoomDetail value,
    $Res Function(RoomDetail) then,
  ) = _$RoomDetailCopyWithImpl<$Res, RoomDetail>;
  @useResult
  $Res call({
    String roomId,
    String hostId,
    List<PlayerIdentity> players,
    Map<String, bool> readyStates,
    GameSettings settings,
  });

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

  /// Create a copy of RoomDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? hostId = null,
    Object? players = null,
    Object? readyStates = null,
    Object? settings = null,
  }) {
    return _then(
      _value.copyWith(
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
          )
          as $Val,
    );
  }

  /// Create a copy of RoomDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GameSettingsCopyWith<$Res> get settings {
    return $GameSettingsCopyWith<$Res>(_value.settings, (value) {
      return _then(_value.copyWith(settings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RoomDetailImplCopyWith<$Res>
    implements $RoomDetailCopyWith<$Res> {
  factory _$$RoomDetailImplCopyWith(
    _$RoomDetailImpl value,
    $Res Function(_$RoomDetailImpl) then,
  ) = __$$RoomDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String roomId,
    String hostId,
    List<PlayerIdentity> players,
    Map<String, bool> readyStates,
    GameSettings settings,
  });

  @override
  $GameSettingsCopyWith<$Res> get settings;
}

/// @nodoc
class __$$RoomDetailImplCopyWithImpl<$Res>
    extends _$RoomDetailCopyWithImpl<$Res, _$RoomDetailImpl>
    implements _$$RoomDetailImplCopyWith<$Res> {
  __$$RoomDetailImplCopyWithImpl(
    _$RoomDetailImpl _value,
    $Res Function(_$RoomDetailImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RoomDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? hostId = null,
    Object? players = null,
    Object? readyStates = null,
    Object? settings = null,
  }) {
    return _then(
      _$RoomDetailImpl(
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RoomDetailImpl implements _RoomDetail {
  const _$RoomDetailImpl({
    required this.roomId,
    required this.hostId,
    required final List<PlayerIdentity> players,
    required final Map<String, bool> readyStates,
    required this.settings,
  }) : _players = players,
       _readyStates = readyStates;

  factory _$RoomDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoomDetailImplFromJson(json);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomDetailImpl &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.hostId, hostId) || other.hostId == hostId) &&
            const DeepCollectionEquality().equals(other._players, _players) &&
            const DeepCollectionEquality().equals(
              other._readyStates,
              _readyStates,
            ) &&
            (identical(other.settings, settings) ||
                other.settings == settings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    roomId,
    hostId,
    const DeepCollectionEquality().hash(_players),
    const DeepCollectionEquality().hash(_readyStates),
    settings,
  );

  /// Create a copy of RoomDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomDetailImplCopyWith<_$RoomDetailImpl> get copyWith =>
      __$$RoomDetailImplCopyWithImpl<_$RoomDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoomDetailImplToJson(this);
  }
}

abstract class _RoomDetail implements RoomDetail {
  const factory _RoomDetail({
    required final String roomId,
    required final String hostId,
    required final List<PlayerIdentity> players,
    required final Map<String, bool> readyStates,
    required final GameSettings settings,
  }) = _$RoomDetailImpl;

  factory _RoomDetail.fromJson(Map<String, dynamic> json) =
      _$RoomDetailImpl.fromJson;

  @override
  String get roomId;
  @override
  String get hostId;
  @override
  List<PlayerIdentity> get players;
  @override
  Map<String, bool> get readyStates; // playerId -> isReady
  @override
  GameSettings get settings;

  /// Create a copy of RoomDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RoomDetailImplCopyWith<_$RoomDetailImpl> get copyWith =>
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

  /// Serializes this GameSettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GameSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GameSettingsCopyWith<GameSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameSettingsCopyWith<$Res> {
  factory $GameSettingsCopyWith(
    GameSettings value,
    $Res Function(GameSettings) then,
  ) = _$GameSettingsCopyWithImpl<$Res, GameSettings>;
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

  /// Create a copy of GameSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? winScore = null,
    Object? maxTurnTimeSeconds = null,
    Object? winMode = null,
  }) {
    return _then(
      _value.copyWith(
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GameSettingsImplCopyWith<$Res>
    implements $GameSettingsCopyWith<$Res> {
  factory _$$GameSettingsImplCopyWith(
    _$GameSettingsImpl value,
    $Res Function(_$GameSettingsImpl) then,
  ) = __$$GameSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int winScore, int maxTurnTimeSeconds, String winMode});
}

/// @nodoc
class __$$GameSettingsImplCopyWithImpl<$Res>
    extends _$GameSettingsCopyWithImpl<$Res, _$GameSettingsImpl>
    implements _$$GameSettingsImplCopyWith<$Res> {
  __$$GameSettingsImplCopyWithImpl(
    _$GameSettingsImpl _value,
    $Res Function(_$GameSettingsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GameSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? winScore = null,
    Object? maxTurnTimeSeconds = null,
    Object? winMode = null,
  }) {
    return _then(
      _$GameSettingsImpl(
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GameSettingsImpl implements _GameSettings {
  const _$GameSettingsImpl({
    this.winScore = 15,
    this.maxTurnTimeSeconds = 30,
    this.winMode = 'score',
  });

  factory _$GameSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameSettingsImplFromJson(json);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameSettingsImpl &&
            (identical(other.winScore, winScore) ||
                other.winScore == winScore) &&
            (identical(other.maxTurnTimeSeconds, maxTurnTimeSeconds) ||
                other.maxTurnTimeSeconds == maxTurnTimeSeconds) &&
            (identical(other.winMode, winMode) || other.winMode == winMode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, winScore, maxTurnTimeSeconds, winMode);

  /// Create a copy of GameSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameSettingsImplCopyWith<_$GameSettingsImpl> get copyWith =>
      __$$GameSettingsImplCopyWithImpl<_$GameSettingsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameSettingsImplToJson(this);
  }
}

abstract class _GameSettings implements GameSettings {
  const factory _GameSettings({
    final int winScore,
    final int maxTurnTimeSeconds,
    final String winMode,
  }) = _$GameSettingsImpl;

  factory _GameSettings.fromJson(Map<String, dynamic> json) =
      _$GameSettingsImpl.fromJson;

  @override
  int get winScore;
  @override
  int get maxTurnTimeSeconds;
  @override
  String get winMode;

  /// Create a copy of GameSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameSettingsImplCopyWith<_$GameSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
