import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsService {
  static const _keyName = 'player_name';
  static const _keyAvatar = 'player_avatar';
  static const _keyServer = 'server_url';
  static const _keyTheme = 'theme_mode'; // Persistence key

  Future<void> saveIdentity(String name, String avatarId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyName, name);
    await prefs.setString(_keyAvatar, avatarId);
  }

  Future<void> saveThemeMode(String themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyTheme, themeMode);
  }
  
  Future<String?> loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyTheme);
  }

  Future<void> clearIdentity() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyName);
    await prefs.remove(_keyAvatar);
  }

  Future<Map<String, String?>> loadIdentity() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'name': prefs.getString(_keyName),
      'avatar': prefs.getString(_keyAvatar),
    };
  }
  Future<void> saveServerConfig(String url) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyServer, url);
  }

  Future<String> loadServerConfig() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyServer) ?? 'http://localhost:8080';
  }

  static const _keyBgmVolume = 'bgm_volume';
  static const _keySfxVolume = 'sfx_volume';

  Future<void> saveAudioSettings(double bgm, double sfx) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_keyBgmVolume, bgm);
    await prefs.setDouble(_keySfxVolume, sfx);
  }

  Future<({double bgm, double sfx})> loadAudioSettings() async {
    final prefs = await SharedPreferences.getInstance();
    return (
      bgm: prefs.getDouble(_keyBgmVolume) ?? 0.5,
      sfx: prefs.getDouble(_keySfxVolume) ?? 0.8
    );
  }

  static const _keyEnableEffects = 'enable_effects';

  Future<void> saveVisualSettings(bool enableEffects) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyEnableEffects, enableEffects);
  }

  Future<bool> loadVisualSettings() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyEnableEffects) ?? true;
  }
}

final settingsServiceProvider = Provider((ref) => SettingsService());
