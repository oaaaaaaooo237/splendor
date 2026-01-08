import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:splendor_shared/splendor_shared.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/providers/visual_settings_provider.dart';

class GemToken extends ConsumerWidget {
  final Gem gem;
  final double size;
  final VoidCallback? onTap;
  final bool isSelected;

  final int? count;
  final bool showShadow;

  const GemToken({
    super.key,
    required this.gem,
    this.size = 50,
    this.onTap,
    this.isSelected = false,
    this.count,
    this.showShadow = true,
  });

  String get _assetPath {
    switch (gem) {
      case Gem.white: return 'assets/images/gems/white.png';
      case Gem.blue: return 'assets/images/gems/blue.png';
      case Gem.green: return 'assets/images/gems/green.png';
      case Gem.red: return 'assets/images/gems/red.png';
      case Gem.black: return 'assets/images/gems/black.png';
      case Gem.gold: return 'assets/images/gems/gold.png';
    }
  }

  Color get _color {
    switch (gem) {
      case Gem.white: return const Color(0xFFE0E0E0); // Diamond
      case Gem.blue: return const Color(0xFF1565C0); // Sapphire
      case Gem.green: return const Color(0xFF2E7D32); // Emerald
      case Gem.red: return const Color(0xFFC62828); // Ruby
      case Gem.black: return const Color(0xFF424242); // Onyx
      case Gem.gold: return const Color(0xFFFFD700); // Gold
    }
  }


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final enableEffects = ref.watch(visualSettingsProvider);

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: showShadow ? [
                BoxShadow(
                  color: isSelected ? _color.withOpacity(0.8) : Colors.black54,
                  blurRadius: isSelected ? 12 : 6,
                  offset: const Offset(2, 4),
                ),
              ] : null,
              border: isSelected ? Border.all(color: Colors.white, width: 2) : null,
            ),
            child: ClipOval(
              child: Image.asset(
                _assetPath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: _color,
                  child: const Icon(Icons.diamond, color: Colors.white30),
                ),
              ),
            ),
          )
          .animate(target: isSelected ? 1 : 0, adapter: ValueAdapter(isSelected ? 1 : 0)) // Helper adapter? No, generic Animate is fine.
          // IMPORTANT: If effects disabled, we want 0 duration or no effect.
          // Easier: conditional animate? Or just 0 duration if !enabled.
          .scale(
             end: const Offset(1.1, 1.1), 
             duration: enableEffects ? 200.ms : 0.ms, 
             curve: Curves.easeOutBack
          )
          .moveY(
             end: -10, 
             duration: enableEffects ? 200.ms : 0.ms, 
             curve: Curves.easeOut
          ),
          
          if (count != null)
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.black87,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  "$count",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
