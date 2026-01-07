import 'package:test/test.dart';
import 'package:splendor_shared/splendor_shared.dart';

void main() {
  group('SplendorGameEngine Execution Tests', () {
    late SplendorGameEngine engine;
    late GameState initialState;
    
    // Mock Cards
    final card1 = SplendorCard(
       id: 'c1', tier: 1, points: 1, bonusGem: Gem.red,
       cost: {Gem.blue: 1} // Costs 1 Blue
    );
    final card2 = SplendorCard(
       id: 'c2', tier: 1, points: 2, bonusGem: Gem.blue, 
       cost: {Gem.red: 2}
    );
    
    setUp(() {
       initialState = GameState(
        id: 'test-game',
        players: [
           PlayerIdentity(uuid: 'p1', name: 'Alice', avatarId: '1'),
           PlayerIdentity(uuid: 'p2', name: 'Bob', avatarId: '2'),
        ],
        turnIndex: 0,
        status: GameStatus.playing,
        availableGems: {Gem.red: 4, Gem.blue: 4, Gem.green: 4, Gem.white: 4, Gem.black: 4, Gem.gold: 5},
        tier1Cards: [card1],
        tier2Cards: [card2],
        tier3Cards: [],
        nobles: [],
        playerStates: [
          PlayerState(
             playerId: 'p1', 
             gems: {Gem.blue: 2}, // Has 2 Blue
             bonuses: {}, 
             reservedCards: [], 
             purchasedCards: [], 
             nobles: [], 
             score: 0
          ),
          PlayerState(
             playerId: 'p2', 
             gems: {}, 
             bonuses: {}, 
             reservedCards: [], 
             purchasedCards: [], 
             nobles: [], 
             score: 0
          ),
        ],
        isDraftValid: false,
        draftAction: null,
      );
      
      engine = SplendorGameEngine(
        initialState: initialState,
        winStrategy: PointsWinStrategy(targetPoints: 15),
      );
    });

    test('buy_card executes correctly', () {
       // Action: p1 buys card1 (Cost 1 Blue)
       final action = {
          'type': 'buy_card',
          'cardId': 'c1',
          'playerId': 'p1',
          // No replacement for simple test, or empty
       };
       
       engine.applyAction(action);
       
       final p1 = engine.currentState.playerStates[0];
       
       // Verify gems deducted: Started with 2 Blue, Cost 1 -> 1 Blue left
       expect(p1.gems[Gem.blue], equals(1));
       
       // Verify card added
       expect(p1.purchasedCards.length, equals(1));
       expect(p1.purchasedCards.first.id, equals('c1'));
       
       // Verify bonus added
       expect(p1.bonuses[Gem.red], equals(1));
       
       // Verify score
       expect(p1.score, equals(1));
       
       // Verify board updated
       expect(engine.currentState.tier1Cards.isEmpty, isTrue);
       
       // Verify turn advanced
       expect(engine.currentState.turnIndex, equals(1));
    });

    test('take_gems executes correctly', () {
       final action = {
          'type': 'take_gems',
          'gems': {'red': 1, 'green': 1, 'black': 1},
          'playerId': 'p1'
       };
       
       engine.applyAction(action);
       
       final p1 = engine.currentState.playerStates[0];
       expect(p1.gems[Gem.red], equals(1));
       expect(p1.gems[Gem.green], equals(1));
       expect(p1.gems[Gem.black], equals(1));
       
       // Verify board gems deducted
       expect(engine.currentState.availableGems[Gem.red], equals(3));
    });
  });
}
