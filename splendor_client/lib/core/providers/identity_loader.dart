import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/persistence/settings_service.dart';
import 'identity_provider.dart';

final identityLoaderProvider = FutureProvider<void>((ref) async {
  final settings = ref.read(settingsServiceProvider);
  final data = await settings.loadIdentity();
  
  if (data['name'] != null && data['avatar'] != null) {
      ref.read(identityServiceProvider).setIdentity(data['name']!, data['avatar']!);
  }
});
