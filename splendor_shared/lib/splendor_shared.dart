/// Support for doing something awesome.
///
/// More dartdocs go here.
library splendor_shared;

export 'src/splendor_shared_base.dart';

// Models
export 'src/models/identity/player_identity.dart';
export 'src/models/game/gem.dart';
export 'src/models/game/card.dart';
export 'src/models/game/noble.dart';
export 'src/models/game/game_state.dart';
export 'src/models/lobby/room_info.dart';

// Protocol
export 'src/protocol/messages.dart';

// Logic
export 'src/logic/validators/action_validator.dart';
export 'src/logic/validators/name_validator.dart';
export 'src/logic/engine/game_engine.dart';
export 'src/logic/engine/splendor_game_engine.dart';
export 'src/logic/strategies/win_strategy.dart';
export 'src/logic/utils/bot_name_generator.dart';
export 'src/logic/utils/game_setup_helper.dart';
export 'src/ai/utils/move_generator.dart';


// AI
export 'src/ai/evaluation/board_evaluator.dart';
export 'src/ai/evaluation/standard_board_evaluator.dart';

export 'src/ai/bots/bot_base.dart';
export 'src/ai/bot_factory.dart';
