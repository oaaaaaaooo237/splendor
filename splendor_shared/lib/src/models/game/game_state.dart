import 'package:freezed_annotation/freezed_annotation.dart';
import 'card.dart';
import 'noble.dart';
import 'gem.dart';
import '../identity/player_identity.dart';

part 'game_state.freezed.dart';
part 'game_state.g.dart';

enum GameStatus { lobby, playing, finished }

@freezed
class GameState with _$GameState {
  const factory GameState({
    required String id,
    required List<PlayerIdentity> players,
    required int turnIndex, // Whose turn is it?
    required GameStatus status,
    
    // Board State
    required Map<Gem, int> availableGems,
    required List<SplendorCard> tier1Cards, // Visible
    required List<SplendorCard> tier2Cards,
    required List<SplendorCard> tier3Cards,
    required List<Noble> nobles,
    
    // Deck Counts (For clients/bots to know if they can reserve from deck)
    @Default(0) int tier1DeckCount,
    @Default(0) int tier2DeckCount,
    @Default(0) int tier3DeckCount,
    
    // Player States (Simplified for shared model, might need detailed PlayerState class)
    // For now, let's assume we need a PlayerState object map or list. 
    // But to keep it simple v3.2, let's define PlayerState here or separate.
    // Let's create a separate PlayerState model inside this file or separate.
    required List<PlayerState> playerStates,
    
    // Draft / Tentative State
    Map<String, dynamic>? draftAction, // The current draft action content
    @Default(false) bool isDraftValid,

  }) = _GameState;

  factory GameState.fromJson(Map<String, dynamic> json) => _$GameStateFromJson(json);
}

@freezed
class PlayerState with _$PlayerState {
  const factory PlayerState({
    required String playerId,
    required Map<Gem, int> gems,
    required Map<Gem, int> bonuses, // From cards
    required List<SplendorCard> reservedCards,
    required List<SplendorCard> purchasedCards,
    required List<Noble> nobles,
    required int score,
  }) = _PlayerState;

  factory PlayerState.fromJson(Map<String, dynamic> json) => _$PlayerStateFromJson(json);
}
