import '../engine/game_engine.dart';
import '../../models/game/game_state.dart';
import '../../models/game/gem.dart';
import '../../models/game/card.dart';
import '../../models/game/noble.dart';
import '../validators/action_validator.dart';
import '../strategies/win_strategy.dart';
// import 'package:uuid/uuid.dart';

class SplendorGameEngine implements GameEngine {
  GameState _state;
  final WinStrategy winStrategy;
  
  SplendorGameEngine({
    required GameState initialState,
    required this.winStrategy,
  }) : _state = initialState;

  @override
  GameState get currentState => _state;

  @override
  void applyAction(Map<String, dynamic> action) {
    final type = action['type'];
    
    // 1. Draft Handling
    if (type == 'draft') {
       // Validate inner action
       final innerAction = action['action'] as Map<String, dynamic>;
       final error = ActionValidator.validate(_state, innerAction);
       
       if (error == null) {
         // Valid Draft
         _state = _state.copyWith(
           draftAction: innerAction, 
           isDraftValid: true
         );
       } else {
         // Invalid Draft (still store it so UI shows error?)
         // Or reject? PRD says "草稿合法则自动提交", implies we know validity.
         _state = _state.copyWith(
           draftAction: innerAction,
           isDraftValid: false,
         );
       }
       return;
    }
    
    // 2. Undo
    if (type == 'undo') {
      _state = _state.copyWith(draftAction: null, isDraftValid: false);
      return;
    }

    // 3. Confirm / Commit
    if (type == 'confirm') {
      if (_state.draftAction != null && _state.isDraftValid) {
        _executeAction(_state.draftAction!);
        _state = _state.copyWith(draftAction: null, isDraftValid: false);
        _nextTurn();
      }
      return;
    }
    
    // Direct action (e.g. from Bot or Server override)
    _executeAction(action);
    _nextTurn();
  }
  
  void _executeAction(Map<String, dynamic> action) {
    final type = action['type'];
    final playerId = action['playerId'] as String;
    
    // Find Player
    final playerState = _state.playerStates.firstWhere(
      (p) => p.playerId == playerId,
      orElse: () => throw Exception("Player $playerId not found"),
    );

    PlayerState newPlayerState = playerState;
    GameState newGameState = _state;

    if (type == 'buy_card') {
        final cardId = action['cardId'];
        SplendorCard? card;
        List<SplendorCard>? sourceList;
        
        if (newGameState.tier1Cards.any((c) => c.id == cardId)) {
           sourceList = newGameState.tier1Cards; card = sourceList.firstWhere((c) => c.id == cardId);
        } else if (newGameState.tier2Cards.any((c) => c.id == cardId)) {
           sourceList = newGameState.tier2Cards; card = sourceList.firstWhere((c) => c.id == cardId);
        } else if (newGameState.tier3Cards.any((c) => c.id == cardId)) {
           sourceList = newGameState.tier3Cards; card = sourceList.firstWhere((c) => c.id == cardId);
        }
        
        if (card == null) throw Exception("Card $cardId not found on board");
        
        // Calculate Cost & Move Gems
        final paymentResult = _calculatePayment(newPlayerState, card);
        final newPlayerGems = Map<Gem, int>.from(newPlayerState.gems);
        final newAvailableGems = Map<Gem, int>.from(newGameState.availableGems);
        
        paymentResult.paidGems.forEach((gem, count) {
            newPlayerGems[gem] = (newPlayerGems[gem] ?? 0) - count;
            newAvailableGems[gem] = (newAvailableGems[gem] ?? 0) + count;
        });
        
        // Update Player Lists & Score
        final newPurchased = List<SplendorCard>.from(newPlayerState.purchasedCards)..add(card);
        final newBonuses = Map<Gem, int>.from(newPlayerState.bonuses);
        newBonuses[card.bonusGem] = (newBonuses[card.bonusGem] ?? 0) + 1;
        
        newPlayerState = newPlayerState.copyWith(
           gems: newPlayerGems,
           purchasedCards: newPurchased,
           bonuses: newBonuses,
           score: newPlayerState.score + card.points,
        );
        
        // Update Board & Refill (Atomic)
        List<SplendorCard> t1 = List.from(newGameState.tier1Cards);
        List<SplendorCard> t2 = List.from(newGameState.tier2Cards);
        List<SplendorCard> t3 = List.from(newGameState.tier3Cards);
        
        if (sourceList == newGameState.tier1Cards) t1.remove(card);
        else if (sourceList == newGameState.tier2Cards) t2.remove(card);
        else if (sourceList == newGameState.tier3Cards) t3.remove(card);

        if (action['replacementCard'] != null) {
           final replacement = _cardFromPayload(action['replacementCard']);
           if (replacement.tier == 1) t1.add(replacement);
           else if (replacement.tier == 2) t2.add(replacement);
           else if (replacement.tier == 3) t3.add(replacement);
        }
        
        newGameState = newGameState.copyWith(
           tier1Cards: t1, tier2Cards: t2, tier3Cards: t3,
           availableGems: newAvailableGems
        );
        newGameState = newGameState.copyWith(availableGems: newAvailableGems);

    } else if (type == 'buy_reserved') {
        final cardId = action['cardId'];
        final card = newPlayerState.reservedCards.firstWhere((c) => c.id == cardId, orElse: () => throw Exception("Card not reserved"));
        
        // 1. Pay Cost & Move Gems
        final paymentResult = _calculatePayment(newPlayerState, card);
        final newPlayerGems = Map<Gem, int>.from(newPlayerState.gems);
        final newAvailableGems = Map<Gem, int>.from(newGameState.availableGems);
        
        paymentResult.paidGems.forEach((gem, count) {
            newPlayerGems[gem] = (newPlayerGems[gem] ?? 0) - count;
            newAvailableGems[gem] = (newAvailableGems[gem] ?? 0) + count;
        });

        // 2. Update player hand & score
        final newReserved = List<SplendorCard>.from(newPlayerState.reservedCards)..removeWhere((c) => c.id == cardId);
        final newPurchased = List<SplendorCard>.from(newPlayerState.purchasedCards)..add(card);
        final newBonuses = Map<Gem, int>.from(newPlayerState.bonuses);
        newBonuses[card.bonusGem] = (newBonuses[card.bonusGem] ?? 0) + 1;

        newPlayerState = newPlayerState.copyWith(
           gems: newPlayerGems,
           reservedCards: newReserved,
           purchasedCards: newPurchased,
           bonuses: newBonuses,
           score: newPlayerState.score + card.points,
        );
        newGameState = newGameState.copyWith(availableGems: newAvailableGems);

    } else if (type == 'reserve_card') {
        final cardId = action['cardId'];
        SplendorCard? card;
        
        // Check Board
        List<SplendorCard>? sourceList;
        if (newGameState.tier1Cards.any((c) => c.id == cardId)) {
           sourceList = newGameState.tier1Cards; card = sourceList.firstWhere((c) => c.id == cardId);
        } else if (newGameState.tier2Cards.any((c) => c.id == cardId)) {
           sourceList = newGameState.tier2Cards; card = sourceList.firstWhere((c) => c.id == cardId);
        } else if (newGameState.tier3Cards.any((c) => c.id == cardId)) {
           sourceList = newGameState.tier3Cards; card = sourceList.firstWhere((c) => c.id == cardId);
        }
        
        if (card == null) throw Exception("Card $cardId to reserve not found");

        // Take Gold if available
        final newPlayerGems = Map<Gem, int>.from(newPlayerState.gems);
        final newAvailableGems = Map<Gem, int>.from(newGameState.availableGems);
        if ((newAvailableGems[Gem.gold] ?? 0) > 0) {
           newPlayerGems[Gem.gold] = (newPlayerGems[Gem.gold] ?? 0) + 1;
           newAvailableGems[Gem.gold] = (newAvailableGems[Gem.gold] ?? 0) - 1;
        }

        // Add to Reserved
        final newReserved = List<SplendorCard>.from(newPlayerState.reservedCards)..add(card);
        newPlayerState = newPlayerState.copyWith(gems: newPlayerGems, reservedCards: newReserved);
        
        // Remove from Board
        if (sourceList == newGameState.tier1Cards) {
           newGameState = newGameState.copyWith(tier1Cards: [...newGameState.tier1Cards]..remove(card));
        } else if (sourceList == newGameState.tier2Cards) {
           newGameState = newGameState.copyWith(tier2Cards: [...newGameState.tier2Cards]..remove(card));
        } else if (sourceList == newGameState.tier3Cards) {
           newGameState = newGameState.copyWith(tier3Cards: [...newGameState.tier3Cards]..remove(card));
        }
        newGameState = newGameState.copyWith(availableGems: newAvailableGems);

        // Refill Board (from Action Payload)
        if (action['replacementCard'] != null) {
           final replacement = _cardFromPayload(action['replacementCard']);
           if (replacement.tier == 1) newGameState = newGameState.copyWith(tier1Cards: [...newGameState.tier1Cards, replacement]);
           else if (replacement.tier == 2) newGameState = newGameState.copyWith(tier2Cards: [...newGameState.tier2Cards, replacement]);
           else if (replacement.tier == 3) newGameState = newGameState.copyWith(tier3Cards: [...newGameState.tier3Cards, replacement]);
        }

    } else if (type == 'reserve_deck') {
        if (action['drawnCard'] == null) {
             throw Exception("reserve_deck requires 'drawnCard' in action payload");
        }
        
        final drawnCard = _cardFromPayload(action['drawnCard']);
             
        // Take Gold
        final newPlayerGems = Map<Gem, int>.from(newPlayerState.gems);
        final newAvailableGems = Map<Gem, int>.from(newGameState.availableGems);
        if ((newAvailableGems[Gem.gold] ?? 0) > 0) {
           newPlayerGems[Gem.gold] = (newPlayerGems[Gem.gold] ?? 0) + 1;
           newAvailableGems[Gem.gold] = (newAvailableGems[Gem.gold] ?? 0) - 1;
        }
             
        // Add to reserved
        final newReserved = List<SplendorCard>.from(newPlayerState.reservedCards)..add(drawnCard);
        newPlayerState = newPlayerState.copyWith(gems: newPlayerGems, reservedCards: newReserved);
        newGameState = newGameState.copyWith(availableGems: newAvailableGems);
             
        // Decrement deck count
        final tier = action['tier'] as int;
        if (tier == 1) newGameState = newGameState.copyWith(tier1DeckCount: newGameState.tier1DeckCount - 1);
        if (tier == 2) newGameState = newGameState.copyWith(tier2DeckCount: newGameState.tier2DeckCount - 1);
        if (tier == 3) newGameState = newGameState.copyWith(tier3DeckCount: newGameState.tier3DeckCount - 1);

    } else if (type == 'take_gems') {
        final gemsToTake = Map<String, dynamic>.from(action['gems']); // {'red': 1, 'blue': 1}
        
        final newPlayerGems = Map<Gem, int>.from(newPlayerState.gems);
        final newAvailableGems = Map<Gem, int>.from(newGameState.availableGems);

        gemsToTake.forEach((key, val) {
           final gem = Gem.values.firstWhere((g) => g.name == key);
           final count = val as int;
           newPlayerGems[gem] = (newPlayerGems[gem] ?? 0) + count;
           newAvailableGems[gem] = (newAvailableGems[gem] ?? 0) - count;
        });
        
        newPlayerState = newPlayerState.copyWith(gems: newPlayerGems);
        newGameState = newGameState.copyWith(availableGems: newAvailableGems);
    }
    
    // Update Player within GameState
    final newPlayerStates = List<PlayerState>.from(newGameState.playerStates);
    final index = newPlayerStates.indexWhere((p) => p.playerId == playerId);
    newPlayerStates[index] = newPlayerState;
    
    _state = newGameState.copyWith(playerStates: newPlayerStates);
  }
  
  void _nextTurn() {
     // 1. Check Nobles
     // Auto-visit nobles if requirements met.
     // Simplified: Just check current player
     final currentPlayer = _state.playerStates[_state.turnIndex];
     final availableNobles = List<Noble>.from(_state.nobles);
     final visitedNobles = <Noble>[];
     
     for (var noble in availableNobles) {
        bool qualifies = true;
        for (var entry in noble.requirements.entries) {
           // Bonus only? Or Bonus + Gem? 
           // Standard Splendor: Nobles require BONUSES (cards), not gems.
           final bonusCount = currentPlayer.bonuses[entry.key] ?? 0;
           if (bonusCount < entry.value) {
              qualifies = false;
              break;
           }
        }
        if (qualifies) visitedNobles.add(noble);
     }
     
     if (visitedNobles.isNotEmpty) {
        // Player visits ONE noble per turn? Or all? 
        // Standard rules: "One noble per turn". If multiple eligible, player chooses?
        // For Shared Engine / Auto, let's just pick first or all? 
        // Rule: "At the end of their turn... if he has enough bonuses... he receives the noble... only one per turn."
        // If eligible for multiple, player chooses.
        // Complex! "Player chooses" implies interaction.
        // For MVP/AI: Auto-pick the highest point one (usually all valid are 3pts) or first one.
        final nobleToVisit = visitedNobles.first;
        
        // Remove from board
        final newNobles = List<Noble>.from(_state.nobles)..remove(nobleToVisit);
        
        // Add to player
        final newPlayerNobles = List<Noble>.from(currentPlayer.nobles)..add(nobleToVisit);
        final newScore = currentPlayer.score + nobleToVisit.points;
        final newPlayerState = currentPlayer.copyWith(nobles: newPlayerNobles, score: newScore);
        
        // Update State
        final newPlayerStates = List<PlayerState>.from(_state.playerStates);
        newPlayerStates[_state.turnIndex] = newPlayerState;
        _state = _state.copyWith(nobles: newNobles, playerStates: newPlayerStates);
     }

     // 2. Increment Turn
     int nextIndex = (_state.turnIndex + 1) % _state.players.length;
     _state = _state.copyWith(turnIndex: nextIndex);

     // 3. Check Win (At end of round)
     // Rule: "When a player reaches 15 points, complete the current round so that each player has played the same number of turns."
     // We check for a winner only when the turn loops back to the first player (index 0).
     if (nextIndex == 0) {
        if (checkWinCondition()) {
           _state = _state.copyWith(status: GameStatus.finished);
        }
     }
  }
  
  _PaymentResult _calculatePayment(PlayerState player, SplendorCard card) {
      final cost = card.cost;
      final bonuses = player.bonuses;
      final gems = player.gems;
      
      final paidGems = <Gem, int>{};
      int goldNeeded = 0;
      
      cost.forEach((gem, amount) {
          final bonus = bonuses[gem] ?? 0;
          final check = amount - bonus;
          if (check > 0) {
             // Need to pay 'check' gems
             final available = gems[gem] ?? 0;
             if (available >= check) {
                paidGems[gem] = check;
             } else {
                // partial pay
                if (available > 0) paidGems[gem] = available;
                goldNeeded += (check - available) as int;
             }
          }
      });
      
   if (goldNeeded > 0) {
       final availableGold = gems[Gem.gold] ?? 0;
       if (availableGold < goldNeeded) {
           throw Exception("Cannot afford card: Need $goldNeeded gold, have $availableGold");
       }
       paidGems[Gem.gold] = goldNeeded;
   }
   
   return _PaymentResult(paidGems);
  }

  SplendorCard _cardFromPayload(dynamic payload) {
    if (payload is SplendorCard) return payload;
    if (payload is Map<String, dynamic>) return SplendorCard.fromJson(payload);
    throw Exception("Invalid card payload type: ${payload.runtimeType}");
  }

  // Not strictly needed in interface but useful for logic
  PlayerState _payCost(PlayerState player, SplendorCard card, GameState currentState) {return player;} // Placeholder used above logic inline
  @override
  bool checkWinCondition() {
    // Check all players
    for (var p in _state.playerStates) {
       if (winStrategy.isWinner(_state, p)) return true;
    }
    return false;
  }

  @override
  void resolveTimeout() {
     // If draft valid -> commit
     if (_state.draftAction != null && _state.isDraftValid) {
       applyAction({'type': 'confirm'});
     } else {
       // Random move or Skip
       // For v3.2 MVP, let's just skip turn or do nothing
       _nextTurn();
     }
  }
}

class _PaymentResult {
   final Map<Gem, int> paidGems;
   _PaymentResult(this.paidGems);
}
