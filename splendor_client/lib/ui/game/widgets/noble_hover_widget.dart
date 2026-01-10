import 'package:flutter/material.dart';

import 'package:splendor_shared/splendor_shared.dart';

// Uses OverlayPortal to break out of the z-index stack of the main layout,
// ensuring the magnified version is ALWAYS on top of everything (HUD, Action Bar, etc).
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/visual_settings_provider.dart';

class NobleHoverWidget extends ConsumerStatefulWidget {
  final Noble noble;

  const NobleHoverWidget({super.key, required this.noble});

  @override
  ConsumerState<NobleHoverWidget> createState() => _NobleHoverWidgetState();
}

class _NobleHoverWidgetState extends ConsumerState<NobleHoverWidget> {
  final OverlayPortalController _overlayController = OverlayPortalController();
  final LayerLink _layerLink = LayerLink();


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
    // Base Widget (What sits in the list)

    final settings = ref.watch(visualSettingsProvider);
    
    return CompositedTransformTarget(
      link: _layerLink,
      child: MouseRegion(
        onEnter: (_) {
           if (settings.enableEffects) {
              _overlayController.show();
           }
        },
        onExit: (_) {
           _overlayController.hide();
        },
        child: OverlayPortal(
           controller: _overlayController,
           overlayChildBuilder: (context) {
              // The Overlay Content (Magnified)
              return Positioned(
                 width: 250, // Magnified Width
                 height: 250, // Magnified Height
                 child: CompositedTransformFollower(
                    link: _layerLink,
                    showWhenUnlinked: false,
                    // Anchor to the RIGHT side of the source, but shifted left (0,0 of source aligns with 0,0 of overlay)
                    // We want it to "grow" to the left essentially, or just center?
                    // User said "Magnify". 
                    // Let's anchor Top-Right of Overlay to Top-Right of Source.
                    offset: const Offset(-150, -0), // Shift left by difference in width (250-100=150)
                    child: IgnorePointer(
                       child: _buildNobleCard(true),
                    ),
                 ),
              );
           },
           child: Container(
              width: 100, height: 100,
              margin: const EdgeInsets.only(bottom: 12),
              child: _buildNobleCard(false),
           ),
        ),
      ),
    );
  }

  Widget _buildNobleCard(bool isOverlay) {
     final width = isOverlay ? 250.0 : 100.0;
     final height = isOverlay ? 250.0 : 100.0;
     final fontSize = isOverlay ? 36.0 : 20.0;
     final gemSize = isOverlay ? 24.0 : 14.0;
     
     return Container(
        width: width, height: height,
        decoration: BoxDecoration(
          color: const Color(0xFF3E2723),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.amber.withValues(alpha: 0.5), width: isOverlay ? 3 : 1.5),
          boxShadow: [
             BoxShadow(color: Colors.black54, blurRadius: isOverlay ? 20 : 4, spreadRadius: isOverlay ? 5 : 0)
          ],
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
                  style: TextStyle(
                    fontSize: fontSize, 
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: const [Shadow(color: Colors.black, blurRadius: 2)] 
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
                            width: gemSize, height: gemSize + 4, 
                            decoration: BoxDecoration(color: _getGemColor(e.key), borderRadius: BorderRadius.circular(2))
                          ),
                          const SizedBox(width: 4),
                          Text("${e.value}", style: TextStyle(color: Colors.white, fontSize: isOverlay ? 16 : 12, fontWeight: FontWeight.bold))
                        ],
                      ),
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        ),
     );
  }
}
