// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'messages.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ClientMessage _$ClientMessageFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'joinRoom':
      return _JoinRoom.fromJson(json);
    case 'ready':
      return _Ready.fromJson(json);
    case 'action':
      return _Action.fromJson(json);
    case 'chat':
      return _Chat.fromJson(json);

    default:
      throw CheckedFromJsonException(
        json,
        'runtimeType',
        'ClientMessage',
        'Invalid union type "${json['runtimeType']}"!',
      );
  }
}

/// @nodoc
mixin _$ClientMessage {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId) joinRoom,
    required TResult Function(bool isReady) ready,
    required TResult Function(Map<String, dynamic> actionData) action,
    required TResult Function(String message, String? emoji) chat,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId)? joinRoom,
    TResult? Function(bool isReady)? ready,
    TResult? Function(Map<String, dynamic> actionData)? action,
    TResult? Function(String message, String? emoji)? chat,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId)? joinRoom,
    TResult Function(bool isReady)? ready,
    TResult Function(Map<String, dynamic> actionData)? action,
    TResult Function(String message, String? emoji)? chat,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_JoinRoom value) joinRoom,
    required TResult Function(_Ready value) ready,
    required TResult Function(_Action value) action,
    required TResult Function(_Chat value) chat,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_JoinRoom value)? joinRoom,
    TResult? Function(_Ready value)? ready,
    TResult? Function(_Action value)? action,
    TResult? Function(_Chat value)? chat,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_JoinRoom value)? joinRoom,
    TResult Function(_Ready value)? ready,
    TResult Function(_Action value)? action,
    TResult Function(_Chat value)? chat,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this ClientMessage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientMessageCopyWith<$Res> {
  factory $ClientMessageCopyWith(
    ClientMessage value,
    $Res Function(ClientMessage) then,
  ) = _$ClientMessageCopyWithImpl<$Res, ClientMessage>;
}

/// @nodoc
class _$ClientMessageCopyWithImpl<$Res, $Val extends ClientMessage>
    implements $ClientMessageCopyWith<$Res> {
  _$ClientMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClientMessage
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$JoinRoomImplCopyWith<$Res> {
  factory _$$JoinRoomImplCopyWith(
    _$JoinRoomImpl value,
    $Res Function(_$JoinRoomImpl) then,
  ) = __$$JoinRoomImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String roomId});
}

/// @nodoc
class __$$JoinRoomImplCopyWithImpl<$Res>
    extends _$ClientMessageCopyWithImpl<$Res, _$JoinRoomImpl>
    implements _$$JoinRoomImplCopyWith<$Res> {
  __$$JoinRoomImplCopyWithImpl(
    _$JoinRoomImpl _value,
    $Res Function(_$JoinRoomImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ClientMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? roomId = null}) {
    return _then(
      _$JoinRoomImpl(
        roomId: null == roomId
            ? _value.roomId
            : roomId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$JoinRoomImpl implements _JoinRoom {
  const _$JoinRoomImpl({required this.roomId, final String? $type})
    : $type = $type ?? 'joinRoom';

  factory _$JoinRoomImpl.fromJson(Map<String, dynamic> json) =>
      _$$JoinRoomImplFromJson(json);

  @override
  final String roomId;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ClientMessage.joinRoom(roomId: $roomId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JoinRoomImpl &&
            (identical(other.roomId, roomId) || other.roomId == roomId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, roomId);

  /// Create a copy of ClientMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JoinRoomImplCopyWith<_$JoinRoomImpl> get copyWith =>
      __$$JoinRoomImplCopyWithImpl<_$JoinRoomImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId) joinRoom,
    required TResult Function(bool isReady) ready,
    required TResult Function(Map<String, dynamic> actionData) action,
    required TResult Function(String message, String? emoji) chat,
  }) {
    return joinRoom(roomId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId)? joinRoom,
    TResult? Function(bool isReady)? ready,
    TResult? Function(Map<String, dynamic> actionData)? action,
    TResult? Function(String message, String? emoji)? chat,
  }) {
    return joinRoom?.call(roomId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId)? joinRoom,
    TResult Function(bool isReady)? ready,
    TResult Function(Map<String, dynamic> actionData)? action,
    TResult Function(String message, String? emoji)? chat,
    required TResult orElse(),
  }) {
    if (joinRoom != null) {
      return joinRoom(roomId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_JoinRoom value) joinRoom,
    required TResult Function(_Ready value) ready,
    required TResult Function(_Action value) action,
    required TResult Function(_Chat value) chat,
  }) {
    return joinRoom(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_JoinRoom value)? joinRoom,
    TResult? Function(_Ready value)? ready,
    TResult? Function(_Action value)? action,
    TResult? Function(_Chat value)? chat,
  }) {
    return joinRoom?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_JoinRoom value)? joinRoom,
    TResult Function(_Ready value)? ready,
    TResult Function(_Action value)? action,
    TResult Function(_Chat value)? chat,
    required TResult orElse(),
  }) {
    if (joinRoom != null) {
      return joinRoom(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$JoinRoomImplToJson(this);
  }
}

abstract class _JoinRoom implements ClientMessage {
  const factory _JoinRoom({required final String roomId}) = _$JoinRoomImpl;

  factory _JoinRoom.fromJson(Map<String, dynamic> json) =
      _$JoinRoomImpl.fromJson;

  String get roomId;

  /// Create a copy of ClientMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JoinRoomImplCopyWith<_$JoinRoomImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReadyImplCopyWith<$Res> {
  factory _$$ReadyImplCopyWith(
    _$ReadyImpl value,
    $Res Function(_$ReadyImpl) then,
  ) = __$$ReadyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isReady});
}

/// @nodoc
class __$$ReadyImplCopyWithImpl<$Res>
    extends _$ClientMessageCopyWithImpl<$Res, _$ReadyImpl>
    implements _$$ReadyImplCopyWith<$Res> {
  __$$ReadyImplCopyWithImpl(
    _$ReadyImpl _value,
    $Res Function(_$ReadyImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ClientMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isReady = null}) {
    return _then(
      _$ReadyImpl(
        isReady: null == isReady
            ? _value.isReady
            : isReady // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ReadyImpl implements _Ready {
  const _$ReadyImpl({required this.isReady, final String? $type})
    : $type = $type ?? 'ready';

  factory _$ReadyImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReadyImplFromJson(json);

  @override
  final bool isReady;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ClientMessage.ready(isReady: $isReady)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReadyImpl &&
            (identical(other.isReady, isReady) || other.isReady == isReady));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, isReady);

  /// Create a copy of ClientMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReadyImplCopyWith<_$ReadyImpl> get copyWith =>
      __$$ReadyImplCopyWithImpl<_$ReadyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId) joinRoom,
    required TResult Function(bool isReady) ready,
    required TResult Function(Map<String, dynamic> actionData) action,
    required TResult Function(String message, String? emoji) chat,
  }) {
    return ready(isReady);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId)? joinRoom,
    TResult? Function(bool isReady)? ready,
    TResult? Function(Map<String, dynamic> actionData)? action,
    TResult? Function(String message, String? emoji)? chat,
  }) {
    return ready?.call(isReady);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId)? joinRoom,
    TResult Function(bool isReady)? ready,
    TResult Function(Map<String, dynamic> actionData)? action,
    TResult Function(String message, String? emoji)? chat,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(isReady);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_JoinRoom value) joinRoom,
    required TResult Function(_Ready value) ready,
    required TResult Function(_Action value) action,
    required TResult Function(_Chat value) chat,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_JoinRoom value)? joinRoom,
    TResult? Function(_Ready value)? ready,
    TResult? Function(_Action value)? action,
    TResult? Function(_Chat value)? chat,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_JoinRoom value)? joinRoom,
    TResult Function(_Ready value)? ready,
    TResult Function(_Action value)? action,
    TResult Function(_Chat value)? chat,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ReadyImplToJson(this);
  }
}

abstract class _Ready implements ClientMessage {
  const factory _Ready({required final bool isReady}) = _$ReadyImpl;

  factory _Ready.fromJson(Map<String, dynamic> json) = _$ReadyImpl.fromJson;

  bool get isReady;

  /// Create a copy of ClientMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReadyImplCopyWith<_$ReadyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ActionImplCopyWith<$Res> {
  factory _$$ActionImplCopyWith(
    _$ActionImpl value,
    $Res Function(_$ActionImpl) then,
  ) = __$$ActionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, dynamic> actionData});
}

/// @nodoc
class __$$ActionImplCopyWithImpl<$Res>
    extends _$ClientMessageCopyWithImpl<$Res, _$ActionImpl>
    implements _$$ActionImplCopyWith<$Res> {
  __$$ActionImplCopyWithImpl(
    _$ActionImpl _value,
    $Res Function(_$ActionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ClientMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? actionData = null}) {
    return _then(
      _$ActionImpl(
        actionData: null == actionData
            ? _value._actionData
            : actionData // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ActionImpl implements _Action {
  const _$ActionImpl({
    required final Map<String, dynamic> actionData,
    final String? $type,
  }) : _actionData = actionData,
       $type = $type ?? 'action';

  factory _$ActionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActionImplFromJson(json);

  final Map<String, dynamic> _actionData;
  @override
  Map<String, dynamic> get actionData {
    if (_actionData is EqualUnmodifiableMapView) return _actionData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_actionData);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ClientMessage.action(actionData: $actionData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActionImpl &&
            const DeepCollectionEquality().equals(
              other._actionData,
              _actionData,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_actionData),
  );

  /// Create a copy of ClientMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActionImplCopyWith<_$ActionImpl> get copyWith =>
      __$$ActionImplCopyWithImpl<_$ActionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId) joinRoom,
    required TResult Function(bool isReady) ready,
    required TResult Function(Map<String, dynamic> actionData) action,
    required TResult Function(String message, String? emoji) chat,
  }) {
    return action(actionData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId)? joinRoom,
    TResult? Function(bool isReady)? ready,
    TResult? Function(Map<String, dynamic> actionData)? action,
    TResult? Function(String message, String? emoji)? chat,
  }) {
    return action?.call(actionData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId)? joinRoom,
    TResult Function(bool isReady)? ready,
    TResult Function(Map<String, dynamic> actionData)? action,
    TResult Function(String message, String? emoji)? chat,
    required TResult orElse(),
  }) {
    if (action != null) {
      return action(actionData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_JoinRoom value) joinRoom,
    required TResult Function(_Ready value) ready,
    required TResult Function(_Action value) action,
    required TResult Function(_Chat value) chat,
  }) {
    return action(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_JoinRoom value)? joinRoom,
    TResult? Function(_Ready value)? ready,
    TResult? Function(_Action value)? action,
    TResult? Function(_Chat value)? chat,
  }) {
    return action?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_JoinRoom value)? joinRoom,
    TResult Function(_Ready value)? ready,
    TResult Function(_Action value)? action,
    TResult Function(_Chat value)? chat,
    required TResult orElse(),
  }) {
    if (action != null) {
      return action(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ActionImplToJson(this);
  }
}

abstract class _Action implements ClientMessage {
  const factory _Action({required final Map<String, dynamic> actionData}) =
      _$ActionImpl;

  factory _Action.fromJson(Map<String, dynamic> json) = _$ActionImpl.fromJson;

  Map<String, dynamic> get actionData;

  /// Create a copy of ClientMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActionImplCopyWith<_$ActionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChatImplCopyWith<$Res> {
  factory _$$ChatImplCopyWith(
    _$ChatImpl value,
    $Res Function(_$ChatImpl) then,
  ) = __$$ChatImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, String? emoji});
}

/// @nodoc
class __$$ChatImplCopyWithImpl<$Res>
    extends _$ClientMessageCopyWithImpl<$Res, _$ChatImpl>
    implements _$$ChatImplCopyWith<$Res> {
  __$$ChatImplCopyWithImpl(_$ChatImpl _value, $Res Function(_$ChatImpl) _then)
    : super(_value, _then);

  /// Create a copy of ClientMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? emoji = freezed}) {
    return _then(
      _$ChatImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        emoji: freezed == emoji
            ? _value.emoji
            : emoji // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatImpl implements _Chat {
  const _$ChatImpl({required this.message, this.emoji, final String? $type})
    : $type = $type ?? 'chat';

  factory _$ChatImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatImplFromJson(json);

  @override
  final String message;
  @override
  final String? emoji;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ClientMessage.chat(message: $message, emoji: $emoji)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.emoji, emoji) || other.emoji == emoji));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, emoji);

  /// Create a copy of ClientMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatImplCopyWith<_$ChatImpl> get copyWith =>
      __$$ChatImplCopyWithImpl<_$ChatImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId) joinRoom,
    required TResult Function(bool isReady) ready,
    required TResult Function(Map<String, dynamic> actionData) action,
    required TResult Function(String message, String? emoji) chat,
  }) {
    return chat(message, emoji);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId)? joinRoom,
    TResult? Function(bool isReady)? ready,
    TResult? Function(Map<String, dynamic> actionData)? action,
    TResult? Function(String message, String? emoji)? chat,
  }) {
    return chat?.call(message, emoji);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId)? joinRoom,
    TResult Function(bool isReady)? ready,
    TResult Function(Map<String, dynamic> actionData)? action,
    TResult Function(String message, String? emoji)? chat,
    required TResult orElse(),
  }) {
    if (chat != null) {
      return chat(message, emoji);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_JoinRoom value) joinRoom,
    required TResult Function(_Ready value) ready,
    required TResult Function(_Action value) action,
    required TResult Function(_Chat value) chat,
  }) {
    return chat(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_JoinRoom value)? joinRoom,
    TResult? Function(_Ready value)? ready,
    TResult? Function(_Action value)? action,
    TResult? Function(_Chat value)? chat,
  }) {
    return chat?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_JoinRoom value)? joinRoom,
    TResult Function(_Ready value)? ready,
    TResult Function(_Action value)? action,
    TResult Function(_Chat value)? chat,
    required TResult orElse(),
  }) {
    if (chat != null) {
      return chat(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatImplToJson(this);
  }
}

abstract class _Chat implements ClientMessage {
  const factory _Chat({required final String message, final String? emoji}) =
      _$ChatImpl;

  factory _Chat.fromJson(Map<String, dynamic> json) = _$ChatImpl.fromJson;

  String get message;
  String? get emoji;

  /// Create a copy of ClientMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatImplCopyWith<_$ChatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ServerMessage _$ServerMessageFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'lobbyUpdate':
      return _LobbyUpdate.fromJson(json);
    case 'gameStateUpdate':
      return _GameStateUpdate.fromJson(json);
    case 'error':
      return _Error.fromJson(json);
    case 'notification':
      return _Notification.fromJson(json);

    default:
      throw CheckedFromJsonException(
        json,
        'runtimeType',
        'ServerMessage',
        'Invalid union type "${json['runtimeType']}"!',
      );
  }
}

/// @nodoc
mixin _$ServerMessage {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<dynamic> rooms) lobbyUpdate,
    required TResult Function(Map<String, dynamic> state) gameStateUpdate,
    required TResult Function(String message, String code) error,
    required TResult Function(String message) notification,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<dynamic> rooms)? lobbyUpdate,
    TResult? Function(Map<String, dynamic> state)? gameStateUpdate,
    TResult? Function(String message, String code)? error,
    TResult? Function(String message)? notification,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<dynamic> rooms)? lobbyUpdate,
    TResult Function(Map<String, dynamic> state)? gameStateUpdate,
    TResult Function(String message, String code)? error,
    TResult Function(String message)? notification,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LobbyUpdate value) lobbyUpdate,
    required TResult Function(_GameStateUpdate value) gameStateUpdate,
    required TResult Function(_Error value) error,
    required TResult Function(_Notification value) notification,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LobbyUpdate value)? lobbyUpdate,
    TResult? Function(_GameStateUpdate value)? gameStateUpdate,
    TResult? Function(_Error value)? error,
    TResult? Function(_Notification value)? notification,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LobbyUpdate value)? lobbyUpdate,
    TResult Function(_GameStateUpdate value)? gameStateUpdate,
    TResult Function(_Error value)? error,
    TResult Function(_Notification value)? notification,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this ServerMessage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerMessageCopyWith<$Res> {
  factory $ServerMessageCopyWith(
    ServerMessage value,
    $Res Function(ServerMessage) then,
  ) = _$ServerMessageCopyWithImpl<$Res, ServerMessage>;
}

/// @nodoc
class _$ServerMessageCopyWithImpl<$Res, $Val extends ServerMessage>
    implements $ServerMessageCopyWith<$Res> {
  _$ServerMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ServerMessage
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LobbyUpdateImplCopyWith<$Res> {
  factory _$$LobbyUpdateImplCopyWith(
    _$LobbyUpdateImpl value,
    $Res Function(_$LobbyUpdateImpl) then,
  ) = __$$LobbyUpdateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<dynamic> rooms});
}

/// @nodoc
class __$$LobbyUpdateImplCopyWithImpl<$Res>
    extends _$ServerMessageCopyWithImpl<$Res, _$LobbyUpdateImpl>
    implements _$$LobbyUpdateImplCopyWith<$Res> {
  __$$LobbyUpdateImplCopyWithImpl(
    _$LobbyUpdateImpl _value,
    $Res Function(_$LobbyUpdateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ServerMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? rooms = null}) {
    return _then(
      _$LobbyUpdateImpl(
        rooms: null == rooms
            ? _value._rooms
            : rooms // ignore: cast_nullable_to_non_nullable
                  as List<dynamic>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LobbyUpdateImpl implements _LobbyUpdate {
  const _$LobbyUpdateImpl({
    required final List<dynamic> rooms,
    final String? $type,
  }) : _rooms = rooms,
       $type = $type ?? 'lobbyUpdate';

  factory _$LobbyUpdateImpl.fromJson(Map<String, dynamic> json) =>
      _$$LobbyUpdateImplFromJson(json);

  final List<dynamic> _rooms;
  @override
  List<dynamic> get rooms {
    if (_rooms is EqualUnmodifiableListView) return _rooms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rooms);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ServerMessage.lobbyUpdate(rooms: $rooms)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LobbyUpdateImpl &&
            const DeepCollectionEquality().equals(other._rooms, _rooms));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_rooms));

  /// Create a copy of ServerMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LobbyUpdateImplCopyWith<_$LobbyUpdateImpl> get copyWith =>
      __$$LobbyUpdateImplCopyWithImpl<_$LobbyUpdateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<dynamic> rooms) lobbyUpdate,
    required TResult Function(Map<String, dynamic> state) gameStateUpdate,
    required TResult Function(String message, String code) error,
    required TResult Function(String message) notification,
  }) {
    return lobbyUpdate(rooms);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<dynamic> rooms)? lobbyUpdate,
    TResult? Function(Map<String, dynamic> state)? gameStateUpdate,
    TResult? Function(String message, String code)? error,
    TResult? Function(String message)? notification,
  }) {
    return lobbyUpdate?.call(rooms);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<dynamic> rooms)? lobbyUpdate,
    TResult Function(Map<String, dynamic> state)? gameStateUpdate,
    TResult Function(String message, String code)? error,
    TResult Function(String message)? notification,
    required TResult orElse(),
  }) {
    if (lobbyUpdate != null) {
      return lobbyUpdate(rooms);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LobbyUpdate value) lobbyUpdate,
    required TResult Function(_GameStateUpdate value) gameStateUpdate,
    required TResult Function(_Error value) error,
    required TResult Function(_Notification value) notification,
  }) {
    return lobbyUpdate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LobbyUpdate value)? lobbyUpdate,
    TResult? Function(_GameStateUpdate value)? gameStateUpdate,
    TResult? Function(_Error value)? error,
    TResult? Function(_Notification value)? notification,
  }) {
    return lobbyUpdate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LobbyUpdate value)? lobbyUpdate,
    TResult Function(_GameStateUpdate value)? gameStateUpdate,
    TResult Function(_Error value)? error,
    TResult Function(_Notification value)? notification,
    required TResult orElse(),
  }) {
    if (lobbyUpdate != null) {
      return lobbyUpdate(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LobbyUpdateImplToJson(this);
  }
}

abstract class _LobbyUpdate implements ServerMessage {
  const factory _LobbyUpdate({required final List<dynamic> rooms}) =
      _$LobbyUpdateImpl;

  factory _LobbyUpdate.fromJson(Map<String, dynamic> json) =
      _$LobbyUpdateImpl.fromJson;

  List<dynamic> get rooms;

  /// Create a copy of ServerMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LobbyUpdateImplCopyWith<_$LobbyUpdateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GameStateUpdateImplCopyWith<$Res> {
  factory _$$GameStateUpdateImplCopyWith(
    _$GameStateUpdateImpl value,
    $Res Function(_$GameStateUpdateImpl) then,
  ) = __$$GameStateUpdateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, dynamic> state});
}

/// @nodoc
class __$$GameStateUpdateImplCopyWithImpl<$Res>
    extends _$ServerMessageCopyWithImpl<$Res, _$GameStateUpdateImpl>
    implements _$$GameStateUpdateImplCopyWith<$Res> {
  __$$GameStateUpdateImplCopyWithImpl(
    _$GameStateUpdateImpl _value,
    $Res Function(_$GameStateUpdateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ServerMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? state = null}) {
    return _then(
      _$GameStateUpdateImpl(
        state: null == state
            ? _value._state
            : state // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GameStateUpdateImpl implements _GameStateUpdate {
  const _$GameStateUpdateImpl({
    required final Map<String, dynamic> state,
    final String? $type,
  }) : _state = state,
       $type = $type ?? 'gameStateUpdate';

  factory _$GameStateUpdateImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameStateUpdateImplFromJson(json);

  final Map<String, dynamic> _state;
  @override
  Map<String, dynamic> get state {
    if (_state is EqualUnmodifiableMapView) return _state;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_state);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ServerMessage.gameStateUpdate(state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameStateUpdateImpl &&
            const DeepCollectionEquality().equals(other._state, _state));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_state));

  /// Create a copy of ServerMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameStateUpdateImplCopyWith<_$GameStateUpdateImpl> get copyWith =>
      __$$GameStateUpdateImplCopyWithImpl<_$GameStateUpdateImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<dynamic> rooms) lobbyUpdate,
    required TResult Function(Map<String, dynamic> state) gameStateUpdate,
    required TResult Function(String message, String code) error,
    required TResult Function(String message) notification,
  }) {
    return gameStateUpdate(state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<dynamic> rooms)? lobbyUpdate,
    TResult? Function(Map<String, dynamic> state)? gameStateUpdate,
    TResult? Function(String message, String code)? error,
    TResult? Function(String message)? notification,
  }) {
    return gameStateUpdate?.call(state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<dynamic> rooms)? lobbyUpdate,
    TResult Function(Map<String, dynamic> state)? gameStateUpdate,
    TResult Function(String message, String code)? error,
    TResult Function(String message)? notification,
    required TResult orElse(),
  }) {
    if (gameStateUpdate != null) {
      return gameStateUpdate(state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LobbyUpdate value) lobbyUpdate,
    required TResult Function(_GameStateUpdate value) gameStateUpdate,
    required TResult Function(_Error value) error,
    required TResult Function(_Notification value) notification,
  }) {
    return gameStateUpdate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LobbyUpdate value)? lobbyUpdate,
    TResult? Function(_GameStateUpdate value)? gameStateUpdate,
    TResult? Function(_Error value)? error,
    TResult? Function(_Notification value)? notification,
  }) {
    return gameStateUpdate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LobbyUpdate value)? lobbyUpdate,
    TResult Function(_GameStateUpdate value)? gameStateUpdate,
    TResult Function(_Error value)? error,
    TResult Function(_Notification value)? notification,
    required TResult orElse(),
  }) {
    if (gameStateUpdate != null) {
      return gameStateUpdate(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$GameStateUpdateImplToJson(this);
  }
}

abstract class _GameStateUpdate implements ServerMessage {
  const factory _GameStateUpdate({required final Map<String, dynamic> state}) =
      _$GameStateUpdateImpl;

  factory _GameStateUpdate.fromJson(Map<String, dynamic> json) =
      _$GameStateUpdateImpl.fromJson;

  Map<String, dynamic> get state;

  /// Create a copy of ServerMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameStateUpdateImplCopyWith<_$GameStateUpdateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
    _$ErrorImpl value,
    $Res Function(_$ErrorImpl) then,
  ) = __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, String code});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$ServerMessageCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ServerMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? code = null}) {
    return _then(
      _$ErrorImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ErrorImpl implements _Error {
  const _$ErrorImpl({
    required this.message,
    required this.code,
    final String? $type,
  }) : $type = $type ?? 'error';

  factory _$ErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$ErrorImplFromJson(json);

  @override
  final String message;
  @override
  final String code;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ServerMessage.error(message: $message, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  /// Create a copy of ServerMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<dynamic> rooms) lobbyUpdate,
    required TResult Function(Map<String, dynamic> state) gameStateUpdate,
    required TResult Function(String message, String code) error,
    required TResult Function(String message) notification,
  }) {
    return error(message, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<dynamic> rooms)? lobbyUpdate,
    TResult? Function(Map<String, dynamic> state)? gameStateUpdate,
    TResult? Function(String message, String code)? error,
    TResult? Function(String message)? notification,
  }) {
    return error?.call(message, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<dynamic> rooms)? lobbyUpdate,
    TResult Function(Map<String, dynamic> state)? gameStateUpdate,
    TResult Function(String message, String code)? error,
    TResult Function(String message)? notification,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LobbyUpdate value) lobbyUpdate,
    required TResult Function(_GameStateUpdate value) gameStateUpdate,
    required TResult Function(_Error value) error,
    required TResult Function(_Notification value) notification,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LobbyUpdate value)? lobbyUpdate,
    TResult? Function(_GameStateUpdate value)? gameStateUpdate,
    TResult? Function(_Error value)? error,
    TResult? Function(_Notification value)? notification,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LobbyUpdate value)? lobbyUpdate,
    TResult Function(_GameStateUpdate value)? gameStateUpdate,
    TResult Function(_Error value)? error,
    TResult Function(_Notification value)? notification,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ErrorImplToJson(this);
  }
}

abstract class _Error implements ServerMessage {
  const factory _Error({
    required final String message,
    required final String code,
  }) = _$ErrorImpl;

  factory _Error.fromJson(Map<String, dynamic> json) = _$ErrorImpl.fromJson;

  String get message;
  String get code;

  /// Create a copy of ServerMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotificationImplCopyWith<$Res> {
  factory _$$NotificationImplCopyWith(
    _$NotificationImpl value,
    $Res Function(_$NotificationImpl) then,
  ) = __$$NotificationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NotificationImplCopyWithImpl<$Res>
    extends _$ServerMessageCopyWithImpl<$Res, _$NotificationImpl>
    implements _$$NotificationImplCopyWith<$Res> {
  __$$NotificationImplCopyWithImpl(
    _$NotificationImpl _value,
    $Res Function(_$NotificationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ServerMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$NotificationImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationImpl implements _Notification {
  const _$NotificationImpl({required this.message, final String? $type})
    : $type = $type ?? 'notification';

  factory _$NotificationImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationImplFromJson(json);

  @override
  final String message;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ServerMessage.notification(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ServerMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationImplCopyWith<_$NotificationImpl> get copyWith =>
      __$$NotificationImplCopyWithImpl<_$NotificationImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<dynamic> rooms) lobbyUpdate,
    required TResult Function(Map<String, dynamic> state) gameStateUpdate,
    required TResult Function(String message, String code) error,
    required TResult Function(String message) notification,
  }) {
    return notification(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<dynamic> rooms)? lobbyUpdate,
    TResult? Function(Map<String, dynamic> state)? gameStateUpdate,
    TResult? Function(String message, String code)? error,
    TResult? Function(String message)? notification,
  }) {
    return notification?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<dynamic> rooms)? lobbyUpdate,
    TResult Function(Map<String, dynamic> state)? gameStateUpdate,
    TResult Function(String message, String code)? error,
    TResult Function(String message)? notification,
    required TResult orElse(),
  }) {
    if (notification != null) {
      return notification(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LobbyUpdate value) lobbyUpdate,
    required TResult Function(_GameStateUpdate value) gameStateUpdate,
    required TResult Function(_Error value) error,
    required TResult Function(_Notification value) notification,
  }) {
    return notification(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LobbyUpdate value)? lobbyUpdate,
    TResult? Function(_GameStateUpdate value)? gameStateUpdate,
    TResult? Function(_Error value)? error,
    TResult? Function(_Notification value)? notification,
  }) {
    return notification?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LobbyUpdate value)? lobbyUpdate,
    TResult Function(_GameStateUpdate value)? gameStateUpdate,
    TResult Function(_Error value)? error,
    TResult Function(_Notification value)? notification,
    required TResult orElse(),
  }) {
    if (notification != null) {
      return notification(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationImplToJson(this);
  }
}

abstract class _Notification implements ServerMessage {
  const factory _Notification({required final String message}) =
      _$NotificationImpl;

  factory _Notification.fromJson(Map<String, dynamic> json) =
      _$NotificationImpl.fromJson;

  String get message;

  /// Create a copy of ServerMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationImplCopyWith<_$NotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
