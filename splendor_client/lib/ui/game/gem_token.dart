import 'package:flutter/material.dart';
import 'package:splendor_shared/splendor_shared.dart';

class GemToken extends StatelessWidget {
  final Gem gem;
  final double size;
  final VoidCallback? onTap;
  final bool isSelected;

  const GemToken({
    super.key,
    required this.gem,
    this.size = 50,
    this.onTap,
    this.isSelected = false,
  });

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
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: size,
        height: size,
        transform: isSelected ? Matrix4.translationValues(0, -10, 0) : Matrix4.identity(),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              _color.withOpacity(0.8),
              _color,
              Colors.black87,
            ],
            stops: const [0.2, 0.6, 1.0],
            center: const Alignment(-0.3, -0.3),
          ),
          boxShadow: [
            BoxShadow(
              color: isSelected ? _color.withOpacity(0.8) : Colors.black54,
              blurRadius: isSelected ? 12 : 6,
              offset: const Offset(2, 4),
            ),
            // Inner rim highlight
            BoxShadow(
              color: Colors.white.withOpacity(0.3),
              blurRadius: 2,
              spreadRadius: -2,
              offset: const Offset(-2, -2),
            )
          ],
          border: isSelected ? Border.all(color: Colors.white, width: 2) : null,
        ),
        child: Center(
          child: gem == Gem.white 
            ? Container() // Diamond needs no inner
            : Container( // Imperfection / Facet
                width: size * 0.4,
                height: size * 0.4,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.white.withOpacity(0.2), Colors.transparent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
        ),
      ),
    );
  }
}
