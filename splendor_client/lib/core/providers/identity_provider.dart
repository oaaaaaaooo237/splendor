import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:splendor_shared/splendor_shared.dart';
import 'package:uuid/uuid.dart';

// Helper to store current user identity
// In real app, load from SharedPrefs
final identityProvider = StateProvider<PlayerIdentity?>((ref) => null);

class IdentityService {
  final Ref ref;
  IdentityService(this.ref);

  void setIdentity(String name, String avatarId) {
    if (name.isEmpty) return;
    
    // Generate UUID if not exists (mock persistence)
    final uuid = const Uuid().v4();
    
    final identity = PlayerIdentity(
      uuid: uuid, 
      name: name, 
      avatarId: avatarId,
      isBot: false,
    );
    
    ref.read(identityProvider.notifier).state = identity;
  }
}

final identityServiceProvider = Provider((ref) => IdentityService(ref));
