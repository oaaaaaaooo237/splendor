import 'package:test/test.dart';
import 'package:splendor_shared/splendor_shared.dart';
import 'package:splendor_shared/src/logic/engine/splendor_game_engine.dart';
import 'package:splendor_shared/src/logic/utils/game_setup_helper.dart';
import 'package:splendor_shared/src/ai/bot_factory.dart';
import 'package:splendor_shared/src/logic/strategies/win_strategy.dart';

// CONTEXT:
// Test: FullGameLoopTest (Human vs Bot Simulation)
// Libraries: test, splendor_shared
// Purpose: Verify the "Client Logic" (Deck Management + Refill) works with Engine + Bot over a full game.
void main() {
  group('Full Game Loop (Client Logic Simulation)', () {
    test('Human vs StandardBot should play to completion or 100 turns', () async {
      // 1. Setup (Mimic GamePage.initState)
      final p1 = const PlayerIdentity(uuid: 'human', name: 'Human', avatarId: 'a1');
      final p2 = const PlayerIdentity(uuid: 'bot', name: 'StandardBot', avatarId: 'a2', isBot: true);
      
      final setup = GameSetupHelper.setupGame([p1, p2]);
      
      // Client-side Deck State
      final deck1 = setup.deck1;
      final deck2 = setup.deck2;
      final deck3 = setup.deck3;

      final engine = SplendorGameEngine(
        initialState: setup.initialState,
        winStrategy: PointsWinStrategy(targetPoints: 15),
      );
      
      final bot = BotFactory.createBot(BotDifficulty.standard, 'bot');

      // Helper to draw replacement (Mimic GamePage._drawReplacement)
      SplendorCard? drawReplacement(int tier) {
         if (tier == 1 && deck1.isNotEmpty) return deck1.removeLast();
         if (tier == 2 && deck2.isNotEmpty) return deck2.removeLast();
         if (tier == 3 && deck3.isNotEmpty) return deck3.removeLast();
         return null;
      }
      
      // Helper to augment action with replacement (Mimic GamePage logic)
      void augmentAction(Map<String, dynamic> action) {
         if (action['type'] == 'buy_card' || action['type'] == 'reserve_card') {
           final cardId = action['cardId'];
           int tier = 1;
           final state = engine.currentState;
           if (state.tier1Cards.any((c) => c.id == cardId)) tier = 1;
           else if (state.tier2Cards.any((c) => c.id == cardId)) tier = 2;
           else if (state.tier3Cards.any((c) => c.id == cardId)) tier = 3;
           
           final replacement = drawReplacement(tier);
           if (replacement != null) {
              action['replacementCard'] = replacement.toJson();
           }
         } else if (action['type'] == 'reserve_deck') {
           final tier = action['tier'] as int;
           final drawn = drawReplacement(tier);
           if (drawn != null) {
              action['drawnCard'] = drawn.toJson();
           }
         }
      }

      final int initialDeckCount = deck1.length + deck2.length + deck3.length;

      int turn = 0;
      while (engine.currentState.status != GameStatus.finished && turn < 200) {
        // ... loop logic ...
        // (No changes needed in loop)
        final currentPlayerId = engine.currentState.players[engine.currentState.turnIndex].uuid;
        
        Map<String, dynamic> action;
        
        if (currentPlayerId == 'human') {
          // Simulate Human Move (Simple Greedy)
          final humanBot = BotFactory.createBot(BotDifficulty.standard, 'human');
          action = await humanBot.computeNextMove(engine.currentState);
        } else {
          // Bot Move
          action = await bot.computeNextMove(engine.currentState);
        }
        
        // --- CLIENT LOGIC LAYER START ---
        final actionCopy = Map<String, dynamic>.from(action);
        augmentAction(actionCopy);
        // --- CLIENT LOGIC LAYER END ---
        
        // Check for buy_reserved conversion (GamePage logic)
        final state = engine.currentState;
        final playerState = state.playerStates.firstWhere((p) => p.playerId == currentPlayerId);
        if (actionCopy['type'] == 'buy_card') {
           if (playerState.reservedCards.any((c) => c.id == actionCopy['cardId'])) {
             actionCopy['type'] = 'buy_reserved';
             actionCopy.remove('replacementCard'); // Not needed for buy_reserved
           }
        }

        try {
          engine.applyAction(actionCopy);
        } catch (e) {
          fail("Turn $turn: Invalid move by $currentPlayerId: $e\nAction: $actionCopy");
        }
        
        turn++;
      }
      
      // Verify Game Progressed
      print("Game Ended at Turn: $turn");
      print("Status: ${engine.currentState.status}");
      for (var p in engine.currentState.playerStates) {
         print("Player ${p.playerId} Score: ${p.score}");
      }
      
      expect(turn, greaterThan(3));
      print("Game finished in $turn turns. Winner: ${engine.currentState.status == GameStatus.finished ? 'Yes' : 'Timeout'}");
      
      // Verify Decks Depleted somewhat
      expect(deck1.length + deck2.length + deck3.length, lessThan(initialDeckCount));
    });
  });
}
