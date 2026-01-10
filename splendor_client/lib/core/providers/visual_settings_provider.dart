import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../persistence/settings_service.dart';

class VisualSettings {
  final bool enableEffects;
  final double bgmVolume;
  final double sfxVolume;

  VisualSettings({
    required this.enableEffects,
    required this.bgmVolume,
    required this.sfxVolume,
  });

  VisualSettings copyWith({
    bool? enableEffects,
    double? bgmVolume,
    double? sfxVolume,
  }) {
    return VisualSettings(
      enableEffects: enableEffects ?? this.enableEffects,
      bgmVolume: bgmVolume ?? this.bgmVolume,
      sfxVolume: sfxVolume ?? this.sfxVolume,
    );
  }
}

class VisualSettingsNotifier extends StateNotifier<VisualSettings> {
  final SettingsService _service;

  VisualSettingsNotifier(this._service)
      : super(VisualSettings(enableEffects: true, bgmVolume: 0.5, sfxVolume: 0.8)) {
    _load();
  }

  Future<void> _load() async {
    final effects = await _service.loadVisualSettings();
    final audio = await _service.loadAudioSettings();
    state = VisualSettings(
      enableEffects: effects,
      bgmVolume: audio.bgm,
      sfxVolume: audio.sfx,
    );
  }

  Future<void> toggle(bool enabled) async {
    state = state.copyWith(enableEffects: enabled);
    await _service.saveVisualSettings(enabled);
  }

  Future<void> updateBgmVolume(double v) async {
    state = state.copyWith(bgmVolume: v);
    await _service.saveAudioSettings(v, state.sfxVolume);
  }

  Future<void> updateSfxVolume(double v) async {
    state = state.copyWith(sfxVolume: v);
    await _service.saveAudioSettings(state.bgmVolume, v);
  }
}

final visualSettingsProvider =
    StateNotifierProvider<VisualSettingsNotifier, VisualSettings>((ref) {
  final service = ref.watch(settingsServiceProvider);
  return VisualSettingsNotifier(service);
});
