import 'package:test/test.dart';
import 'package:splendor_shared/splendor_shared.dart';
import 'package:splendor_shared/src/ai/bots/easy_bot.dart';
import 'package:splendor_shared/src/ai/bots/standard_bot.dart';
import 'package:splendor_shared/src/ai/bots/hard_bot.dart';

void main() {
  group('Bot Integration Tests', () {
    late GameState state;

    setUp(() {
      state = GameState(
        id: 'bot-test-game',
        players: [
           PlayerIdentity(uuid: 'p1', name: 'EasyBot', avatarId: '1'),
           PlayerIdentity(uuid: 'p2', name: 'StandardBot', avatarId: '2'),
        ],
        turnIndex: 0,
        status: GameStatus.playing,
        availableGems: {Gem.white: 4, Gem.blue: 4, Gem.green: 4, Gem.red: 4, Gem.black: 4, Gem.gold: 5},
        tier1Cards: [], tier2Cards: [], tier3Cards: [], nobles: [],
        playerStates: [
          PlayerState(playerId: 'p1', gems: {}, bonuses: {}, reservedCards: [], purchasedCards: [], nobles: [], score: 0),
          PlayerState(playerId: 'p2', gems: {}, bonuses: {}, reservedCards: [], purchasedCards: [], nobles: [], score: 0),
        ],
        isDraftValid: false, draftAction: null,
      );
    });

    test('EasyBot generates a valid move', () async {
      final bot = EasyBot('p1');
      // Ensure at least one move exists (take gems)
      final move = await bot.computeNextMove(state);
      expect(move['type'], isNotNull);
      expect(move['playerId'], equals('p1'));
    });

    test('StandardBot generates a valid move using simulation', () async {
      final bot = StandardBot('p2');
      // Ensure at least one move exists
      final move = await bot.computeNextMove(state);
      expect(move['type'], isNotNull);
      expect(move['playerId'], equals('p2'));
      
      // Since board is empty, can only take gems or reserve deck (if deck exists)
      // Actually deck count defaults to 0 in my setUp above?
      // State default is 0. MoveGenerator checks tierXDeckCount > 0.
      // So probably takes gems.
    });

    test('StandardBot picks buying card over taking gems (Greedy check)', () async {
       // Setup state where bot can buy a card worth points vs taking gems.
       // Card: 1 point, costs 0 (free!)
       final card = SplendorCard(id: 'free_point', tier: 1, points: 1, bonusGem: Gem.white, cost: {});
       state = state.copyWith(
          tier1Cards: [card],
          turnIndex: 1 // p2 turn
       );
       
       final bot = StandardBot('p2');
       final move = await bot.computeNextMove(state);
       
       // Should buy the card because it gives 100 evaluaton score (1 point) 
       // vs small score for gems.
       expect(move['type'], equals('buy_card'));
       expect(move['cardId'], equals('free_point'));
       expect(move['type'], equals('buy_card'));
       expect(move['cardId'], equals('free_point'));
    });

    test('HardBot picks buying card over taking gems (Greedy check)', () async {
       // Similar setup: Free point card should be prioritized
       final card = SplendorCard(id: 'free_point_hard', tier: 1, points: 1, bonusGem: Gem.white, cost: {});
       state = state.copyWith(
          tier1Cards: [card],
          turnIndex: 1 
          // Note: state.players[1] is StandardBot in setUp, but we can use HardBot to compute on this state
       );
       
       final bot = HardBot('p2'); // Reuse p2 ID
       final move = await bot.computeNextMove(state);
       
       expect(move['type'], equals('buy_card'));
       expect(move['cardId'], equals('free_point_hard'));
    });
  });
}
