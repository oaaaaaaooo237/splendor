import 'dart:math';
import '../../models/game/game_state.dart';
import '../../models/game/card.dart';
import '../../models/game/noble.dart';
import '../../models/game/gem.dart';
import '../../models/identity/player_identity.dart';
import '../data/standard_deck_data.dart';


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
     
     // Decks (From Standard Deck Data)
     final allCards = StandardDeckData.allCards;
     final d1 = allCards.where((c) => c.tier == 1).toList()..shuffle(random);
     final d2 = allCards.where((c) => c.tier == 2).toList()..shuffle(random);
     final d3 = allCards.where((c) => c.tier == 3).toList()..shuffle(random);
     
     // Nobles (N+1 from Standard List)
     final allNobles = List<Noble>.from(StandardDeckData.nobles)..shuffle(random);
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



}
