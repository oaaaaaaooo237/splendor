import '../../models/game/game_state.dart';

abstract class BoardEvaluator {
  /// Returns a score for the given board state from the perspective of playerId.
  /// Higher is better.
  double evaluate(GameState state, String playerId);
}
