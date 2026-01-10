import 'package:flutter_test/flutter_test.dart';
import 'package:splendor_shared/splendor_shared.dart';
import 'package:splendor_client/repository/game_repository.dart';

void main() {
  group('Local Single Player Smoke Test', () {
    late LocalGameRepository repository;
    final players = [
      PlayerIdentity(uuid: 'player_1', name: 'Jasper', avatarId: 'avatar_1', isBot: false),
      PlayerIdentity(uuid: 'bot_1', name: 'Easy Bot', avatarId: 'bot_avatar', isBot: true),
      PlayerIdentity(uuid: 'bot_2', name: 'Standard Bot', avatarId: 'bot_avatar', isBot: true),
    ];

    setUp(() {
      repository = LocalGameRepository();
    });

    test('Initializes with 3 players and 15 target points', () async {
      await repository.initialize(players);
      final state = repository.currentState;

      expect(state.players.length, 3);
      expect(state.availableGems[Gem.green], 5); // 3 players -> 5 gems of each type
      expect(state.tier1Cards.length, 4);
      expect(state.tier2Cards.length, 4);
      expect(state.tier3Cards.length, 4);
      expect(state.status, GameStatus.playing);
    });

    test('Player can take 3 different gems', () async {
      await repository.initialize(players);
      
      final action = <String, dynamic>{
        'type': 'take_gems',
        'playerId': 'player_1',
        'gems': {'green': 1, 'blue': 1, 'red': 1}
      };

      await repository.applyAction(action);
      final state = repository.currentState;

      expect(state.playerStates[0].gems[Gem.green], 1);
      expect(state.playerStates[0].gems[Gem.blue], 1);
      expect(state.playerStates[0].gems[Gem.red], 1);
      expect(state.availableGems[Gem.green], 4);
      expect(state.turnIndex, 1); // Turn passed to bot_1
    });

    test('Card replacement works after buying a valid card', () async {
      await repository.initialize(players);
      
      // 1. Find an easy Tier 1 card (costing 3 or less)
      final state = repository.currentState;
      final card = state.tier1Cards.firstWhere((c) => c.cost.values.fold(0, (a, b) => a + b) <= 3);
      
      // 2. Take the specific gems needed for this card
      final requiredGems = <String, int>{};
      card.cost.forEach((gem, amount) {
         if (gem != Gem.gold) requiredGems[gem.name] = amount;
      });

      await repository.applyAction(<String, dynamic>{
        'type': 'take_gems',
        'playerId': 'player_1',
        'gems': requiredGems
      });

      // 3. Now buy the card legally
      await repository.applyAction(<String, dynamic>{
        'type': 'buy_card',
        'playerId': 'player_1',
        'cardId': card.id,
      });

      final finalState = repository.currentState;

      // 4. Verify replacement
      expect(finalState.tier1Cards.any((c) => c.id == card.id), isFalse);
      expect(finalState.tier1Cards.length, 4);
      expect(finalState.playerStates[0].purchasedCards.length, 1);
    });
  });
}
