import '../../models/game/game_state.dart';

abstract class BotBase {
  final String id;
  
  BotBase(this.id);

  /// Calculates the next move.
  /// Returns an Action Map compatible with ActionValidator.
  Future<Map<String, dynamic>> computeNextMove(GameState state);
}
