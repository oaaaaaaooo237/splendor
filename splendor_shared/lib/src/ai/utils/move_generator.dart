import '../../models/game/game_state.dart';
import '../../models/game/gem.dart';
import '../../models/game/card.dart';
import '../../logic/validators/action_validator.dart';

class MoveGenerator {
  /// Generates a list of all legally possible actions for the current player.
  /// This is expensive and intended for AI use.
  static List<Map<String, dynamic>> generateAllMoves(GameState state, String playerId) {
    List<Map<String, dynamic>> moves = [];
    
    // Helper to add if valid
    void addIfValid(Map<String, dynamic> action) {
      if (ActionValidator.validate(state, action) == null) {
        moves.add(action);
      }
    }

    // 1. Buy Card (From Board)
    List<SplendorCard> allVisible = [...state.tier1Cards, ...state.tier2Cards, ...state.tier3Cards];
    for (var card in allVisible) {
      addIfValid({
        'type': 'buy_card',
        'cardId': card.id,
        'playerId': playerId
      });
    }
    
    // 2. Buy Card (From Reserved)
    // Find player state
    final playerState = state.playerStates.firstWhere(
      (p) => p.playerId == playerId, 
      orElse: () => throw Exception("Player state not found for $playerId")
    );

    for (var card in playerState.reservedCards) {
      addIfValid({
        'type': 'buy_reserved', // Distinct type for clarity/validator
        'cardId': card.id, 
        'playerId': playerId
      });
    }
    
    // 3. Reserve Card (From Board)
    // Only if reservation < 3
    if (playerState.reservedCards.length < 3) {
      for (var card in allVisible) {
        addIfValid({
          'type': 'reserve_card',
          'cardId': card.id,
          'playerId': playerId
        });
      }

      // 4. Reserve Card (From Deck)
      if (state.tier1DeckCount > 0) {
        addIfValid({'type': 'reserve_deck', 'tier': 1, 'playerId': playerId});
      }
      if (state.tier2DeckCount > 0) {
        addIfValid({'type': 'reserve_deck', 'tier': 2, 'playerId': playerId});
      }
      if (state.tier3DeckCount > 0) {
        addIfValid({'type': 'reserve_deck', 'tier': 3, 'playerId': playerId});
      }
    }
    
    // 5. Take Gems
    // 5a. Receive 2 of specific color (if stack >= 4)
    // Validator handles the stack >= 4 check usually, but we can pre-check or let validator do it.
    for (var gem in Gem.values) {
      if (gem == Gem.gold) continue;
      // Pre-optimization: check if available >= 4
      if ((state.availableGems[gem] ?? 0) >= 4) {
         addIfValid({
           'type': 'take_gems',
           'gems': {gem.name: 2},
           'playerId': playerId
         });
      }
    }
    
    // 5b. Receive 3 distinct colors
    // Algorithm: Iterate all combinations of 3 distinct non-gold gems.
    final colors = Gem.values.where((g) => g != Gem.gold).toList();
    // 5 colors: White, Blue, Green, Red, Black
    // Combinations C(5, 3) = 10.
    for (int i = 0; i < colors.length; i++) {
        for (int j = i + 1; j < colors.length; j++) {
            for (int k = j + 1; k < colors.length; k++) {
                // Must be available
                if ((state.availableGems[colors[i]] ?? 0) > 0 &&
                    (state.availableGems[colors[j]] ?? 0) > 0 &&
                    (state.availableGems[colors[k]] ?? 0) > 0) {
                      addIfValid({
                        'type': 'take_gems',
                        'gems': {
                          colors[i].name: 1,
                          colors[j].name: 1,
                          colors[k].name: 1
                        },
                        'playerId': playerId
                      });
                    }
            }
        }
    }
    
    return moves;
  }
}
