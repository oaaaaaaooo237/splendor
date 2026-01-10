import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../persistence/settings_service.dart';

class GameplaySettings {
  final int turnDuration;
  GameplaySettings({required this.turnDuration});

  GameplaySettings copyWith({int? turnDuration}) {
    return GameplaySettings(turnDuration: turnDuration ?? this.turnDuration);
  }
}

class GameplaySettingsNotifier extends StateNotifier<GameplaySettings> {
  final SettingsService _service;

  GameplaySettingsNotifier(this._service) : super(GameplaySettings(turnDuration: 45)) {
    _load();
  }

  Future<void> _load() async {
    final duration = await _service.loadTurnDuration();
    state = state.copyWith(turnDuration: duration);
  }

  Future<void> setTurnDuration(int seconds) async {
    await _service.saveTurnDuration(seconds);
    state = state.copyWith(turnDuration: seconds);
  }
}

final gameplaySettingsProvider = StateNotifierProvider<GameplaySettingsNotifier, GameplaySettings>((ref) {
  return GameplaySettingsNotifier(ref.read(settingsServiceProvider));
});
