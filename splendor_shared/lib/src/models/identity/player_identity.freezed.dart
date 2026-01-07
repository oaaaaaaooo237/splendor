// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_identity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PlayerIdentity _$PlayerIdentityFromJson(Map<String, dynamic> json) {
  return _PlayerIdentity.fromJson(json);
}

/// @nodoc
mixin _$PlayerIdentity {
  String get uuid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get avatarId => throw _privateConstructorUsedError;
  bool get isBot => throw _privateConstructorUsedError;

  /// Serializes this PlayerIdentity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlayerIdentity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlayerIdentityCopyWith<PlayerIdentity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerIdentityCopyWith<$Res> {
  factory $PlayerIdentityCopyWith(
    PlayerIdentity value,
    $Res Function(PlayerIdentity) then,
  ) = _$PlayerIdentityCopyWithImpl<$Res, PlayerIdentity>;
  @useResult
  $Res call({String uuid, String name, String avatarId, bool isBot});
}

/// @nodoc
class _$PlayerIdentityCopyWithImpl<$Res, $Val extends PlayerIdentity>
    implements $PlayerIdentityCopyWith<$Res> {
  _$PlayerIdentityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlayerIdentity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? name = null,
    Object? avatarId = null,
    Object? isBot = null,
  }) {
    return _then(
      _value.copyWith(
            uuid: null == uuid
                ? _value.uuid
                : uuid // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            avatarId: null == avatarId
                ? _value.avatarId
                : avatarId // ignore: cast_nullable_to_non_nullable
                      as String,
            isBot: null == isBot
                ? _value.isBot
                : isBot // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PlayerIdentityImplCopyWith<$Res>
    implements $PlayerIdentityCopyWith<$Res> {
  factory _$$PlayerIdentityImplCopyWith(
    _$PlayerIdentityImpl value,
    $Res Function(_$PlayerIdentityImpl) then,
  ) = __$$PlayerIdentityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uuid, String name, String avatarId, bool isBot});
}

/// @nodoc
class __$$PlayerIdentityImplCopyWithImpl<$Res>
    extends _$PlayerIdentityCopyWithImpl<$Res, _$PlayerIdentityImpl>
    implements _$$PlayerIdentityImplCopyWith<$Res> {
  __$$PlayerIdentityImplCopyWithImpl(
    _$PlayerIdentityImpl _value,
    $Res Function(_$PlayerIdentityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PlayerIdentity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? name = null,
    Object? avatarId = null,
    Object? isBot = null,
  }) {
    return _then(
      _$PlayerIdentityImpl(
        uuid: null == uuid
            ? _value.uuid
            : uuid // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        avatarId: null == avatarId
            ? _value.avatarId
            : avatarId // ignore: cast_nullable_to_non_nullable
                  as String,
        isBot: null == isBot
            ? _value.isBot
            : isBot // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PlayerIdentityImpl implements _PlayerIdentity {
  const _$PlayerIdentityImpl({
    required this.uuid,
    required this.name,
    required this.avatarId,
    this.isBot = false,
  });

  factory _$PlayerIdentityImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlayerIdentityImplFromJson(json);

  @override
  final String uuid;
  @override
  final String name;
  @override
  final String avatarId;
  @override
  @JsonKey()
  final bool isBot;

  @override
  String toString() {
    return 'PlayerIdentity(uuid: $uuid, name: $name, avatarId: $avatarId, isBot: $isBot)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerIdentityImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatarId, avatarId) ||
                other.avatarId == avatarId) &&
            (identical(other.isBot, isBot) || other.isBot == isBot));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, uuid, name, avatarId, isBot);

  /// Create a copy of PlayerIdentity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerIdentityImplCopyWith<_$PlayerIdentityImpl> get copyWith =>
      __$$PlayerIdentityImplCopyWithImpl<_$PlayerIdentityImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PlayerIdentityImplToJson(this);
  }
}

abstract class _PlayerIdentity implements PlayerIdentity {
  const factory _PlayerIdentity({
    required final String uuid,
    required final String name,
    required final String avatarId,
    final bool isBot,
  }) = _$PlayerIdentityImpl;

  factory _PlayerIdentity.fromJson(Map<String, dynamic> json) =
      _$PlayerIdentityImpl.fromJson;

  @override
  String get uuid;
  @override
  String get name;
  @override
  String get avatarId;
  @override
  bool get isBot;

  /// Create a copy of PlayerIdentity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlayerIdentityImplCopyWith<_$PlayerIdentityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
