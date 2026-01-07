import 'package:test/test.dart';
import 'package:splendor_shared/splendor_shared.dart';

void main() {
  group('MoveGenerator Tests', () {
    late GameState state;

    setUp(() {
      state = GameState(
        id: 'test-gen',
        players: [
           PlayerIdentity(uuid: 'p1', name: 'Bot', avatarId: '1'),
        ],
        turnIndex: 0,
        status: GameStatus.playing,
        availableGems: {Gem.white: 5, Gem.blue: 5, Gem.green: 5, Gem.red: 5, Gem.black: 5, Gem.gold: 5},
        tier1Cards: [],
        tier2Cards: [],
        tier3Cards: [],
        nobles: [],
        playerStates: [
           PlayerState(playerId: 'p1', gems: {}, bonuses: {}, reservedCards: [], purchasedCards: [], nobles: [], score: 0)
        ],
        isDraftValid: false, 
        draftAction: null,
        // New fields with defaults
        tier1DeckCount: 40,
        tier2DeckCount: 30,
        tier3DeckCount: 20
      );
    });

    test('Generates take 3 distinct gems moves', () {
      final moves = MoveGenerator.generateAllMoves(state, 'p1');
      
      // Filter for take_gems with 3 gems
      final take3 = moves.where((m) => m['type'] == 'take_gems' && (m['gems'] as Map).length == 3).toList();
      
      // C(5, 3) = 10 combinations
      expect(take3.length, equals(10));
      
      // Check one
      // {'gems': {'white': 1, 'blue': 1, 'green': 1}, ...}
      bool hasWBG = take3.any((m) {
         Map gems = m['gems'];
         return gems.containsKey('white') && gems.containsKey('blue') && gems.containsKey('green'); 
      });
      expect(hasWBG, isTrue);
    });

    test('Generates reserve from deck moves matches deck counts', () {
      final moves = MoveGenerator.generateAllMoves(state, 'p1');
      final reserveDeck = moves.where((m) => m['type'] == 'reserve_deck').toList();
      
      // Should have tier 1, 2, 3
      expect(reserveDeck.length, equals(3));
      expect(reserveDeck.any((m) => m['tier'] == 1), isTrue);
    });
    
    test('Reserve from deck respects empty decks', () {
       state = state.copyWith(tier1DeckCount: 0);
       final moves = MoveGenerator.generateAllMoves(state, 'p1');
       final reserveDeck1 = moves.where((m) => m['type'] == 'reserve_deck' && m['tier'] == 1);
       expect(reserveDeck1, isEmpty);
    });

    test('Buy Reserved Generates Moves', () {
       // Mock a reserved card
       final card = SplendorCard(id: 'c1', tier: 1, points: 0, bonusGem: Gem.white, cost: {Gem.blue: 1});
       final playerState = state.playerStates[0].copyWith(
         reservedCards: [card], 
         gems: {Gem.blue: 5} // Can afford
       );
       state = state.copyWith(playerStates: [playerState]);
       
       final moves = MoveGenerator.generateAllMoves(state, 'p1');
       final buyReserved = moves.where((m) => m['type'] == 'buy_reserved').toList();
       
       expect(buyReserved.length, equals(1));
       expect(buyReserved.first['cardId'], equals('c1'));
    });
  });
}
