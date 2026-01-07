import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/persistence/settings_service.dart';
import '../../ui/theme/app_theme.dart';

class ThemeNotifier extends StateNotifier<ThemeMode> {
  final SettingsService _settingsService;

  ThemeNotifier(this._settingsService) : super(ThemeMode.system) {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final modeStr = await _settingsService.loadThemeMode();
    if (modeStr != null) {
      if (modeStr == 'dark') {
        state = ThemeMode.dark;
      } else if (modeStr == 'light') {
        state = ThemeMode.light;
      } else {
        state = ThemeMode.system;
      }
    }
  }

  Future<void> setTheme(ThemeMode mode) async {
    state = mode;
    String modeStr = 'system';
    if (mode == ThemeMode.dark) modeStr = 'dark';
    if (mode == ThemeMode.light) modeStr = 'light';
    await _settingsService.saveThemeMode(modeStr);
  }
}

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>((ref) {
  final settingsService = ref.watch(settingsServiceProvider);
  return ThemeNotifier(settingsService);
});

final appThemeProvider = Provider<SplendorTheme>((ref) {
  final mode = ref.watch(themeProvider);
  if (mode == ThemeMode.dark) return DarkSplendorTheme();
  if (mode == ThemeMode.light) return LightSplendorTheme();
  // For system, we default to Dark for "Premium" feel, or check platform brightness if we had context?
  // Without context, let's default to primary premium Dark.
  return DarkSplendorTheme();
});
