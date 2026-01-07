import 'bots/bot_base.dart';
import 'bots/easy_bot.dart'; 
import 'bots/standard_bot.dart'; 
import 'bots/hard_bot.dart'; 

enum BotDifficulty { easy, standard, hard }

class BotFactory {
  static BotBase createBot(BotDifficulty difficulty, String id) {
    switch (difficulty) {
      case BotDifficulty.easy: return EasyBot(id);
      case BotDifficulty.standard: return StandardBot(id);
      case BotDifficulty.hard: return HardBot(id);
    }
  }
}
