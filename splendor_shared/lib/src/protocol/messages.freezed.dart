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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
      throw CheckedFromJsonException(json, 'runtimeType', 'ClientMessage',
          'Invalid union type "${json['runtimeType']}"!');
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
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId)? joinRoom,
    TResult? Function(bool isReady)? ready,
    TResult? Function(Map<String, dynamic> actionData)? action,
    TResult? Function(String message, String? emoji)? chat,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId)? joinRoom,
    TResult Function(bool isReady)? ready,
    TResult Function(Map<String, dynamic> actionData)? action,
    TResult Function(String message, String? emoji)? chat,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_JoinRoom value) joinRoom,
    required TResult Function(_Ready value) ready,
    required TResult Function(_Action value) action,
    required TResult Function(_Chat value) chat,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_JoinRoom value)? joinRoom,
    TResult? Function(_Ready value)? ready,
    TResult? Function(_Action value)? action,
    TResult? Function(_Chat value)? chat,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_JoinRoom value)? joinRoom,
    TResult Function(_Ready value)? ready,
    TResult Function(_Action value)? action,
    TResult Function(_Chat value)? chat,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientMessageCopyWith<$Res> {
  factory $ClientMessageCopyWith(
          ClientMessage value, $Res Function(ClientMessage) then) =
      _$ClientMessageCopyWithImpl<$Res, ClientMessage>;
}

/// @nodoc
class _$ClientMessageCopyWithImpl<$Res, $Val extends ClientMessage>
    implements $ClientMessageCopyWith<$Res> {
  _$ClientMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_JoinRoomCopyWith<$Res> {
  factory _$$_JoinRoomCopyWith(
          _$_JoinRoom value, $Res Function(_$_JoinRoom) then) =
      __$$_JoinRoomCopyWithImpl<$Res>;
  @useResult
  $Res call({String roomId});
}

/// @nodoc
class __$$_JoinRoomCopyWithImpl<$Res>
    extends _$ClientMessageCopyWithImpl<$Res, _$_JoinRoom>
    implements _$$_JoinRoomCopyWith<$Res> {
  __$$_JoinRoomCopyWithImpl(
      _$_JoinRoom _value, $Res Function(_$_JoinRoom) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
  }) {
    return _then(_$_JoinRoom(
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_JoinRoom implements _JoinRoom {
  const _$_JoinRoom({required this.roomId, final String? $type})
      : $type = $type ?? 'joinRoom';

  factory _$_JoinRoom.fromJson(Map<String, dynamic> json) =>
      _$$_JoinRoomFromJson(json);

  @override
  final String roomId;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ClientMessage.joinRoom(roomId: $roomId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_JoinRoom &&
            (identical(other.roomId, roomId) || other.roomId == roomId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, roomId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_JoinRoomCopyWith<_$_JoinRoom> get copyWith =>
      __$$_JoinRoomCopyWithImpl<_$_JoinRoom>(this, _$identity);

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
    return _$$_JoinRoomToJson(
      this,
    );
  }
}

abstract class _JoinRoom implements ClientMessage {
  const factory _JoinRoom({required final String roomId}) = _$_JoinRoom;

  factory _JoinRoom.fromJson(Map<String, dynamic> json) = _$_JoinRoom.fromJson;

  String get roomId;
  @JsonKey(ignore: true)
  _$$_JoinRoomCopyWith<_$_JoinRoom> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ReadyCopyWith<$Res> {
  factory _$$_ReadyCopyWith(_$_Ready value, $Res Function(_$_Ready) then) =
      __$$_ReadyCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isReady});
}

/// @nodoc
class __$$_ReadyCopyWithImpl<$Res>
    extends _$ClientMessageCopyWithImpl<$Res, _$_Ready>
    implements _$$_ReadyCopyWith<$Res> {
  __$$_ReadyCopyWithImpl(_$_Ready _value, $Res Function(_$_Ready) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isReady = null,
  }) {
    return _then(_$_Ready(
      isReady: null == isReady
          ? _value.isReady
          : isReady // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Ready implements _Ready {
  const _$_Ready({required this.isReady, final String? $type})
      : $type = $type ?? 'ready';

  factory _$_Ready.fromJson(Map<String, dynamic> json) =>
      _$$_ReadyFromJson(json);

  @override
  final bool isReady;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ClientMessage.ready(isReady: $isReady)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Ready &&
            (identical(other.isReady, isReady) || other.isReady == isReady));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isReady);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReadyCopyWith<_$_Ready> get copyWith =>
      __$$_ReadyCopyWithImpl<_$_Ready>(this, _$identity);

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
    return _$$_ReadyToJson(
      this,
    );
  }
}

abstract class _Ready implements ClientMessage {
  const factory _Ready({required final bool isReady}) = _$_Ready;

  factory _Ready.fromJson(Map<String, dynamic> json) = _$_Ready.fromJson;

  bool get isReady;
  @JsonKey(ignore: true)
  _$$_ReadyCopyWith<_$_Ready> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ActionCopyWith<$Res> {
  factory _$$_ActionCopyWith(_$_Action value, $Res Function(_$_Action) then) =
      __$$_ActionCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, dynamic> actionData});
}

/// @nodoc
class __$$_ActionCopyWithImpl<$Res>
    extends _$ClientMessageCopyWithImpl<$Res, _$_Action>
    implements _$$_ActionCopyWith<$Res> {
  __$$_ActionCopyWithImpl(_$_Action _value, $Res Function(_$_Action) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? actionData = null,
  }) {
    return _then(_$_Action(
      actionData: null == actionData
          ? _value._actionData
          : actionData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Action implements _Action {
  const _$_Action(
      {required final Map<String, dynamic> actionData, final String? $type})
      : _actionData = actionData,
        $type = $type ?? 'action';

  factory _$_Action.fromJson(Map<String, dynamic> json) =>
      _$$_ActionFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Action &&
            const DeepCollectionEquality()
                .equals(other._actionData, _actionData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_actionData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ActionCopyWith<_$_Action> get copyWith =>
      __$$_ActionCopyWithImpl<_$_Action>(this, _$identity);

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
    return _$$_ActionToJson(
      this,
    );
  }
}

abstract class _Action implements ClientMessage {
  const factory _Action({required final Map<String, dynamic> actionData}) =
      _$_Action;

  factory _Action.fromJson(Map<String, dynamic> json) = _$_Action.fromJson;

  Map<String, dynamic> get actionData;
  @JsonKey(ignore: true)
  _$$_ActionCopyWith<_$_Action> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ChatCopyWith<$Res> {
  factory _$$_ChatCopyWith(_$_Chat value, $Res Function(_$_Chat) then) =
      __$$_ChatCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, String? emoji});
}

/// @nodoc
class __$$_ChatCopyWithImpl<$Res>
    extends _$ClientMessageCopyWithImpl<$Res, _$_Chat>
    implements _$$_ChatCopyWith<$Res> {
  __$$_ChatCopyWithImpl(_$_Chat _value, $Res Function(_$_Chat) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? emoji = freezed,
  }) {
    return _then(_$_Chat(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      emoji: freezed == emoji
          ? _value.emoji
          : emoji // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Chat implements _Chat {
  const _$_Chat({required this.message, this.emoji, final String? $type})
      : $type = $type ?? 'chat';

  factory _$_Chat.fromJson(Map<String, dynamic> json) => _$$_ChatFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Chat &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.emoji, emoji) || other.emoji == emoji));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, emoji);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatCopyWith<_$_Chat> get copyWith =>
      __$$_ChatCopyWithImpl<_$_Chat>(this, _$identity);

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
    return _$$_ChatToJson(
      this,
    );
  }
}

abstract class _Chat implements ClientMessage {
  const factory _Chat({required final String message, final String? emoji}) =
      _$_Chat;

  factory _Chat.fromJson(Map<String, dynamic> json) = _$_Chat.fromJson;

  String get message;
  String? get emoji;
  @JsonKey(ignore: true)
  _$$_ChatCopyWith<_$_Chat> get copyWith => throw _privateConstructorUsedError;
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
      throw CheckedFromJsonException(json, 'runtimeType', 'ServerMessage',
          'Invalid union type "${json['runtimeType']}"!');
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
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<dynamic> rooms)? lobbyUpdate,
    TResult? Function(Map<String, dynamic> state)? gameStateUpdate,
    TResult? Function(String message, String code)? error,
    TResult? Function(String message)? notification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<dynamic> rooms)? lobbyUpdate,
    TResult Function(Map<String, dynamic> state)? gameStateUpdate,
    TResult Function(String message, String code)? error,
    TResult Function(String message)? notification,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LobbyUpdate value) lobbyUpdate,
    required TResult Function(_GameStateUpdate value) gameStateUpdate,
    required TResult Function(_Error value) error,
    required TResult Function(_Notification value) notification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LobbyUpdate value)? lobbyUpdate,
    TResult? Function(_GameStateUpdate value)? gameStateUpdate,
    TResult? Function(_Error value)? error,
    TResult? Function(_Notification value)? notification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LobbyUpdate value)? lobbyUpdate,
    TResult Function(_GameStateUpdate value)? gameStateUpdate,
    TResult Function(_Error value)? error,
    TResult Function(_Notification value)? notification,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerMessageCopyWith<$Res> {
  factory $ServerMessageCopyWith(
          ServerMessage value, $Res Function(ServerMessage) then) =
      _$ServerMessageCopyWithImpl<$Res, ServerMessage>;
}

/// @nodoc
class _$ServerMessageCopyWithImpl<$Res, $Val extends ServerMessage>
    implements $ServerMessageCopyWith<$Res> {
  _$ServerMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_LobbyUpdateCopyWith<$Res> {
  factory _$$_LobbyUpdateCopyWith(
          _$_LobbyUpdate value, $Res Function(_$_LobbyUpdate) then) =
      __$$_LobbyUpdateCopyWithImpl<$Res>;
  @useResult
  $Res call({List<dynamic> rooms});
}

/// @nodoc
class __$$_LobbyUpdateCopyWithImpl<$Res>
    extends _$ServerMessageCopyWithImpl<$Res, _$_LobbyUpdate>
    implements _$$_LobbyUpdateCopyWith<$Res> {
  __$$_LobbyUpdateCopyWithImpl(
      _$_LobbyUpdate _value, $Res Function(_$_LobbyUpdate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rooms = null,
  }) {
    return _then(_$_LobbyUpdate(
      rooms: null == rooms
          ? _value._rooms
          : rooms // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LobbyUpdate implements _LobbyUpdate {
  const _$_LobbyUpdate(
      {required final List<dynamic> rooms, final String? $type})
      : _rooms = rooms,
        $type = $type ?? 'lobbyUpdate';

  factory _$_LobbyUpdate.fromJson(Map<String, dynamic> json) =>
      _$$_LobbyUpdateFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LobbyUpdate &&
            const DeepCollectionEquality().equals(other._rooms, _rooms));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_rooms));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LobbyUpdateCopyWith<_$_LobbyUpdate> get copyWith =>
      __$$_LobbyUpdateCopyWithImpl<_$_LobbyUpdate>(this, _$identity);

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
    return _$$_LobbyUpdateToJson(
      this,
    );
  }
}

abstract class _LobbyUpdate implements ServerMessage {
  const factory _LobbyUpdate({required final List<dynamic> rooms}) =
      _$_LobbyUpdate;

  factory _LobbyUpdate.fromJson(Map<String, dynamic> json) =
      _$_LobbyUpdate.fromJson;

  List<dynamic> get rooms;
  @JsonKey(ignore: true)
  _$$_LobbyUpdateCopyWith<_$_LobbyUpdate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GameStateUpdateCopyWith<$Res> {
  factory _$$_GameStateUpdateCopyWith(
          _$_GameStateUpdate value, $Res Function(_$_GameStateUpdate) then) =
      __$$_GameStateUpdateCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, dynamic> state});
}

/// @nodoc
class __$$_GameStateUpdateCopyWithImpl<$Res>
    extends _$ServerMessageCopyWithImpl<$Res, _$_GameStateUpdate>
    implements _$$_GameStateUpdateCopyWith<$Res> {
  __$$_GameStateUpdateCopyWithImpl(
      _$_GameStateUpdate _value, $Res Function(_$_GameStateUpdate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
  }) {
    return _then(_$_GameStateUpdate(
      state: null == state
          ? _value._state
          : state // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GameStateUpdate implements _GameStateUpdate {
  const _$_GameStateUpdate(
      {required final Map<String, dynamic> state, final String? $type})
      : _state = state,
        $type = $type ?? 'gameStateUpdate';

  factory _$_GameStateUpdate.fromJson(Map<String, dynamic> json) =>
      _$$_GameStateUpdateFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GameStateUpdate &&
            const DeepCollectionEquality().equals(other._state, _state));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_state));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GameStateUpdateCopyWith<_$_GameStateUpdate> get copyWith =>
      __$$_GameStateUpdateCopyWithImpl<_$_GameStateUpdate>(this, _$identity);

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
    return _$$_GameStateUpdateToJson(
      this,
    );
  }
}

abstract class _GameStateUpdate implements ServerMessage {
  const factory _GameStateUpdate({required final Map<String, dynamic> state}) =
      _$_GameStateUpdate;

  factory _GameStateUpdate.fromJson(Map<String, dynamic> json) =
      _$_GameStateUpdate.fromJson;

  Map<String, dynamic> get state;
  @JsonKey(ignore: true)
  _$$_GameStateUpdateCopyWith<_$_GameStateUpdate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, String code});
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res>
    extends _$ServerMessageCopyWithImpl<$Res, _$_Error>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = null,
  }) {
    return _then(_$_Error(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Error implements _Error {
  const _$_Error(
      {required this.message, required this.code, final String? $type})
      : $type = $type ?? 'error';

  factory _$_Error.fromJson(Map<String, dynamic> json) =>
      _$$_ErrorFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Error &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      __$$_ErrorCopyWithImpl<_$_Error>(this, _$identity);

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
    return _$$_ErrorToJson(
      this,
    );
  }
}

abstract class _Error implements ServerMessage {
  const factory _Error(
      {required final String message, required final String code}) = _$_Error;

  factory _Error.fromJson(Map<String, dynamic> json) = _$_Error.fromJson;

  String get message;
  String get code;
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_NotificationCopyWith<$Res> {
  factory _$$_NotificationCopyWith(
          _$_Notification value, $Res Function(_$_Notification) then) =
      __$$_NotificationCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_NotificationCopyWithImpl<$Res>
    extends _$ServerMessageCopyWithImpl<$Res, _$_Notification>
    implements _$$_NotificationCopyWith<$Res> {
  __$$_NotificationCopyWithImpl(
      _$_Notification _value, $Res Function(_$_Notification) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_Notification(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Notification implements _Notification {
  const _$_Notification({required this.message, final String? $type})
      : $type = $type ?? 'notification';

  factory _$_Notification.fromJson(Map<String, dynamic> json) =>
      _$$_NotificationFromJson(json);

  @override
  final String message;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ServerMessage.notification(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Notification &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotificationCopyWith<_$_Notification> get copyWith =>
      __$$_NotificationCopyWithImpl<_$_Notification>(this, _$identity);

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
    return _$$_NotificationToJson(
      this,
    );
  }
}

abstract class _Notification implements ServerMessage {
  const factory _Notification({required final String message}) =
      _$_Notification;

  factory _Notification.fromJson(Map<String, dynamic> json) =
      _$_Notification.fromJson;

  String get message;
  @JsonKey(ignore: true)
  _$$_NotificationCopyWith<_$_Notification> get copyWith =>
      throw _privateConstructorUsedError;
}
