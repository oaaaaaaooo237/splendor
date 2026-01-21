import 'package:flutter/material.dart';

class TurnDurationSelector extends StatelessWidget {
  final int currentDuration; // -1 for Unlimited
  final ValueChanged<int> onChanged;

  const TurnDurationSelector({
    super.key,
    required this.currentDuration,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white24),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.timer, color: Colors.amber, size: 20),
          const SizedBox(width: 12),
          const Text("Turn Duration:", style: TextStyle(color: Colors.white70)),
          const SizedBox(width: 12),
          DropdownButton<int>(
            value: currentDuration,
            dropdownColor: Colors.grey[900],
            style: const TextStyle(color: Colors.white),
            underline: Container(), // Remove default underline
            icon: const Icon(Icons.arrow_drop_down, color: Colors.white70),
            items: const [
              DropdownMenuItem(value: 30, child: Text("30s (Fast)")),
              DropdownMenuItem(value: 60, child: Text("60s (Normal)")),
              DropdownMenuItem(value: 90, child: Text("90s (Relaxed)")),
              DropdownMenuItem(value: 120, child: Text("120s (Slow)")),
              DropdownMenuItem(value: -1, child: Text("Unlimited")),
            ],
            onChanged: (val) {
              if (val != null) onChanged(val);
            },
          ),
        ],
      ),
    );
  }
}
