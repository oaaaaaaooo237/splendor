import 'dart:async';
import 'package:flutter/material.dart';


class GameHUD extends StatefulWidget {
  final int turnCount;
  final String activePlayerName;
  final bool isMyTurn;
  final int turnDuration; // [NEW]
  final VoidCallback? onPause;
  final VoidCallback? onExit; // [NEW]

  const GameHUD({
    super.key,
    required this.turnCount,
    required this.activePlayerName,
    required this.isMyTurn,
    this.turnDuration = 45,
    this.onPause,
    this.onExit,
  });

  @override
  State<GameHUD> createState() => _GameHUDState();
}

class _GameHUDState extends State<GameHUD> {
  late int _remainingSeconds; 
  Timer? _timer;
  
  @override
  void initState() {
    super.initState();
    _startTimer();
  }
  
  @override
  void didUpdateWidget(GameHUD oldWidget) {
    super.didUpdateWidget(oldWidget);
    // If turn changed, reset timer
    if (oldWidget.activePlayerName != widget.activePlayerName || 
        oldWidget.turnCount != widget.turnCount ||
        oldWidget.turnDuration != widget.turnDuration) {
       _startTimer();
    }
  }
  
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
  
  void _startTimer() {
    _timer?.cancel();
    // If Unlimited, don't start timer
    if (widget.turnDuration <= 0) return;

    _remainingSeconds = widget.turnDuration;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
       if (_remainingSeconds > 0) {
          if (mounted) setState(() => _remainingSeconds--);
       } else {
          timer.cancel();
          if (mounted) setState(() {}); 
       }
    });
  }
  
  String _formatTime() {
     if (widget.turnDuration <= 0) return "∞";
     final min = (_remainingSeconds ~/ 60).toString().padLeft(2, '0');
     final sec = (_remainingSeconds % 60).toString().padLeft(2, '0');
     return "$min:$sec";
  }

  @override
  Widget build(BuildContext context) {
    // Alert color if time is running out (< 10s)
    // Alert color if time is running out (< 10s)
    final timerColor = _remainingSeconds <= 10 ? Colors.redAccent : Colors.white; 
    const iconColor = Colors.white54;
    
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
         gradient: LinearGradient(
            begin: Alignment.topCenter, end: Alignment.bottomCenter,
            colors: [Colors.black.withValues(alpha: 0.8), Colors.transparent]
         )
      ),
      child: Row(
        children: [
           // Round Info
           Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text("ROUND ${widget.turnCount}", style: const TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, letterSpacing: 2)),
                 const SizedBox(height: 4),
                 Row(
                    children: [
                       Icon(Icons.person, size: 12, color: widget.isMyTurn ? Colors.greenAccent : Colors.white54),
                       const SizedBox(width: 4),
                       Text(widget.activePlayerName, style: TextStyle(color: widget.isMyTurn ? Colors.greenAccent : Colors.white70, fontSize: 12)),
                    ],
                 )
              ],
           ),
           
           const Spacer(),
           
           // Timer
           Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                 color: Colors.white10,
                 borderRadius: BorderRadius.circular(20)
              ),
              child: Row(
                 children: [
                    const Icon(Icons.timer, color: iconColor, size: 16),
                    const SizedBox(width: 8),
                    Text(_formatTime(), style: TextStyle(color: timerColor, fontFamily: "monospace"))
                 ],
              ),
           ),
           
           const Spacer(),
           
            // Settings / Pause / Exit
            Row(
               children: [
                   IconButton(
                      onPressed: widget.onPause, 
                      icon: const Icon(Icons.settings, color: Colors.white70),
                      tooltip: "Settings",
                   ),
                   if (widget.onExit != null)
                      IconButton(
                        onPressed: widget.onExit,
                        icon: const Icon(Icons.meeting_room, color: Colors.redAccent),
                        tooltip: "Exit Game",
                      )
               ],
            )
        ],
      ),
    );
  }
}
