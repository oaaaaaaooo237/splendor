// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

GameState _$GameStateFromJson(Map<String, dynamic> json) {
  return _GameState.fromJson(json);
}

/// @nodoc
mixin _$GameState {
  String get id => throw _privateConstructorUsedError;
  List<PlayerIdentity> get players => throw _privateConstructorUsedError;
  int get turnIndex => throw _privateConstructorUsedError; // Whose turn is it?
  GameStatus get status => throw _privateConstructorUsedError; // Board State
  Map<Gem, int> get availableGems => throw _privateConstructorUsedError;
  List<SplendorCard> get tier1Cards =>
      throw _privateConstructorUsedError; // Visible
  List<SplendorCard> get tier2Cards => throw _privateConstructorUsedError;
  List<SplendorCard> get tier3Cards => throw _privateConstructorUsedError;
  List<Noble> get nobles =>
      throw _privateConstructorUsedError; // Deck Counts (For clients/bots to know if they can reserve from deck)
  int get tier1DeckCount => throw _privateConstructorUsedError;
  int get tier2DeckCount => throw _privateConstructorUsedError;
  int get tier3DeckCount =>
      throw _privateConstructorUsedError; // Player States (Simplified for shared model, might need detailed PlayerState class)
  // For now, let's assume we need a PlayerState object map or list.
  // But to keep it simple v3.2, let's define PlayerState here or separate.
  // Let's create a separate PlayerState model inside this file or separate.
  List<PlayerState> get playerStates =>
      throw _privateConstructorUsedError; // Draft / Tentative State
  Map<String, dynamic>? get draftAction =>
      throw _privateConstructorUsedError; // The current draft action content
  bool get isDraftValid => throw _privateConstructorUsedError;

  /// Serializes this GameState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GameStateCopyWith<GameState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameStateCopyWith<$Res> {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) then) =
      _$GameStateCopyWithImpl<$Res, GameState>;
  @useResult
  $Res call({
    String id,
    List<PlayerIdentity> players,
    int turnIndex,
    GameStatus status,
    Map<Gem, int> availableGems,
    List<SplendorCard> tier1Cards,
    List<SplendorCard> tier2Cards,
    List<SplendorCard> tier3Cards,
    List<Noble> nobles,
    int tier1DeckCount,
    int tier2DeckCount,
    int tier3DeckCount,
    List<PlayerState> playerStates,
    Map<String, dynamic>? draftAction,
    bool isDraftValid,
  });
}

/// @nodoc
class _$GameStateCopyWithImpl<$Res, $Val extends GameState>
    implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? players = null,
    Object? turnIndex = null,
    Object? status = null,
    Object? availableGems = null,
    Object? tier1Cards = null,
    Object? tier2Cards = null,
    Object? tier3Cards = null,
    Object? nobles = null,
    Object? tier1DeckCount = null,
    Object? tier2DeckCount = null,
    Object? tier3DeckCount = null,
    Object? playerStates = null,
    Object? draftAction = freezed,
    Object? isDraftValid = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            players: null == players
                ? _value.players
                : players // ignore: cast_nullable_to_non_nullable
                      as List<PlayerIdentity>,
            turnIndex: null == turnIndex
                ? _value.turnIndex
                : turnIndex // ignore: cast_nullable_to_non_nullable
                      as int,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as GameStatus,
            availableGems: null == availableGems
                ? _value.availableGems
                : availableGems // ignore: cast_nullable_to_non_nullable
                      as Map<Gem, int>,
            tier1Cards: null == tier1Cards
                ? _value.tier1Cards
                : tier1Cards // ignore: cast_nullable_to_non_nullable
                      as List<SplendorCard>,
            tier2Cards: null == tier2Cards
                ? _value.tier2Cards
                : tier2Cards // ignore: cast_nullable_to_non_nullable
                      as List<SplendorCard>,
            tier3Cards: null == tier3Cards
                ? _value.tier3Cards
                : tier3Cards // ignore: cast_nullable_to_non_nullable
                      as List<SplendorCard>,
            nobles: null == nobles
                ? _value.nobles
                : nobles // ignore: cast_nullable_to_non_nullable
                      as List<Noble>,
            tier1DeckCount: null == tier1DeckCount
                ? _value.tier1DeckCount
                : tier1DeckCount // ignore: cast_nullable_to_non_nullable
                      as int,
            tier2DeckCount: null == tier2DeckCount
                ? _value.tier2DeckCount
                : tier2DeckCount // ignore: cast_nullable_to_non_nullable
                      as int,
            tier3DeckCount: null == tier3DeckCount
                ? _value.tier3DeckCount
                : tier3DeckCount // ignore: cast_nullable_to_non_nullable
                      as int,
            playerStates: null == playerStates
                ? _value.playerStates
                : playerStates // ignore: cast_nullable_to_non_nullable
                      as List<PlayerState>,
            draftAction: freezed == draftAction
                ? _value.draftAction
                : draftAction // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
            isDraftValid: null == isDraftValid
                ? _value.isDraftValid
                : isDraftValid // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GameStateImplCopyWith<$Res>
    implements $GameStateCopyWith<$Res> {
  factory _$$GameStateImplCopyWith(
    _$GameStateImpl value,
    $Res Function(_$GameStateImpl) then,
  ) = __$$GameStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    List<PlayerIdentity> players,
    int turnIndex,
    GameStatus status,
    Map<Gem, int> availableGems,
    List<SplendorCard> tier1Cards,
    List<SplendorCard> tier2Cards,
    List<SplendorCard> tier3Cards,
    List<Noble> nobles,
    int tier1DeckCount,
    int tier2DeckCount,
    int tier3DeckCount,
    List<PlayerState> playerStates,
    Map<String, dynamic>? draftAction,
    bool isDraftValid,
  });
}

/// @nodoc
class __$$GameStateImplCopyWithImpl<$Res>
    extends _$GameStateCopyWithImpl<$Res, _$GameStateImpl>
    implements _$$GameStateImplCopyWith<$Res> {
  __$$GameStateImplCopyWithImpl(
    _$GameStateImpl _value,
    $Res Function(_$GameStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? players = null,
    Object? turnIndex = null,
    Object? status = null,
    Object? availableGems = null,
    Object? tier1Cards = null,
    Object? tier2Cards = null,
    Object? tier3Cards = null,
    Object? nobles = null,
    Object? tier1DeckCount = null,
    Object? tier2DeckCount = null,
    Object? tier3DeckCount = null,
    Object? playerStates = null,
    Object? draftAction = freezed,
    Object? isDraftValid = null,
  }) {
    return _then(
      _$GameStateImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        players: null == players
            ? _value._players
            : players // ignore: cast_nullable_to_non_nullable
                  as List<PlayerIdentity>,
        turnIndex: null == turnIndex
            ? _value.turnIndex
            : turnIndex // ignore: cast_nullable_to_non_nullable
                  as int,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as GameStatus,
        availableGems: null == availableGems
            ? _value._availableGems
            : availableGems // ignore: cast_nullable_to_non_nullable
                  as Map<Gem, int>,
        tier1Cards: null == tier1Cards
            ? _value._tier1Cards
            : tier1Cards // ignore: cast_nullable_to_non_nullable
                  as List<SplendorCard>,
        tier2Cards: null == tier2Cards
            ? _value._tier2Cards
            : tier2Cards // ignore: cast_nullable_to_non_nullable
                  as List<SplendorCard>,
        tier3Cards: null == tier3Cards
            ? _value._tier3Cards
            : tier3Cards // ignore: cast_nullable_to_non_nullable
                  as List<SplendorCard>,
        nobles: null == nobles
            ? _value._nobles
            : nobles // ignore: cast_nullable_to_non_nullable
                  as List<Noble>,
        tier1DeckCount: null == tier1DeckCount
            ? _value.tier1DeckCount
            : tier1DeckCount // ignore: cast_nullable_to_non_nullable
                  as int,
        tier2DeckCount: null == tier2DeckCount
            ? _value.tier2DeckCount
            : tier2DeckCount // ignore: cast_nullable_to_non_nullable
                  as int,
        tier3DeckCount: null == tier3DeckCount
            ? _value.tier3DeckCount
            : tier3DeckCount // ignore: cast_nullable_to_non_nullable
                  as int,
        playerStates: null == playerStates
            ? _value._playerStates
            : playerStates // ignore: cast_nullable_to_non_nullable
                  as List<PlayerState>,
        draftAction: freezed == draftAction
            ? _value._draftAction
            : draftAction // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
        isDraftValid: null == isDraftValid
            ? _value.isDraftValid
            : isDraftValid // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GameStateImpl implements _GameState {
  const _$GameStateImpl({
    required this.id,
    required final List<PlayerIdentity> players,
    required this.turnIndex,
    required this.status,
    required final Map<Gem, int> availableGems,
    required final List<SplendorCard> tier1Cards,
    required final List<SplendorCard> tier2Cards,
    required final List<SplendorCard> tier3Cards,
    required final List<Noble> nobles,
    this.tier1DeckCount = 0,
    this.tier2DeckCount = 0,
    this.tier3DeckCount = 0,
    required final List<PlayerState> playerStates,
    final Map<String, dynamic>? draftAction,
    this.isDraftValid = false,
  }) : _players = players,
       _availableGems = availableGems,
       _tier1Cards = tier1Cards,
       _tier2Cards = tier2Cards,
       _tier3Cards = tier3Cards,
       _nobles = nobles,
       _playerStates = playerStates,
       _draftAction = draftAction;

  factory _$GameStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameStateImplFromJson(json);

  @override
  final String id;
  final List<PlayerIdentity> _players;
  @override
  List<PlayerIdentity> get players {
    if (_players is EqualUnmodifiableListView) return _players;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_players);
  }

  @override
  final int turnIndex;
  // Whose turn is it?
  @override
  final GameStatus status;
  // Board State
  final Map<Gem, int> _availableGems;
  // Board State
  @override
  Map<Gem, int> get availableGems {
    if (_availableGems is EqualUnmodifiableMapView) return _availableGems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_availableGems);
  }

  final List<SplendorCard> _tier1Cards;
  @override
  List<SplendorCard> get tier1Cards {
    if (_tier1Cards is EqualUnmodifiableListView) return _tier1Cards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tier1Cards);
  }

  // Visible
  final List<SplendorCard> _tier2Cards;
  // Visible
  @override
  List<SplendorCard> get tier2Cards {
    if (_tier2Cards is EqualUnmodifiableListView) return _tier2Cards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tier2Cards);
  }

  final List<SplendorCard> _tier3Cards;
  @override
  List<SplendorCard> get tier3Cards {
    if (_tier3Cards is EqualUnmodifiableListView) return _tier3Cards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tier3Cards);
  }

  final List<Noble> _nobles;
  @override
  List<Noble> get nobles {
    if (_nobles is EqualUnmodifiableListView) return _nobles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nobles);
  }

  // Deck Counts (For clients/bots to know if they can reserve from deck)
  @override
  @JsonKey()
  final int tier1DeckCount;
  @override
  @JsonKey()
  final int tier2DeckCount;
  @override
  @JsonKey()
  final int tier3DeckCount;
  // Player States (Simplified for shared model, might need detailed PlayerState class)
  // For now, let's assume we need a PlayerState object map or list.
  // But to keep it simple v3.2, let's define PlayerState here or separate.
  // Let's create a separate PlayerState model inside this file or separate.
  final List<PlayerState> _playerStates;
  // Player States (Simplified for shared model, might need detailed PlayerState class)
  // For now, let's assume we need a PlayerState object map or list.
  // But to keep it simple v3.2, let's define PlayerState here or separate.
  // Let's create a separate PlayerState model inside this file or separate.
  @override
  List<PlayerState> get playerStates {
    if (_playerStates is EqualUnmodifiableListView) return _playerStates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_playerStates);
  }

  // Draft / Tentative State
  final Map<String, dynamic>? _draftAction;
  // Draft / Tentative State
  @override
  Map<String, dynamic>? get draftAction {
    final value = _draftAction;
    if (value == null) return null;
    if (_draftAction is EqualUnmodifiableMapView) return _draftAction;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  // The current draft action content
  @override
  @JsonKey()
  final bool isDraftValid;

  @override
  String toString() {
    return 'GameState(id: $id, players: $players, turnIndex: $turnIndex, status: $status, availableGems: $availableGems, tier1Cards: $tier1Cards, tier2Cards: $tier2Cards, tier3Cards: $tier3Cards, nobles: $nobles, tier1DeckCount: $tier1DeckCount, tier2DeckCount: $tier2DeckCount, tier3DeckCount: $tier3DeckCount, playerStates: $playerStates, draftAction: $draftAction, isDraftValid: $isDraftValid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameStateImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._players, _players) &&
            (identical(other.turnIndex, turnIndex) ||
                other.turnIndex == turnIndex) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(
              other._availableGems,
              _availableGems,
            ) &&
            const DeepCollectionEquality().equals(
              other._tier1Cards,
              _tier1Cards,
            ) &&
            const DeepCollectionEquality().equals(
              other._tier2Cards,
              _tier2Cards,
            ) &&
            const DeepCollectionEquality().equals(
              other._tier3Cards,
              _tier3Cards,
            ) &&
            const DeepCollectionEquality().equals(other._nobles, _nobles) &&
            (identical(other.tier1DeckCount, tier1DeckCount) ||
                other.tier1DeckCount == tier1DeckCount) &&
            (identical(other.tier2DeckCount, tier2DeckCount) ||
                other.tier2DeckCount == tier2DeckCount) &&
            (identical(other.tier3DeckCount, tier3DeckCount) ||
                other.tier3DeckCount == tier3DeckCount) &&
            const DeepCollectionEquality().equals(
              other._playerStates,
              _playerStates,
            ) &&
            const DeepCollectionEquality().equals(
              other._draftAction,
              _draftAction,
            ) &&
            (identical(other.isDraftValid, isDraftValid) ||
                other.isDraftValid == isDraftValid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    const DeepCollectionEquality().hash(_players),
    turnIndex,
    status,
    const DeepCollectionEquality().hash(_availableGems),
    const DeepCollectionEquality().hash(_tier1Cards),
    const DeepCollectionEquality().hash(_tier2Cards),
    const DeepCollectionEquality().hash(_tier3Cards),
    const DeepCollectionEquality().hash(_nobles),
    tier1DeckCount,
    tier2DeckCount,
    tier3DeckCount,
    const DeepCollectionEquality().hash(_playerStates),
    const DeepCollectionEquality().hash(_draftAction),
    isDraftValid,
  );

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameStateImplCopyWith<_$GameStateImpl> get copyWith =>
      __$$GameStateImplCopyWithImpl<_$GameStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameStateImplToJson(this);
  }
}

abstract class _GameState implements GameState {
  const factory _GameState({
    required final String id,
    required final List<PlayerIdentity> players,
    required final int turnIndex,
    required final GameStatus status,
    required final Map<Gem, int> availableGems,
    required final List<SplendorCard> tier1Cards,
    required final List<SplendorCard> tier2Cards,
    required final List<SplendorCard> tier3Cards,
    required final List<Noble> nobles,
    final int tier1DeckCount,
    final int tier2DeckCount,
    final int tier3DeckCount,
    required final List<PlayerState> playerStates,
    final Map<String, dynamic>? draftAction,
    final bool isDraftValid,
  }) = _$GameStateImpl;

  factory _GameState.fromJson(Map<String, dynamic> json) =
      _$GameStateImpl.fromJson;

  @override
  String get id;
  @override
  List<PlayerIdentity> get players;
  @override
  int get turnIndex; // Whose turn is it?
  @override
  GameStatus get status; // Board State
  @override
  Map<Gem, int> get availableGems;
  @override
  List<SplendorCard> get tier1Cards; // Visible
  @override
  List<SplendorCard> get tier2Cards;
  @override
  List<SplendorCard> get tier3Cards;
  @override
  List<Noble> get nobles; // Deck Counts (For clients/bots to know if they can reserve from deck)
  @override
  int get tier1DeckCount;
  @override
  int get tier2DeckCount;
  @override
  int get tier3DeckCount; // Player States (Simplified for shared model, might need detailed PlayerState class)
  // For now, let's assume we need a PlayerState object map or list.
  // But to keep it simple v3.2, let's define PlayerState here or separate.
  // Let's create a separate PlayerState model inside this file or separate.
  @override
  List<PlayerState> get playerStates; // Draft / Tentative State
  @override
  Map<String, dynamic>? get draftAction; // The current draft action content
  @override
  bool get isDraftValid;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameStateImplCopyWith<_$GameStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PlayerState _$PlayerStateFromJson(Map<String, dynamic> json) {
  return _PlayerState.fromJson(json);
}

/// @nodoc
mixin _$PlayerState {
  String get playerId => throw _privateConstructorUsedError;
  Map<Gem, int> get gems => throw _privateConstructorUsedError;
  Map<Gem, int> get bonuses => throw _privateConstructorUsedError; // From cards
  List<SplendorCard> get reservedCards => throw _privateConstructorUsedError;
  List<SplendorCard> get purchasedCards => throw _privateConstructorUsedError;
  List<Noble> get nobles => throw _privateConstructorUsedError;
  int get score => throw _privateConstructorUsedError;

  /// Serializes this PlayerState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlayerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlayerStateCopyWith<PlayerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerStateCopyWith<$Res> {
  factory $PlayerStateCopyWith(
    PlayerState value,
    $Res Function(PlayerState) then,
  ) = _$PlayerStateCopyWithImpl<$Res, PlayerState>;
  @useResult
  $Res call({
    String playerId,
    Map<Gem, int> gems,
    Map<Gem, int> bonuses,
    List<SplendorCard> reservedCards,
    List<SplendorCard> purchasedCards,
    List<Noble> nobles,
    int score,
  });
}

/// @nodoc
class _$PlayerStateCopyWithImpl<$Res, $Val extends PlayerState>
    implements $PlayerStateCopyWith<$Res> {
  _$PlayerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlayerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playerId = null,
    Object? gems = null,
    Object? bonuses = null,
    Object? reservedCards = null,
    Object? purchasedCards = null,
    Object? nobles = null,
    Object? score = null,
  }) {
    return _then(
      _value.copyWith(
            playerId: null == playerId
                ? _value.playerId
                : playerId // ignore: cast_nullable_to_non_nullable
                      as String,
            gems: null == gems
                ? _value.gems
                : gems // ignore: cast_nullable_to_non_nullable
                      as Map<Gem, int>,
            bonuses: null == bonuses
                ? _value.bonuses
                : bonuses // ignore: cast_nullable_to_non_nullable
                      as Map<Gem, int>,
            reservedCards: null == reservedCards
                ? _value.reservedCards
                : reservedCards // ignore: cast_nullable_to_non_nullable
                      as List<SplendorCard>,
            purchasedCards: null == purchasedCards
                ? _value.purchasedCards
                : purchasedCards // ignore: cast_nullable_to_non_nullable
                      as List<SplendorCard>,
            nobles: null == nobles
                ? _value.nobles
                : nobles // ignore: cast_nullable_to_non_nullable
                      as List<Noble>,
            score: null == score
                ? _value.score
                : score // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PlayerStateImplCopyWith<$Res>
    implements $PlayerStateCopyWith<$Res> {
  factory _$$PlayerStateImplCopyWith(
    _$PlayerStateImpl value,
    $Res Function(_$PlayerStateImpl) then,
  ) = __$$PlayerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String playerId,
    Map<Gem, int> gems,
    Map<Gem, int> bonuses,
    List<SplendorCard> reservedCards,
    List<SplendorCard> purchasedCards,
    List<Noble> nobles,
    int score,
  });
}

/// @nodoc
class __$$PlayerStateImplCopyWithImpl<$Res>
    extends _$PlayerStateCopyWithImpl<$Res, _$PlayerStateImpl>
    implements _$$PlayerStateImplCopyWith<$Res> {
  __$$PlayerStateImplCopyWithImpl(
    _$PlayerStateImpl _value,
    $Res Function(_$PlayerStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PlayerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playerId = null,
    Object? gems = null,
    Object? bonuses = null,
    Object? reservedCards = null,
    Object? purchasedCards = null,
    Object? nobles = null,
    Object? score = null,
  }) {
    return _then(
      _$PlayerStateImpl(
        playerId: null == playerId
            ? _value.playerId
            : playerId // ignore: cast_nullable_to_non_nullable
                  as String,
        gems: null == gems
            ? _value._gems
            : gems // ignore: cast_nullable_to_non_nullable
                  as Map<Gem, int>,
        bonuses: null == bonuses
            ? _value._bonuses
            : bonuses // ignore: cast_nullable_to_non_nullable
                  as Map<Gem, int>,
        reservedCards: null == reservedCards
            ? _value._reservedCards
            : reservedCards // ignore: cast_nullable_to_non_nullable
                  as List<SplendorCard>,
        purchasedCards: null == purchasedCards
            ? _value._purchasedCards
            : purchasedCards // ignore: cast_nullable_to_non_nullable
                  as List<SplendorCard>,
        nobles: null == nobles
            ? _value._nobles
            : nobles // ignore: cast_nullable_to_non_nullable
                  as List<Noble>,
        score: null == score
            ? _value.score
            : score // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PlayerStateImpl implements _PlayerState {
  const _$PlayerStateImpl({
    required this.playerId,
    required final Map<Gem, int> gems,
    required final Map<Gem, int> bonuses,
    required final List<SplendorCard> reservedCards,
    required final List<SplendorCard> purchasedCards,
    required final List<Noble> nobles,
    required this.score,
  }) : _gems = gems,
       _bonuses = bonuses,
       _reservedCards = reservedCards,
       _purchasedCards = purchasedCards,
       _nobles = nobles;

  factory _$PlayerStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlayerStateImplFromJson(json);

  @override
  final String playerId;
  final Map<Gem, int> _gems;
  @override
  Map<Gem, int> get gems {
    if (_gems is EqualUnmodifiableMapView) return _gems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_gems);
  }

  final Map<Gem, int> _bonuses;
  @override
  Map<Gem, int> get bonuses {
    if (_bonuses is EqualUnmodifiableMapView) return _bonuses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_bonuses);
  }

  // From cards
  final List<SplendorCard> _reservedCards;
  // From cards
  @override
  List<SplendorCard> get reservedCards {
    if (_reservedCards is EqualUnmodifiableListView) return _reservedCards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reservedCards);
  }

  final List<SplendorCard> _purchasedCards;
  @override
  List<SplendorCard> get purchasedCards {
    if (_purchasedCards is EqualUnmodifiableListView) return _purchasedCards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_purchasedCards);
  }

  final List<Noble> _nobles;
  @override
  List<Noble> get nobles {
    if (_nobles is EqualUnmodifiableListView) return _nobles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nobles);
  }

  @override
  final int score;

  @override
  String toString() {
    return 'PlayerState(playerId: $playerId, gems: $gems, bonuses: $bonuses, reservedCards: $reservedCards, purchasedCards: $purchasedCards, nobles: $nobles, score: $score)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerStateImpl &&
            (identical(other.playerId, playerId) ||
                other.playerId == playerId) &&
            const DeepCollectionEquality().equals(other._gems, _gems) &&
            const DeepCollectionEquality().equals(other._bonuses, _bonuses) &&
            const DeepCollectionEquality().equals(
              other._reservedCards,
              _reservedCards,
            ) &&
            const DeepCollectionEquality().equals(
              other._purchasedCards,
              _purchasedCards,
            ) &&
            const DeepCollectionEquality().equals(other._nobles, _nobles) &&
            (identical(other.score, score) || other.score == score));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    playerId,
    const DeepCollectionEquality().hash(_gems),
    const DeepCollectionEquality().hash(_bonuses),
    const DeepCollectionEquality().hash(_reservedCards),
    const DeepCollectionEquality().hash(_purchasedCards),
    const DeepCollectionEquality().hash(_nobles),
    score,
  );

  /// Create a copy of PlayerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerStateImplCopyWith<_$PlayerStateImpl> get copyWith =>
      __$$PlayerStateImplCopyWithImpl<_$PlayerStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlayerStateImplToJson(this);
  }
}

abstract class _PlayerState implements PlayerState {
  const factory _PlayerState({
    required final String playerId,
    required final Map<Gem, int> gems,
    required final Map<Gem, int> bonuses,
    required final List<SplendorCard> reservedCards,
    required final List<SplendorCard> purchasedCards,
    required final List<Noble> nobles,
    required final int score,
  }) = _$PlayerStateImpl;

  factory _PlayerState.fromJson(Map<String, dynamic> json) =
      _$PlayerStateImpl.fromJson;

  @override
  String get playerId;
  @override
  Map<Gem, int> get gems;
  @override
  Map<Gem, int> get bonuses; // From cards
  @override
  List<SplendorCard> get reservedCards;
  @override
  List<SplendorCard> get purchasedCards;
  @override
  List<Noble> get nobles;
  @override
  int get score;

  /// Create a copy of PlayerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlayerStateImplCopyWith<_$PlayerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
