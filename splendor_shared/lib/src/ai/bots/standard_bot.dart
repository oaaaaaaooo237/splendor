import 'bot_base.dart';
import '../../models/game/game_state.dart';
import '../utils/move_generator.dart';
import '../evaluation/standard_board_evaluator.dart';
import '../../logic/engine/splendor_game_engine.dart';
import '../../logic/strategies/win_strategy.dart'; // Needed for engine init
import '../../models/game/card.dart'; // For payload construction
import '../../models/game/gem.dart'; // For mock card creation

class StandardBot extends BotBase {
  final _evaluator = StandardBoardEvaluator();

  StandardBot(String id) : super(id);

  @override
  Future<Map<String, dynamic>> computeNextMove(GameState state) async {
    List<Map<String, dynamic>> moves = MoveGenerator.generateAllMoves(state, id);
    if (moves.isEmpty) return {'type': 'pass', 'playerId': id}; 

    // Heuristics: 1-ply search with simulation
    Map<String, dynamic>? bestMove;
    double bestScore = double.negativeInfinity;

    for (var move in moves) {
       // Simulate Move
       // We create a fresh engine with the CURRENT state.
       // Note: To be perfectly safe, we should assume state is immutable.
       // However, the engine might mutate lists inside the PlayerState if they are not deeply copied.
       // Given Dart's `freezed` usually does shallow copies for lists, and our Engine implementation
       // creates NEW lists (e.g. `[...oldList, newItem]`), it *should* be safe to reuse the `state` 
       // structure as long as we don't modify the input lists directly.
       // Our `_executeAction` uses `copyWith` and spread operator `[...list]`, so it shouldn't mutate `state`.
       
       final simEngine = SplendorGameEngine(
         initialState: state,
         winStrategy: PointsWinStrategy(targetPoints: 15), // Target doesn't matter for 1-ply eval usually
       );
       
       // Pre-processing move payload if needed?
       // Engine expects 'replacementCard' / 'drawnCard' in action for non-deterministic moves.
       // But for EVALUATION, we don't know the card yet.
       // This is the problem with simulating hidden information.
       // 
       // Solution for Bot Simulation:
       // 1. For deterministic moves (Buy, take gems): Valid.
       // 2. For stochastic moves (Reserve deck, Buy card causing replacement):
       //    We can't know the replacement. The AI should evaluate the state *ignoring* the unknown replacement,
       //    or assume an average value?
       //    Current StandardBoardEvaluator evaluates *Player State*, not the board reload.
       //    So assuming no replacement is fine for evaluating *Player's* position.
       //    Except if we finish the game?
       
       // Clone move to avoid mutating original move object if we add mocked data
       final simMove = Map<String, dynamic>.from(move);
       
       // Mock required fields for engine to not crash
       if (simMove['type'] == 'buy_card' || simMove['type'] == 'reserve_card') {
          // If we need replacement, we mock it?? 
          // Engine checks `if (action['replacementCard'] != null)`.
          // If null, it just doesn't refill. That's fine for evaluation of *player*.
       } 
       if (simMove['type'] == 'reserve_deck') {
          // We need 'drawnCard'. AI doesn't know it.
          // AI evaluates the action of "Reserving a random card".
          // We can mock a "Average Card" or just give a dummy card to satisfy engine?
          // Or we can modify Evaluator to value "Blind Reserve" without simulating the exact card.
          // But our engine *requires* drawnCard to add to reserved list.
          // So we must provide a dummy.
          // Let's provide a dummy non-null card.
          simMove['drawnCard'] = SplendorCard(
            id: 'dummy', 
            tier: simMove['tier'], 
            points: 0, 
            bonusGem: Gem.white, 
            cost: {}
          ).toJson();
       }

       try {
         simEngine.applyAction(simMove);
         
         // Evaluate resulting state
         double score = _evaluator.evaluate(simEngine.currentState, id);
         
         if (score > bestScore) {
           bestScore = score;
           bestMove = move;
         }
       } catch (e) {
         print("Bot simulation error for move $move: $e");
         // Skip invalid move
       }
    }

    return bestMove ?? moves.last;
  }
}
