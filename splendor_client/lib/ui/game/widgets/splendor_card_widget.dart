import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:splendor_shared/splendor_shared.dart';

class SplendorCardWidget extends StatefulWidget {
  final SplendorCard card;
  final bool isAffordable;
  final bool isReserved;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const SplendorCardWidget({
    super.key,
    required this.card,
    this.isAffordable = false,
    this.isReserved = false,
    this.onTap,
    this.onLongPress,
  });

  @override
  State<SplendorCardWidget> createState() => _SplendorCardWidgetState();
}

class _SplendorCardWidgetState extends State<SplendorCardWidget> {
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

  List<Color> _getCardGradient(int tier) {
     switch (tier) {
        case 1: return [const Color(0xFF1B5E20), Colors.black]; // Green (Tier 1)
        case 2: return [const Color(0xFFF57F17), Colors.black]; // Amber (Tier 2)
        case 3: return [const Color(0xFF0D47A1), Colors.black]; // Blue (Tier 3)
        default: return [Colors.grey[850]!, Colors.black];
     }
  }

  @override
  Widget build(BuildContext context) {
    // Base scale
    final double scale = _isHovered ? 2.0 : 1.0;
    
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: widget.onTap != null ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: widget.onTap,
        onLongPress: widget.onLongPress,
        child: AnimatedContainer(
          duration: 200.ms,
          curve: Curves.easeOut, // Fixed: easeOutBack caused negative blurRadius during overshoot
          transform: Matrix4.identity()..scale(scale),
          transformAlignment: Alignment.center,
          width: 80,
          height: 110,
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            image: DecorationImage(
               // Deterministically pick one of 3 variants based on card ID
               image: AssetImage('assets/images/cards/level${widget.card.tier}_${(widget.card.id.hashCode % 3) + 1}.png'),
               fit: BoxFit.cover,
               colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken)
            ),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: widget.isAffordable 
                  ? Colors.greenAccent 
                  : (_isHovered ? Colors.white54 : Colors.white24),
              width: widget.isAffordable ? 2 : 1.5
            ),
            boxShadow: _isHovered 
              ? [BoxShadow(color: Colors.black54, blurRadius: 10, spreadRadius: 2)] 
              : [],
          ),
          child: Stack(
            children: [
              // 1. Points (Top Left)
              if (widget.card.points > 0)
                Positioned(
                  top: 4, left: 6,
                  child: Text(
                    "${widget.card.points}",
                    style: const TextStyle(
                      color: Colors.white, 
                      fontSize: 24, 
                      fontWeight: FontWeight.w900,
                      // Removed Shadow to Fix Crash
                    ),
                  ),
                ),

              // 2. Bonus Gem (Top Right)
              Positioned(
                top: 6, right: 6,
                child: Icon(
                   Icons.diamond, // Placeholder for specific Gem Icon
                   color: _getGemColor(widget.card.bonusGem),
                   size: 22
                ),
              ),

              // 3. Cost Column (Bottom Left)
              Positioned(
                bottom: 6, left: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widget.card.cost.entries.map((e) {
                    return Container(
                      margin: const EdgeInsets.only(top: 2),
                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                      decoration: BoxDecoration(
                        color: _getGemColor(e.key).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: _getGemColor(e.key).withOpacity(0.6), width: 1)
                      ),
                      child: Row(
                         children: [
                           Container(
                              width: 8, height: 8,
                              decoration: BoxDecoration(color: _getGemColor(e.key), shape: BoxShape.circle),
                           ),
                           const SizedBox(width: 4),
                           Text("${e.value}", style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold))
                         ]
                      ),
                    );
                  }).toList(),
                ),
              ),
              
              // 4. Reserved Indicator
              if (widget.isReserved)
                Positioned(
                  bottom: 6, right: 6,
                  child: Container(
                     padding: const EdgeInsets.all(4),
                     decoration: BoxDecoration(
                        color: Colors.black87,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.amber.withOpacity(0.8), width: 1.5)
                     ),
                     child: const Icon(Icons.lock, color: Colors.amber, size: 16),
                  )
                ),
            ],
          ),
        ),
      ),
    );
  }
}
