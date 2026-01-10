import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:splendor_shared/splendor_shared.dart';

class NobleWidget extends StatefulWidget {
  final Noble noble;

  const NobleWidget({super.key, required this.noble});

  @override
  State<NobleWidget> createState() => _NobleWidgetState();
}

class _NobleWidgetState extends State<NobleWidget> {
  bool _isHovered = false;

  Color _getGemColor(Gem gem) {
    switch (gem) {
      case Gem.red: return Colors.red;
      case Gem.blue: return Colors.blue;
      case Gem.green: return Colors.green;
      case Gem.black: return const Color(0xFF333333);
      case Gem.white: return Colors.white;
      case Gem.gold: return Colors.amber;
    }
  }

  @override
  Widget build(BuildContext context) {
    final double scale = _isHovered ? 2.0 : 1.0; // 2.0x Magnification

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: 200.ms,
        curve: Curves.easeOut,
        transform: Matrix4.diagonal3Values(scale, scale, 1.0),
        transformAlignment: Alignment.centerRight, // Anchors to right, grows to left
        width: 100, // Increased Base Size
        height: 100, // Increased Base Size
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8), // More spacing
        decoration: BoxDecoration(
          color: const Color(0xFF3E2723),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.amber.withValues(alpha: 0.5), width: 1.5),
          boxShadow: _isHovered 
              ? [const BoxShadow(color: Colors.black54, blurRadius: 15, spreadRadius: 2)] 
              : [const BoxShadow(color: Colors.black54, blurRadius: 4, offset: Offset(2, 2))],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6.5),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                'assets/images/nobles/${widget.noble.id}.png',
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(color: Colors.brown[900]),
              ),
              // Points (Top Left)
              Positioned(
                top: 4, left: 6,
                child: Text(
                  "${widget.noble.points}",
                  style: const TextStyle(
                    fontSize: 24, // Larger font
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [Shadow(color: Colors.black, blurRadius: 2)] 
                  )
                )
              ),
              // Costs (Bottom)
              Positioned(
                bottom: 4, left: 4,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: widget.noble.requirements.entries.map((e) {
                    return Container(
                      margin: const EdgeInsets.only(top: 2),
                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                      color: Colors.black54,
                      child: Row(
                        children: [
                          Container(
                            width: 12, height: 16, // Larger gem icons
                            decoration: BoxDecoration(color: _getGemColor(e.key), borderRadius: BorderRadius.circular(2))
                          ),
                          const SizedBox(width: 4),
                          Text("${e.value}", style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold))
                        ],
                      ),
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
