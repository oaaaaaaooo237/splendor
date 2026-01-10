import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../persistence/settings_service.dart';

class ServerConfigNotifier extends StateNotifier<String> {
  final SettingsService _service;

  ServerConfigNotifier(this._service) : super('https://192.168.5.140:58080') {
    _load();
  }

  Future<void> _load() async {
    state = await _service.loadServerConfig();
  }

  Future<void> setUrl(String url) async {
    state = url;
    await _service.saveServerConfig(url);
  }
}

final serverConfigProvider = StateNotifierProvider<ServerConfigNotifier, String>((ref) {
  return ServerConfigNotifier(ref.read(settingsServiceProvider));
});
