import 'board_evaluator.dart';
import '../../models/game/game_state.dart';


class StandardBoardEvaluator implements BoardEvaluator {
  @override
  double evaluate(GameState state, String playerId) {
    // Locate the player
    final playerState = state.playerStates.firstWhere(
        (p) => p.playerId == playerId,
        orElse: () => throw Exception("Player not found"));

    double score = 0.0;

    // 1. Victory Points (Most important)
    // Weight: 100 per point.
    // Winning is usually 15 points. 1500 score.
    score += playerState.score * 100.0;

    // 2. Nobles (Strategic capability & points)
    // Already counted in score? Usually yes, nobles add to score.
    // But we might want to incentivize getting CLOSER to a noble?
    // Current noble possession is in score.
    // Let's add a small bonus for having them just in case logic separates them, 
    // or to value them slightly higher than raw card points if they break ties?
    // Checking proximity to nobles would be better but expensive.
    // For now, just raw points dominate.

    // 3. Card Production (Engine building)
    // Weight: 10 per permanent gem bonus.
    // Allows buying bigger cards.
    int production = playerState.purchasedCards.length; 
    // Or better: sum of bonuses?
    // Using length is a proxy.
    score += production * 10.0;

    // 4. Gems (Resources)
    // Weight: 1 per gem.
    // Having gems is good, but spending them for points is better.
    int gemCount = playerState.gems.values.fold(0, (sum, count) => sum + count);
    score += gemCount * 1.0;
    
    // 5. Reserved Cards
    // Having reserved cards is potential, but unprocessed liability if not bought.
    // Slight penalty? Or slight bonus if achievable?
    // Let's give slight bonus for "Potential"
    score += playerState.reservedCards.length * 2.0;

    return score;
  }
}
