import 'package:test/test.dart';
import 'package:splendor_shared/splendor_shared.dart';

void main() {
  group('StandardBoardEvaluator Tests', () {
    final evaluator = StandardBoardEvaluator();

    test('Evaluator scores points correctly', () {
      final state = GameState(
        id: 'eval-test',
        players: [PlayerIdentity(uuid: 'p1', name: 'Bot', avatarId: '1')],
        turnIndex: 0,
        status: GameStatus.playing,
        availableGems: {},
        tier1Cards: [], tier2Cards: [], tier3Cards: [], nobles: [],
        playerStates: [
          PlayerState(
            playerId: 'p1', 
            gems: {}, 
            bonuses: {}, 
            reservedCards: [], 
            purchasedCards: [], 
            nobles: [], 
            score: 3 // 300 points
          )
        ],
        isDraftValid: false, draftAction: null,
      );

      final score = evaluator.evaluate(state, 'p1');
      expect(score, equals(300.0));
    });

    test('Evaluator includes gems and production', () {
      final state = GameState(
        id: 'eval-test-2',
        players: [PlayerIdentity(uuid: 'p1', name: 'Bot', avatarId: '1')],
        turnIndex: 0,
        status: GameStatus.playing,
        availableGems: {},
        tier1Cards: [], tier2Cards: [], tier3Cards: [], nobles: [],
        playerStates: [
          PlayerState(
            playerId: 'p1', 
            gems: {Gem.red: 2, Gem.blue: 1}, // 3 * 1 = 3
            bonuses: {}, 
            reservedCards: [], 
            purchasedCards: [
              SplendorCard(id: 'c1', tier: 1, points: 0, bonusGem: Gem.white, cost: {})
            ], // 1 * 10 = 10
            nobles: [], 
            score: 0
          )
        ],
        isDraftValid: false, draftAction: null,
      );

      final score = evaluator.evaluate(state, 'p1');
      // 0 + 10 (prod) + 3 (gems) = 13.0
      expect(score, equals(13.0));
    });
  });
}
