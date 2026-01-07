import '../../models/game/game_state.dart';

abstract class GameEngine {
  GameState get currentState;
  
  void applyAction(Map<String, dynamic> action);
  bool checkWinCondition();
  void resolveTimeout();
}
