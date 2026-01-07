import 'dart:math';
import '../../models/game/game_state.dart';
import '../../models/game/card.dart';
import '../../models/game/noble.dart';
import '../../models/game/gem.dart';
import '../../models/identity/player_identity.dart';


// CONTEXT:
// Global Variables: None (Static Helper)
// Libraries:
// - dart:math (Random)
// - game_state.dart (GameState model)
// - card.dart, noble.dart, gem.dart (Game Elements)
// - player_identity.dart (Input)

class GameSetupHelper {
  static const int targetPoints = 15;


  
  // Refactored to return Record
  static ({
    GameState initialState, 
    List<SplendorCard> deck1, 
    List<SplendorCard> deck2, 
    List<SplendorCard> deck3
  }) setupGame(List<PlayerIdentity> players) {
     final random = Random();
     
     // Decks
     final d1 = _generateTier1Cards()..shuffle(random);
     final d2 = _generateTier2Cards()..shuffle(random);
     final d3 = _generateTier3Cards()..shuffle(random);
     
     // Nobles (N+1)
     final allNobles = _generateNobles()..shuffle(random);
     final noblesCount = players.length + 1;
     final selectedNobles = allNobles.take(noblesCount).toList();

     // Board
     final t1Board = d1.take(4).toList();
     final t2Board = d2.take(4).toList();
     final t3Board = d3.take(4).toList();
     
     final remainingD1 = d1.skip(4).toList();
     final remainingD2 = d2.skip(4).toList();
     final remainingD3 = d3.skip(4).toList();
     
     // Gems (Scale with players)
     // 2 Players: 4 gems each (Gold 5)
     // 3 Players: 5 gems each (Gold 5)
     // 4 Players: 7 gems each (Gold 5)
     int gemCount = 7;
     if (players.length == 2) gemCount = 4;
     if (players.length == 3) gemCount = 5;
     
     final gems = {
       Gem.white: gemCount, Gem.blue: gemCount, Gem.green: gemCount, 
       Gem.red: gemCount, Gem.black: gemCount, Gem.gold: 5
     };

     final state = GameState(
        id: "game_${DateTime.now().millisecondsSinceEpoch}",
        players: players,
        turnIndex: 0,
        status: GameStatus.playing,
        availableGems: gems,
        tier1Cards: t1Board,
        tier2Cards: t2Board,
        tier3Cards: t3Board,
        nobles: selectedNobles,
        playerStates: players.map((p) => PlayerState(
          playerId: p.uuid,
          gems: {}, bonuses: {}, reservedCards: [], purchasedCards: [], nobles: [], score: 0
        )).toList(),
        isDraftValid: false, draftAction: null,
        tier1DeckCount: remainingD1.length,
        tier2DeckCount: remainingD2.length,
        tier3DeckCount: remainingD3.length,
     );
     
     return (
       initialState: state,
       deck1: remainingD1,
       deck2: remainingD2,
       deck3: remainingD3
     );
  }

  // --- Mock Generators (To be replaced with full JSON later) ---
  static List<SplendorCard> _generateTier1Cards() {
     // Generate 40 cards
     return List.generate(40, (i) => SplendorCard(
        id: 't1_$i', tier: 1, 
        points: i % 5 == 0 ? 1 : 0, 
        bonusGem: Gem.values[i % 5], 
        cost: _randomCost(1, 4)
     ));
  }
  
  static List<SplendorCard> _generateTier2Cards() {
     // Generate 30 cards
     return List.generate(30, (i) => SplendorCard(
        id: 't2_$i', tier: 2, 
        points: 1 + (i % 3), 
        bonusGem: Gem.values[i % 5], 
        cost: _randomCost(2, 6)
     ));
  }
  
  static List<SplendorCard> _generateTier3Cards() {
     // Generate 20 cards
     return List.generate(20, (i) => SplendorCard(
        id: 't3_$i', tier: 3, 
        points: 3 + (i % 3), 
        bonusGem: Gem.values[i % 5], 
        cost: _randomCost(3, 10) // Expensive
     ));
  }
  
  static List<Noble> _generateNobles() {
     return List.generate(10, (i) => Noble(
       id: 'n_$i', 
       points: 3, 
       requirements: {
          Gem.values[i % 5]: 3,
          Gem.values[(i + 1) % 5]: 3,
          Gem.values[(i + 2) % 5]: 3
       }
     ));
  }
  
  static Map<Gem, int> _randomCost(int tier, int totalCost) {
     final r = Random();
     final cost = <Gem, int>{};
     int remaining = totalCost;
     while (remaining > 0) {
        final gem = Gem.values[r.nextInt(5)]; // No gold cost
        cost[gem] = (cost[gem] ?? 0) + 1;
        remaining--;
     }
     return cost;
  }
}
