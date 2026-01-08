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
     return List.generate(40, (i) {
        // Tier 1 Patterns:
        // 0 Pts: 3 (Small), 1+1+1+1 (Spread), 2+1 (Tiny), 2+2 (Mid), 2+2+1 (Mid)
        // 1 Pt: 4 (Single type - user disliked but it is standard for 1pt), OR 3+1? No standard is 4.
        
        final r = Random(i);
        final points = i % 10 < 4 ? 1 : 0; // 40% chance of 1 point (Standard is less but ok)
        
        List<int> pattern;
        if (points == 1) {
           pattern = [4]; // 4 of one color
        } else {
           // 0 points
           final p = r.nextInt(4);
           if (p == 0) pattern = [3];
           else if (p == 1) pattern = [1, 1, 1, 1];
           else if (p == 2) pattern = [2, 1];
           else pattern = [2, 2];
        }
        
        // If pattern is [4], user hated single color 4. Let's make it 2,2 for "Mock" or keep standard?
        // User said: "Tier 1 requirements weird... 3 white 4 white".
        // Let's soften it: [4] -> [2, 2].
        if (pattern.length == 1 && pattern[0] == 4) pattern = [2, 2];

        return SplendorCard(
           id: 't1_$i', tier: 1, 
           points: points, 
           bonusGem: Gem.values[i % 5], 
           cost: _generatePatternCost(pattern, Gem.values[i % 5])
        );
     });
  }
  
  static List<SplendorCard> _generateTier2Cards() {
     return List.generate(30, (i) {
        final r = Random(i + 100);
        // Tier 2: 1-3 pts
        // 1 Pt: cost ~ 6 (e.g. 3,2,2 or 3,3)
        // 2 Pts: cost ~ 7-8 (e.g. 5,3 or 5)
        // 3 Pts: cost ~ 8-9 (e.g. 6)
        
        final points = 1 + (i % 3);
        List<int> pattern;
        
        if (points == 1) {
           pattern = r.nextBool() ? [3, 2, 2] : [2, 3, 3]; // Sum 7-8
        } else if (points == 2) {
           pattern = r.nextBool() ? [5] : [4, 2]; // Sum 5-6
        } else {
           pattern = [6]; // Sum 6 (single color)
        }

        return SplendorCard(
           id: 't2_$i', tier: 2, 
           points: points, 
           bonusGem: Gem.values[i % 5], 
           cost: _generatePatternCost(pattern, Gem.values[i % 5])
        );
     });
  }
  
  static List<SplendorCard> _generateTier3Cards() {
     return List.generate(20, (i) {
        final r = Random(i + 200);
        // Tier 3: 3-5 pts
        // 3 Pts: Cost [3,3,3,5] (Total 14 - classic expensive)
        // 4 Pts: Cost [7] (Classic) or [3,6,3]
        // 5 Pts: Cost [7,3] (Classic)
        
        final points = 3 + (i % 3);
        List<int> pattern;
        
        if (points == 3) {
            pattern = [3, 3, 3, 5];
        } else if (points == 4) {
            pattern = r.nextBool() ? [7] : [3, 6, 3]; 
        } else { // 5 pts
            pattern = [7, 3];
        }
        
        return SplendorCard(
           id: 't3_$i', tier: 3, 
           points: points, 
           bonusGem: Gem.values[i % 5], 
           cost: _generatePatternCost(pattern, Gem.values[i % 5])
        );
     });
  }
  
  static Map<Gem, int> _generatePatternCost(List<int> pattern, Gem avoid) {
      final r = Random();
      final cost = <Gem, int>{};
      
      // Available gems (excluding gold, excluding bonus maybe?)
      // Actually standard rules don't strictly ban bonus color in cost, but it's rare for T1.
      List<Gem> types = Gem.values.where((g) => g != Gem.gold).toList()..shuffle(r);
      
      for (int i = 0; i < pattern.length; i++) {
         if (i < types.length) {
            cost[types[i]] = pattern[i];
         }
      }
      return cost;
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
}
