import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:splendor_shared/splendor_shared.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/visual_settings_provider.dart';

class SplendorCardWidget extends ConsumerStatefulWidget {
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
    this.isHoveredOverride, // [NEW]
  });

  final bool? isHoveredOverride;

  @override
  ConsumerState<SplendorCardWidget> createState() => _SplendorCardWidgetState();
}

class _SplendorCardWidgetState extends ConsumerState<SplendorCardWidget> {
  bool _isHovered = false;
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();

  @override
  void dispose() {
    _removeOverlay();
    super.dispose();
  }

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

  void _showOverlay() {
    if (_overlayEntry != null) return;
    
    final settings = ref.read(visualSettingsProvider);
    if (!settings.enableEffects) return;

    // 1. Calculate Absolute Position & Visual Size
    final renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox == null) return;
    
    final offset = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size; 
    
    // Calculate the actual visual scale applied by ancestors (like FittedBox)
    final Offset bottomRight = renderBox.localToGlobal(Offset(size.width, size.height));
    final double visualWidth = (bottomRight.dx - offset.dx).abs();
    final double visualHeight = (bottomRight.dy - offset.dy).abs();
    
    // 2. Determine Desired Overlay Position (Center Aligned)
    // Target Size: 2x of the VISUAL size (Area 4x)
    final double targetWidth = visualWidth * 2.0;
    final double targetHeight = visualHeight * 2.0;
    
    double left = offset.dx - (targetWidth - visualWidth) / 2;
    double top = offset.dy - (targetHeight - visualHeight) / 2;
    
    // 3. Clamp to Screen Bounds
    final mediaQuery = MediaQuery.of(context);
    final double screenWidth = mediaQuery.size.width;
    final double screenHeight = mediaQuery.size.height;
    final EdgeInsets padding = const EdgeInsets.all(10); // Safety margin

    // Horizontal Clamp
    if (left < padding.left) left = padding.left;
    if (left + targetWidth > screenWidth - padding.right) {
       left = screenWidth - padding.right - targetWidth;
    }
    
    // Vertical Clamp
    if (top < padding.top) top = padding.top;
    if (top + targetHeight > screenHeight - padding.bottom) {
       top = screenHeight - padding.bottom - targetHeight;
    }

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          left: left,
          top: top,
          width: targetWidth,
          height: targetHeight,
          child: IgnorePointer( 
            child: _buildCardContent(
              isHovered: true, 
              isOverlay: true, 
              width: targetWidth, // Pass precise visual target size
              height: targetHeight
            ),
          ),
        );
      },
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    // We keep the original card in the layout but wrap it with CompositedTransformTarget
    // The original card will NOT scale, ensuring layout stability.
    return MouseRegion(
      onEnter: (_) {
         setState(() => _isHovered = true);
         _showOverlay();
      },
      onExit: (_) {
         setState(() => _isHovered = false);
         _removeOverlay();
      },
      cursor: widget.onTap != null ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: widget.onTap,
        onLongPress: widget.onLongPress,
        child: CompositedTransformTarget(
          link: _layerLink,
          child: _buildCardContent(isHovered: _isHovered, isOverlay: false),
        ),
      ),
    );
  }

  Widget _buildCardContent({
    required bool isHovered, 
    required bool isOverlay, 
    double width = 80, 
    double height = 110,
    double scale = 1.0, // Not used for layout, just for consistency if needed
  }) {
    // If this is the overlay, we force high-quality definition and shadows
    final bool showEffects = isOverlay; 
    
    // Scale text/icons too?
    // If we just make the container bigger, the text size (fontSize: 24) stays small!
    // The user requested "Area 4x, Width/Height 2x".
    // If we want it to look exactly like a "Zoom", everything inside must scale.
    // So wrapping in FittedBox or scaling fonts is needed.
    // Using FittedBox inside the container is easiest.
    
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        image: DecorationImage(
           image: AssetImage('assets/images/cards/level${widget.card.tier}_${(widget.card.id.hashCode % 3) + 1}.png'),
           fit: BoxFit.cover,
           colorFilter: ColorFilter.mode(Colors.black.withValues(alpha: 0.3), BlendMode.darken)
        ),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: widget.isAffordable 
              ? Colors.greenAccent 
              : ((isHovered || isOverlay) ? Colors.white : Colors.white24),
          width: widget.isAffordable ? 2 : 1.5
        ),
        boxShadow: showEffects 
          ? const [BoxShadow(color: Colors.black87, blurRadius: 20, spreadRadius: 4)] 
          : [],
      ),
      // Use FittedBox to scale internal content (Text, Icons) to fill the new size
      child: FittedBox(
        fit: BoxFit.fill, // or contain, but the aspect ratio is preserved (80x110 vs 160x220)
        child: SizedBox(
          width: 80, // Internal coordinate system stays 80x110
          height: 110,
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
                    ),
                  ),
                ),

              // 2. Bonus Gem (Top Right)
              Positioned(
                top: 6, right: 6,
                child: Icon(
                   Icons.diamond,
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
                        color: _getGemColor(e.key).withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: _getGemColor(e.key).withValues(alpha: 0.6), width: 1)
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
                        border: Border.all(color: Colors.amber.withValues(alpha: 0.8), width: 1.5)
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
