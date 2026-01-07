import '../../models/game/game_state.dart';
import '../../models/game/gem.dart';
import '../../models/game/card.dart';

class ActionValidator {
  
  /// Validates if an action is legal given the current game state.
  static String? validate(GameState state, Map<String, dynamic> action) {
    if (state.status != GameStatus.playing) return "Game is not playing";
    
    // Check Turn
    final currentPlayerIndex = state.turnIndex;
    final currentPlayer = state.playerStates[currentPlayerIndex];
    if (action['playerId'] != currentPlayer.playerId) return "Not your turn";

    final type = action['type'];
    
    // 1. Buy Card (Board)
    if (type == 'buy_card') {
       final cardId = action['cardId'];
       SplendorCard? card;
       // Find card
       if (state.tier1Cards.any((c) => c.id == cardId)) card = state.tier1Cards.firstWhere((c) => c.id == cardId);
       else if (state.tier2Cards.any((c) => c.id == cardId)) card = state.tier2Cards.firstWhere((c) => c.id == cardId);
       else if (state.tier3Cards.any((c) => c.id == cardId)) card = state.tier3Cards.firstWhere((c) => c.id == cardId);
       
       if (card == null) return "Card not found on board";
       
       if (!_canAfford(currentPlayer, card)) return "Cannot afford card";
       return null;
    }
    
    // 2. Buy Reserved
    if (type == 'buy_reserved') {
       final cardId = action['cardId'];
       if (!currentPlayer.reservedCards.any((c) => c.id == cardId)) return "Card not in reserved hand";
       final card = currentPlayer.reservedCards.firstWhere((c) => c.id == cardId);
       
       if (!_canAfford(currentPlayer, card)) return "Cannot afford card";
       return null;
    }
    
    // 3. Reserve (Card/Deck)
    if (type == 'reserve_card' || type == 'reserve_deck') {
       if (currentPlayer.reservedCards.length >= 3) return "Maximum 3 reserved cards allowed";
       if (type == 'reserve_card') {
          // Check if card exists
          final cardId = action['cardId'];
          bool exists = state.tier1Cards.any((c) => c.id == cardId) ||
                        state.tier2Cards.any((c) => c.id == cardId) ||
                        state.tier3Cards.any((c) => c.id == cardId);
          if (!exists) return "Card to reserve not available";
       }
       if (type == 'reserve_deck') {
          final tier = action['tier'] as int;
          if (tier == 1 && state.tier1DeckCount <= 0) return "Tier 1 deck empty";
          if (tier == 2 && state.tier2DeckCount <= 0) return "Tier 2 deck empty";
          if (tier == 3 && state.tier3DeckCount <= 0) return "Tier 3 deck empty";
       }
       return null;
    }
    
    // 4. Take Gems
    if (type == 'take_gems') {
       final gems = action['gems'] as Map<String, dynamic>;
       int totalTaking = 0;
       gems.forEach((k, v) => totalTaking += (v as int));
       
       // Max total gems after taking? (Standard rule: Max 10)
       int currentTotal = 0;
       currentPlayer.gems.forEach((k, v) => currentTotal += v);
       if (currentTotal + totalTaking > 10) return "Cannot hold more than 10 tokens";
       
       // Check validity of take
       // Case A: 2 of same color
       if (gems.length == 1 && gems.values.first == 2) {
          final gemName = gems.keys.first;
          final gem = Gem.values.firstWhere((g) => g.name == gemName);
          if (gem == Gem.gold) return "Cannot take 2 gold";
          if ((state.availableGems[gem] ?? 0) < 4) return "Not enough gems to take 2 (Need 4)";
          return null;
       }
       
       // Case B: 3 distinct
       if (gems.length <= 3) {
          // Check distinct and count=1
          for (var entry in gems.entries) {
             if (entry.value != 1) return "Invalid gem combination";
             final gem = Gem.values.firstWhere((g) => g.name == entry.key);
             if (gem == Gem.gold) return "Cannot take gold directly";
             if ((state.availableGems[gem] ?? 0) < 1) return "Gem ${gem.name} not available";
          }
          return null;
       }
       
       return "Invalid move";
    }

    return null; // Unknown action pass? Or strict? strict preferred
  }
  
  static bool _canAfford(PlayerState player, SplendorCard card) {
     int goldNeeded = 0;
     for (var entry in card.cost.entries) {
        final gem = entry.key;
        final cost = entry.value;
        final bonus = player.bonuses[gem] ?? 0;
        final available = player.gems[gem] ?? 0;
        
        final needed = cost - bonus;
        if (needed > 0) {
           if (available >= needed) {
              // enough gems
           } else {
              // need gold
              goldNeeded += (needed - available);
           }
        }
     }
     final playerGold = player.gems[Gem.gold] ?? 0;
     return playerGold >= goldNeeded;
  }
}
