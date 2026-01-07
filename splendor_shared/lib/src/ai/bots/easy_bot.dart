import 'dart:math';
import 'bot_base.dart';
import '../../models/game/game_state.dart';

import '../utils/move_generator.dart';

class EasyBot extends BotBase {
  EasyBot(String id) : super(id);

  @override
  Future<Map<String, dynamic>> computeNextMove(GameState state) async {
    // 1. Generate all possible moves
    List<Map<String, dynamic>> moves = MoveGenerator.generateAllMoves(state, id);
    
    if (moves.isEmpty) {
      // Pass if no legal moves (rare, usually take gems is possible unless locked)
      // Or server logic handles pass.
      return {'type': 'pass', 'playerId': id}; 
    }
    
    // 2. Randomly pick one
    final random = Random();
    return moves[random.nextInt(moves.length)];
  }
}
