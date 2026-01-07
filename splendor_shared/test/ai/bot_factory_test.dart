import 'package:test/test.dart';
import 'package:splendor_shared/splendor_shared.dart';
import 'package:splendor_shared/src/ai/bots/easy_bot.dart';
import 'package:splendor_shared/src/ai/bots/standard_bot.dart';
import 'package:splendor_shared/src/ai/bots/hard_bot.dart';

void main() {
  group('BotFactory Tests', () {
    test('Creates EasyBot', () {
      final bot = BotFactory.createBot(BotDifficulty.easy, 'b1');
      expect(bot, isA<EasyBot>());
      expect(bot.id, equals('b1'));
    });

    test('Creates StandardBot', () {
      final bot = BotFactory.createBot(BotDifficulty.standard, 'b2');
      expect(bot, isA<StandardBot>());
    });

    test('Creates HardBot', () {
      final bot = BotFactory.createBot(BotDifficulty.hard, 'b3');
      expect(bot, isA<HardBot>());
    });
  });
}
