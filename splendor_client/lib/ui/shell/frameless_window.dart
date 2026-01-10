import 'package:window_manager/window_manager.dart';
import 'package:flutter/material.dart';

class FramelessWindow extends StatelessWidget {
  final Widget child;
  const FramelessWindow({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Custom Drag Region (Title Bar)
        DragToMoveArea(
          child: Container(
            height: 32,
            color: const Color(0xFF1E1E1E), // Match app dark theme
            child: Row(
              children: [
                const SizedBox(width: 12),
                const Icon(Icons.diamond, size: 14, color: Colors.amber),
                const SizedBox(width: 8),
                const Expanded(
                   child: Text("SPLENDOR PRIVATE CLOUD", style: TextStyle(color: Colors.white54, fontSize: 12, letterSpacing: 2))
                ),
                // Window Buttons
                _WindowButton(
                   icon: Icons.remove, 
                   onPressed: () => windowManager.minimize()
                ),
                _WindowButton(
                   icon: Icons.check_box_outline_blank, 
                   onPressed: () async {
                      if (await windowManager.isMaximized()) {
                         windowManager.unmaximize();
                      } else {
                         windowManager.maximize();
                      }
                   }
                ),
                _WindowButton(
                   icon: Icons.close, 
                   onPressed: () => windowManager.close(),
                   isClose: true
                ),
              ],
            ),
          ),
        ),
        Expanded(child: child),
      ],
    );
  }
}

class _WindowButton extends StatefulWidget {
   final IconData icon;
   final VoidCallback onPressed;
   final bool isClose;
   
   const _WindowButton({required this.icon, required this.onPressed, this.isClose = false});

   @override
   State<_WindowButton> createState() => _WindowButtonState();
}

class _WindowButtonState extends State<_WindowButton> {
   bool _isHovering = false;
   
   @override
   Widget build(BuildContext context) {
      Color bg = Colors.transparent;
      if (_isHovering) {
         bg = widget.isClose ? Colors.red : Colors.white.withValues(alpha: 0.1);
      }
      
      return MouseRegion(
         onEnter: (_) => setState(() => _isHovering = true),
         onExit: (_) => setState(() => _isHovering = false),
         child: GestureDetector(
            onTap: widget.onPressed,
            child: Container(
               width: 48,
               height: 32,
               color: bg,
               child: Icon(widget.icon, size: 16, color: Colors.white),
            ),
         ),
      );
   }
}
