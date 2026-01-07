import 'dart:math';
import 'bot_base.dart';
import '../../models/game/game_state.dart';
import '../utils/move_generator.dart';
import '../evaluation/standard_board_evaluator.dart';
import '../../logic/engine/splendor_game_engine.dart';
import '../../logic/strategies/win_strategy.dart';
import '../../models/game/card.dart';
import '../../models/game/gem.dart';

// CONTEXT:
// Class: HardBot
// Libraries: splendor_shared (BotBase, GameState, etc.)
// Strategy: 2-Ply Alpha-Beta Pruning with StandardBoardEvaluator.
// Note: Depth 2 is chosen for performance in Dart (simulating immutable state is heavy).
class HardBot extends BotBase {
  final _evaluator = StandardBoardEvaluator();
  final int _maxDepth = 2; // Lookahead depth

  HardBot(String id) : super(id);

  @override
  Future<Map<String, dynamic>> computeNextMove(GameState state) async {
    // Top-level Maximize
    List<Map<String, dynamic>> moves = MoveGenerator.generateAllMoves(state, id);
    if (moves.isEmpty) return {'type': 'pass', 'playerId': id};

    double bestScore = double.negativeInfinity;
    Map<String, dynamic>? bestMove;
    
    // Sort moves to improve pruning? (Expensive for top level, maybe just random shuffle to avoid bias)
    moves.shuffle();

    for (var move in moves) {
       final score = await _alphaBeta(state, move, _maxDepth - 1, double.negativeInfinity, double.infinity, false);
       if (score > bestScore) {
          bestScore = score;
          bestMove = move;
       }
    }

    return bestMove ?? moves.first;
  }

  // Recursive Alpha-Beta
  // isMaximizing: true if it's THIS bot's turn, false if opponent's turn.
  // We assume 2-player game for simplicity in 'maximizing' toggle. 
  // For >2 players, it's Paranoid (Max vs All Min) or MaxN. 
  // Given Splendor allows multiple players, let's assume "Paranoid" (Assume next player minimizes MY score).
  Future<double> _alphaBeta(GameState parentState, Map<String, dynamic> moveToAction, int depth, double alpha, double beta, bool isMe) async {
    // 1. Simulate Move
    GameState? nextState;
    try {
       // Mock Engine for simulation
       final simEngine = SplendorGameEngine(initialState: parentState, winStrategy: PointsWinStrategy(targetPoints: 99)); // Avoid early win trigger check overhead?
       
       final simMove = _prepareSimMove(moveToAction, moveToAction); // Handle stochastic mocking
       simEngine.applyAction(simMove);
       nextState = simEngine.currentState;
    } catch (e) {
       // Invalid move in simulation (shouldn't happen if generator is correct)
       return isMe ? double.negativeInfinity : double.infinity;
    }

    // 2. Leaf Node Check
    if (depth == 0 || nextState.status == GameStatus.finished) {
       return _evaluator.evaluate(nextState, id);
    }

    // 3. Recursive Step
    // Who is the next player?
    final nextPlayerIndex = nextState.turnIndex;
    final nextPlayerId = nextState.players[nextPlayerIndex].uuid;
    final isNextMe = (nextPlayerId == id); // If next is me (e.g. somehow extra turn?), Maximize. Else Minimize.
    
    // Generate moves for next player
    final nextMoves = MoveGenerator.generateAllMoves(nextState, nextPlayerId);
    if (nextMoves.isEmpty) {
       // End of game/Pass? Evaluate
       return _evaluator.evaluate(nextState, id);
    }

    if (isNextMe) {
       // Maximize
       double value = double.negativeInfinity;
       for (var nextMove in nextMoves) {
          final score = await _alphaBeta(nextState, nextMove, depth - 1, alpha, beta, true);
          value = max(value, score);
          alpha = max(alpha, value);
          if (alpha >= beta) break; // Pruning
       }
       return value;
    } else {
       // Minimize (Opponent plays best to hurt me / best for themselves)
       // Standard Minimax assumes Zero-Sum. Splendor is NOT Zero-Sum.
       // But "Paranoid" assumes they perform action that Minimize MY score relative to theirs?
       // Or simpler: Next player maximizes THEIR score.
       // If we assume they act rationally for themselves, we subtract their score from ours?
       // Let's stick to simple Paranoid: Assume they make a move that results in lowest evaluation for ME.
       double value = double.infinity;
       for (var nextMove in nextMoves) {
          final score = await _alphaBeta(nextState, nextMove, depth - 1, alpha, beta, false);
          value = min(value, score);
          beta = min(beta, value);
          if (beta <= alpha) break;
       }
       return value;
    }
  }

  Map<String, dynamic> _prepareSimMove(Map<String, dynamic> original, Map<String, dynamic> action) {
     final sim = Map<String, dynamic>.from(action);
     if (sim['type'] == 'reserve_deck') {
        sim['drawnCard'] = SplendorCard(id: 'sim_dummy', tier: sim['tier'], points: 0, bonusGem: Gem.white, cost: {}).toJson();
     }
     if (sim['type'] == 'buy_card' || sim['type'] == 'reserve_card') {
        // Replacement card needed? Engine doesn't crash if missing, just doesn't refill.
        // For accurate sim, maybe ignore?
     }
     return sim;
  }
}
