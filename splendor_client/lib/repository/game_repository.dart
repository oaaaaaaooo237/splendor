import 'dart:async';
import 'package:splendor_shared/splendor_shared.dart';
import 'package:splendor_shared/src/logic/engine/splendor_game_engine.dart';
import 'package:splendor_shared/src/logic/utils/game_setup_helper.dart';

// CONTEXT:
// Purpose: Abstraction layer for Game Logic (Local vs Remote).
// Libraries: splendor_shared, dart:async

abstract class IGameRepository {
  Stream<GameState> get stateStream;
  GameState get currentState;
  int get turnDuration; // [NEW]
  
  Future<void> initialize(List<PlayerIdentity> players);
  Future<void> applyAction(Map<String, dynamic> action);
  
  // For Client-side Deck Management (Local needs it, Remote handles it on Server)
  // Approach: Repository exposes "DrawReplacement" capability?
  // Or State includes Decks? shared State doesn't include decks.
  // For Remote, Server handles refill. For Local, Repository must handle refill.
  // So drawReplacement logic moves INSIDE Repository.
  SplendorCard? drawReplacement(int tier);
  
  void dispose();
}

class LocalGameRepository implements IGameRepository {
  SplendorGameEngine? _engine;
  final _controller = StreamController<GameState>.broadcast();
  
  // Decks for Local Play
  List<SplendorCard> _deck1 = [];
  List<SplendorCard> _deck2 = [];
  List<SplendorCard> _deck3 = [];

  final int _turnDuration;

  LocalGameRepository({int turnDuration = 45}) : _turnDuration = turnDuration;

  Timer? _timer;

  @override
  Stream<GameState> get stateStream => _controller.stream;

  @override
  GameState get currentState {
    if (_engine == null) throw Exception("Game not initialized");
    return _engine!.currentState;
  }

  @override
  Future<void> initialize(List<PlayerIdentity> players) async {
    final setup = GameSetupHelper.setupGame(players);
    _deck1 = setup.deck1;
    _deck2 = setup.deck2;
    _deck3 = setup.deck3;
    
    _engine = SplendorGameEngine(
      initialState: setup.initialState,
      winStrategy: PointsWinStrategy(targetPoints: 15),
    );
    
    _emitState();
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    if (_engine?.currentState.status == GameStatus.playing) {
       _timer = Timer(Duration(seconds: _turnDuration), _onTimeout);
    }
  }

  void _onTimeout() {
     if (_engine == null) return;
     _engine!.resolveTimeout();
     _emitState();
     _startTimer(); // Restart for next player
  }

  @override
  Future<void> applyAction(Map<String, dynamic> action) async {
    if (_engine == null) return;
    
    // Handle stochastic replacements here for Local
    // If action is buy/reserve, check if replacement needed
    if (action['type'] == 'buy_card' || action['type'] == 'reserve_card') {
        _handleReplacement(action);
    } else if (action['type'] == 'reserve_deck') {
        _handleDraw(action);
    }

    _engine!.applyAction(action);
    _emitState();
    
    // Reset Timer on valid action
    _startTimer();
  }
  
  // Helper to inject cards for Local Engine
  void _handleReplacement(Map<String, dynamic> action) {
     final cardId = action['cardId'];
     int tier = 1;
     // Find tier (Optimized search)
     final state = _engine!.currentState;
     if (state.tier1Cards.any((c) => c.id == cardId)) tier = 1;
     else if (state.tier2Cards.any((c) => c.id == cardId)) tier = 2;
     else if (state.tier3Cards.any((c) => c.id == cardId)) tier = 3;
     
     final card = drawReplacement(tier);
     if (card != null) {
        action['replacementCard'] = card;
     }
  }
  
  void _handleDraw(Map<String, dynamic> action) {
     final tier = action['tier'] as int;
     final card = drawReplacement(tier);
     if (card != null) {
        action['drawnCard'] = card;
     }
  }

  @override
  SplendorCard? drawReplacement(int tier) {
     if (tier == 1 && _deck1.isNotEmpty) return _deck1.removeLast();
     if (tier == 2 && _deck2.isNotEmpty) return _deck2.removeLast();
     if (tier == 3 && _deck3.isNotEmpty) return _deck3.removeLast();
     return null;
  }

  void _emitState() {
    if (_engine != null) {
      _controller.add(_engine!.currentState);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.close();
  }
  
  @override
  int get turnDuration => _turnDuration; 
}
