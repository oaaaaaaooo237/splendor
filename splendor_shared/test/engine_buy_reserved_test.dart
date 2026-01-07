import 'package:test/test.dart';
import 'package:splendor_shared/splendor_shared.dart';
import 'package:splendor_shared/src/logic/engine/splendor_game_engine.dart';
import 'package:splendor_shared/src/logic/strategies/win_strategy.dart';

// CONTEXT:
// Test: EngineBuyReservedTest
// Libraries: test, splendor_shared, splendor_game_engine, win_strategy
// Purpose: Verify buy_reserved action with correct engine initialization.
void main() {
  group('SplendorGameEngine - Buy Reserved', () {
    test('should allow buying a reserved card', () {
      // 1. Setup
      final player = const PlayerIdentity(uuid: 'p1', name: 'Player 1', avatarId: 'a1');
      final card = SplendorCard(id: 'c1', tier: 1, points: 0, bonusGem: Gem.blue, cost: {Gem.white: 1});
      
      final initialState = GameState(
        id: 'test_game',
        players: [player],
        turnIndex: 0,
        status: GameStatus.playing,
        availableGems: {Gem.white: 10, Gem.blue: 10, Gem.green: 10, Gem.red: 10, Gem.black: 10, Gem.gold: 5},
        tier1Cards: [],
        tier2Cards: [],
        tier3Cards: [],
        nobles: [],
        playerStates: [
          PlayerState(
            playerId: player.uuid,
            gems: {Gem.white: 5, Gem.gold: 1}, // Enough to buy
            reservedCards: [card], // Card is reserved
            purchasedCards: [],
            bonuses: {},
            nobles: [],
            score: 0
          )
        ],
        isDraftValid: false,
        draftAction: null,
      );

      final engine = SplendorGameEngine(
        initialState: initialState,
        winStrategy: PointsWinStrategy(targetPoints: 15),
      );

      // 2. Action: Buy Reserved
      final action = {
        'type': 'buy_reserved',
        'cardId': 'c1',
        'playerId': 'p1'
      };

      // 3. Apply
      engine.applyAction(action);

      // 4. Verify
      final pState = engine.currentState.playerStates.first;
      expect(pState.reservedCards, isEmpty);
      expect(pState.purchasedCards, contains(card));
      expect(pState.bonuses[Gem.blue], 1); // Bonus added
      expect(pState.gems[Gem.white], 4); // Cost paid (5 - 1)
    });
  });
}
