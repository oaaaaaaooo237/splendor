import '../../models/game/game_state.dart';

abstract class WinStrategy {
  bool isWinner(GameState state, PlayerState player);
}

class PointsWinStrategy implements WinStrategy {
  final int targetPoints;
  PointsWinStrategy({this.targetPoints = 15});
  
  @override
  bool isWinner(GameState state, PlayerState player) {
    return player.score >= targetPoints;
  }
}

class RoundsWinStrategy implements WinStrategy {
  final int maxRounds;
  RoundsWinStrategy({this.maxRounds = 30});
  
  @override
  bool isWinner(GameState state, PlayerState player) {
    // Determine winner at end of round (turnIndex = 0 usually, or tracked specifically)
    // Here we just check if current round >= max.
    // Assuming turnIndex handles rounds... actually we might need 'round' field in State.
    // For now, simple check:
    return false; // Placeholder
  }
}

class TimeWinStrategy implements WinStrategy {
  final Duration maxDuration;
  final DateTime startTime;
  TimeWinStrategy(this.maxDuration) : startTime = DateTime.now();
  
  @override
  bool isWinner(GameState state, PlayerState player) {
    if (DateTime.now().difference(startTime) > maxDuration) {
       // Time up, whoever has highest score wins
       return true;
    }
    return false;
  }
}
