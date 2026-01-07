import 'package:flutter/material.dart';
import 'package:splendor_shared/splendor_shared.dart';

class GemToken extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: size,
            height: size,
            transform: isSelected ? Matrix4.translationValues(0, -10, 0) : Matrix4.identity(),
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
