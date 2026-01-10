// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SplendorCard _$SplendorCardFromJson(Map<String, dynamic> json) {
  return _SplendorCard.fromJson(json);
}

/// @nodoc
mixin _$SplendorCard {
  String get id => throw _privateConstructorUsedError;
  int get tier => throw _privateConstructorUsedError; // 1, 2, 3
  int get points => throw _privateConstructorUsedError;
  Gem get bonusGem =>
      throw _privateConstructorUsedError; // The gem this card provides
  Map<Gem, int> get cost => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SplendorCardCopyWith<SplendorCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplendorCardCopyWith<$Res> {
  factory $SplendorCardCopyWith(
          SplendorCard value, $Res Function(SplendorCard) then) =
      _$SplendorCardCopyWithImpl<$Res, SplendorCard>;
  @useResult
  $Res call(
      {String id, int tier, int points, Gem bonusGem, Map<Gem, int> cost});
}

/// @nodoc
class _$SplendorCardCopyWithImpl<$Res, $Val extends SplendorCard>
    implements $SplendorCardCopyWith<$Res> {
  _$SplendorCardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tier = null,
    Object? points = null,
    Object? bonusGem = null,
    Object? cost = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      tier: null == tier
          ? _value.tier
          : tier // ignore: cast_nullable_to_non_nullable
              as int,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      bonusGem: null == bonusGem
          ? _value.bonusGem
          : bonusGem // ignore: cast_nullable_to_non_nullable
              as Gem,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as Map<Gem, int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SplendorCardCopyWith<$Res>
    implements $SplendorCardCopyWith<$Res> {
  factory _$$_SplendorCardCopyWith(
          _$_SplendorCard value, $Res Function(_$_SplendorCard) then) =
      __$$_SplendorCardCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, int tier, int points, Gem bonusGem, Map<Gem, int> cost});
}

/// @nodoc
class __$$_SplendorCardCopyWithImpl<$Res>
    extends _$SplendorCardCopyWithImpl<$Res, _$_SplendorCard>
    implements _$$_SplendorCardCopyWith<$Res> {
  __$$_SplendorCardCopyWithImpl(
      _$_SplendorCard _value, $Res Function(_$_SplendorCard) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tier = null,
    Object? points = null,
    Object? bonusGem = null,
    Object? cost = null,
  }) {
    return _then(_$_SplendorCard(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      tier: null == tier
          ? _value.tier
          : tier // ignore: cast_nullable_to_non_nullable
              as int,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      bonusGem: null == bonusGem
          ? _value.bonusGem
          : bonusGem // ignore: cast_nullable_to_non_nullable
              as Gem,
      cost: null == cost
          ? _value._cost
          : cost // ignore: cast_nullable_to_non_nullable
              as Map<Gem, int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SplendorCard implements _SplendorCard {
  const _$_SplendorCard(
      {required this.id,
      required this.tier,
      required this.points,
      required this.bonusGem,
      required final Map<Gem, int> cost})
      : _cost = cost;

  factory _$_SplendorCard.fromJson(Map<String, dynamic> json) =>
      _$$_SplendorCardFromJson(json);

  @override
  final String id;
  @override
  final int tier;
// 1, 2, 3
  @override
  final int points;
  @override
  final Gem bonusGem;
// The gem this card provides
  final Map<Gem, int> _cost;
// The gem this card provides
  @override
  Map<Gem, int> get cost {
    if (_cost is EqualUnmodifiableMapView) return _cost;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_cost);
  }

  @override
  String toString() {
    return 'SplendorCard(id: $id, tier: $tier, points: $points, bonusGem: $bonusGem, cost: $cost)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SplendorCard &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tier, tier) || other.tier == tier) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.bonusGem, bonusGem) ||
                other.bonusGem == bonusGem) &&
            const DeepCollectionEquality().equals(other._cost, _cost));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, tier, points, bonusGem,
      const DeepCollectionEquality().hash(_cost));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SplendorCardCopyWith<_$_SplendorCard> get copyWith =>
      __$$_SplendorCardCopyWithImpl<_$_SplendorCard>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SplendorCardToJson(
      this,
    );
  }
}

abstract class _SplendorCard implements SplendorCard {
  const factory _SplendorCard(
      {required final String id,
      required final int tier,
      required final int points,
      required final Gem bonusGem,
      required final Map<Gem, int> cost}) = _$_SplendorCard;

  factory _SplendorCard.fromJson(Map<String, dynamic> json) =
      _$_SplendorCard.fromJson;

  @override
  String get id;
  @override
  int get tier;
  @override // 1, 2, 3
  int get points;
  @override
  Gem get bonusGem;
  @override // The gem this card provides
  Map<Gem, int> get cost;
  @override
  @JsonKey(ignore: true)
  _$$_SplendorCardCopyWith<_$_SplendorCard> get copyWith =>
      throw _privateConstructorUsedError;
}
