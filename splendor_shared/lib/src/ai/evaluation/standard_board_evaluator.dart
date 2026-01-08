import 'board_evaluator.dart';
import '../../models/game/game_state.dart';
import '../../models/game/noble.dart';


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
    score += playerState.score * 100.0;

    // 2. Nobles (Proximity Scoring)
    // Value getting closer to a 3-point noble.
    score += _evaluateNobleProximity(playerState, state.nobles);

    // 3. Card Production (Engine building)
    // Weight: 10 per permanent gem bonus.
    int production = playerState.bonuses.values.fold(0, (sum, count) => sum + count);
    score += production * 10.0;

    // 4. Gems (Resources)
    // Weight: 1 per gem.
    int gemCount = playerState.gems.values.fold(0, (sum, count) => sum + count);
    score += gemCount * 1.0;
    
    // 5. Reserved Cards
    // Slight bonus for "Potential"
    score += playerState.reservedCards.length * 2.0;

    return score;
  }

  /// Calculates a bonus score based on how close the player is to achieving nobles.
  double _evaluateNobleProximity(PlayerState player, List<Noble> availableNobles) {
    double proximityScore = 0.0;
    
    for (var noble in availableNobles) {
      // Skip if player already has this noble
      if (player.nobles.any((n) => n.id == noble.id)) continue;
      
      int totalGap = 0;
      for (var req in noble.requirements.entries) {
        final bonusCount = player.bonuses[req.key] ?? 0;
        final gap = req.value - bonusCount;
        if (gap > 0) totalGap += gap;
      }
      
      // Proximity bonuses:
      // If 1 card away: +40 points (Strongly prefer finishing a noble)
      // If 2 cards away: +15 points (Moderate strategic alignment)
      if (totalGap == 1) {
        proximityScore += 40.0;
      } else if (totalGap == 2) {
        proximityScore += 15.0;
      }
    }
    
    return proximityScore;
  }
}
