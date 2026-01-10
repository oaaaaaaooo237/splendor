// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'noble.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Noble _$NobleFromJson(Map<String, dynamic> json) {
  return _Noble.fromJson(json);
}

/// @nodoc
mixin _$Noble {
  String get id => throw _privateConstructorUsedError;
  int get points => throw _privateConstructorUsedError;
  Map<Gem, int> get requirements => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NobleCopyWith<Noble> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NobleCopyWith<$Res> {
  factory $NobleCopyWith(Noble value, $Res Function(Noble) then) =
      _$NobleCopyWithImpl<$Res, Noble>;
  @useResult
  $Res call({String id, int points, Map<Gem, int> requirements});
}

/// @nodoc
class _$NobleCopyWithImpl<$Res, $Val extends Noble>
    implements $NobleCopyWith<$Res> {
  _$NobleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? points = null,
    Object? requirements = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      requirements: null == requirements
          ? _value.requirements
          : requirements // ignore: cast_nullable_to_non_nullable
              as Map<Gem, int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NobleCopyWith<$Res> implements $NobleCopyWith<$Res> {
  factory _$$_NobleCopyWith(_$_Noble value, $Res Function(_$_Noble) then) =
      __$$_NobleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, int points, Map<Gem, int> requirements});
}

/// @nodoc
class __$$_NobleCopyWithImpl<$Res> extends _$NobleCopyWithImpl<$Res, _$_Noble>
    implements _$$_NobleCopyWith<$Res> {
  __$$_NobleCopyWithImpl(_$_Noble _value, $Res Function(_$_Noble) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? points = null,
    Object? requirements = null,
  }) {
    return _then(_$_Noble(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      requirements: null == requirements
          ? _value._requirements
          : requirements // ignore: cast_nullable_to_non_nullable
              as Map<Gem, int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Noble implements _Noble {
  const _$_Noble(
      {required this.id,
      required this.points,
      required final Map<Gem, int> requirements})
      : _requirements = requirements;

  factory _$_Noble.fromJson(Map<String, dynamic> json) =>
      _$$_NobleFromJson(json);

  @override
  final String id;
  @override
  final int points;
  final Map<Gem, int> _requirements;
  @override
  Map<Gem, int> get requirements {
    if (_requirements is EqualUnmodifiableMapView) return _requirements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_requirements);
  }

  @override
  String toString() {
    return 'Noble(id: $id, points: $points, requirements: $requirements)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Noble &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.points, points) || other.points == points) &&
            const DeepCollectionEquality()
                .equals(other._requirements, _requirements));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, points,
      const DeepCollectionEquality().hash(_requirements));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NobleCopyWith<_$_Noble> get copyWith =>
      __$$_NobleCopyWithImpl<_$_Noble>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NobleToJson(
      this,
    );
  }
}

abstract class _Noble implements Noble {
  const factory _Noble(
      {required final String id,
      required final int points,
      required final Map<Gem, int> requirements}) = _$_Noble;

  factory _Noble.fromJson(Map<String, dynamic> json) = _$_Noble.fromJson;

  @override
  String get id;
  @override
  int get points;
  @override
  Map<Gem, int> get requirements;
  @override
  @JsonKey(ignore: true)
  _$$_NobleCopyWith<_$_Noble> get copyWith =>
      throw _privateConstructorUsedError;
}
