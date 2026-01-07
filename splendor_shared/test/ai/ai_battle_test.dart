import 'package:test/test.dart';
import 'package:splendor_shared/splendor_shared.dart';
import 'package:splendor_shared/src/logic/engine/splendor_game_engine.dart';
import 'package:splendor_shared/src/logic/utils/game_setup_helper.dart';
import 'package:splendor_shared/src/ai/bot_factory.dart';
import 'package:splendor_shared/src/ai/bots/bot_base.dart';
import 'package:splendor_shared/src/logic/strategies/win_strategy.dart';

void main() {
  group('AI Battle Simulation', () {
    test('StandardBot vs StandardBot finishes a game without crashing', () async {
      // 1. Setup
      final player1 = PlayerIdentity(uuid: 'bot1', name: 'Bot 1', avatarId: 'robot');
      final player2 = PlayerIdentity(uuid: 'bot2', name: 'Bot 2', avatarId: 'robot');
      
      final setup = GameSetupHelper.setupGame([player1, player2]);
      
      final engine = SplendorGameEngine(
        initialState: setup.initialState, 
        winStrategy: PointsWinStrategy(targetPoints: 15)
      );
      
      final bot1 = BotFactory.createBot(BotDifficulty.standard, 'bot1');
      final bot2 = BotFactory.createBot(BotDifficulty.standard, 'bot2');
      final bots = {'bot1': bot1, 'bot2': bot2};

      int turnCount = 0;
      const maxTurns = 200; // Prevent infinite loops

      // 2. Game Loop
      while (engine.currentState.status != GameStatus.finished && turnCount < maxTurns) {
        final currentPlayerId = engine.currentState.playerStates[engine.currentState.turnIndex].playerId;
        final currentBot = bots[currentPlayerId]!;
        
        print("Turn $turnCount: Player $currentPlayerId thinking...");
        
        try {
          // Compute Move
          var move = await currentBot.computeNextMove(engine.currentState);
          print("  Move: ${move['type']}");
          
          // Inject Mock Data for Stochastic Actions (Test Environment Logic)
          if (move['type'] == 'reserve_deck') {
             // Create a mutable copy
             move = Map<String, dynamic>.from(move);
             move['drawnCard'] = SplendorCard(
               id: 'mock_${turnCount}', 
               tier: move['tier'], 
               points: 0, 
               bonusGem: Gem.white, 
               cost: {}
             ).toJson();
          }
          
          // Apply Move
          engine.applyAction(move);
        } catch (e, stack) {
          fail("Crash on turn $turnCount for $currentPlayerId: $e\n$stack");
        }
        
        turnCount++;
      }

      // 3. Results
      print("Game Finished in $turnCount turns.");
      print("Status: ${engine.currentState.status}");
      for (var p in engine.currentState.playerStates) {
        print("Player ${p.playerId}: ${p.score} points, ${p.purchasedCards.length} cards, ${p.nobles.length} nobles");
      }

      expect(turnCount, lessThan(maxTurns), reason: "Game should finish within reasonable turns (or bots are stuck looping)");
      // Note: Random bots might not finish in 200 turns, but StandardBots should make progress.
      // If they suck, we might timeout. But checking for NO CRASH is the main goal here.
    });

    test('HardBot vs StandardBot finishes a game', () async {
      // 1. Setup
      final player1 = PlayerIdentity(uuid: 'hard', name: 'Hard Bot', avatarId: 'robot_hard');
      final player2 = PlayerIdentity(uuid: 'std', name: 'Std Bot', avatarId: 'robot_std');
      
      final setup = GameSetupHelper.setupGame([player1, player2]);
      
      final engine = SplendorGameEngine(
        initialState: setup.initialState, 
        winStrategy: PointsWinStrategy(targetPoints: 15)
      );
      
      final bot1 = BotFactory.createBot(BotDifficulty.hard, 'hard');
      final bot2 = BotFactory.createBot(BotDifficulty.standard, 'std');
      final bots = {'hard': bot1, 'std': bot2};

      int turnCount = 0;
      const maxTurns = 200;

      // 2. Game Loop
      while (engine.currentState.status != GameStatus.finished && turnCount < maxTurns) {
        final currentPlayerId = engine.currentState.playerStates[engine.currentState.turnIndex].playerId;
        final currentBot = bots[currentPlayerId]!;
        
        try {
          var move = await currentBot.computeNextMove(engine.currentState);
          
          if (move['type'] == 'reserve_deck') {
             move = Map<String, dynamic>.from(move);
             move['drawnCard'] = SplendorCard(
               id: 'mock_${turnCount}', 
               tier: move['tier'], 
               points: 0, 
               bonusGem: Gem.white, 
               cost: {}
             ).toJson();
          }
          
          engine.applyAction(move);
        } catch (e, stack) {
          fail("Crash on turn $turnCount for $currentPlayerId: $e\n$stack");
        }
        
        turnCount++;
      }

      print("HardBot Match Finished in $turnCount turns.");
      print("Status: ${engine.currentState.status}");
      for (var p in engine.currentState.playerStates) {
        print("Player ${p.playerId}: ${p.score} points");
      }
      expect(turnCount, lessThan(maxTurns));
    });
  });
}
