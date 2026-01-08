import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../persistence/settings_service.dart';

class VisualSettingsNotifier extends StateNotifier<bool> {
  final SettingsService _service;

  VisualSettingsNotifier(this._service) : super(true) {
    _load();
  }

  Future<void> _load() async {
    final enabled = await _service.loadVisualSettings();
    state = enabled;
  }

  Future<void> toggle(bool enabled) async {
    state = enabled;
    await _service.saveVisualSettings(enabled);
  }
}

final visualSettingsProvider = StateNotifierProvider<VisualSettingsNotifier, bool>((ref) {
  final service = ref.watch(settingsServiceProvider);
  return VisualSettingsNotifier(service);
});
