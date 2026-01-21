import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TargetScoreSelector extends StatelessWidget {
  final int targetScore;
  final ValueChanged<int> onChanged;

  const TargetScoreSelector({
    super.key,
    required this.targetScore,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    // Determine if current score is one of the presets
    final isCustom = ![10, 15, 20].contains(targetScore);
    
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
          const Icon(Icons.flag, color: Colors.amber, size: 20),
          const SizedBox(width: 12),
          const Text("Victory Condition:", style: TextStyle(color: Colors.white70)),
          const SizedBox(width: 12),
          DropdownButton<int>(
            value: isCustom ? -1 : targetScore,
            dropdownColor: Colors.grey[900],
            style: const TextStyle(color: Colors.white),
            underline: Container(),
            icon: const Icon(Icons.arrow_drop_down, color: Colors.white70),
            items: const [
              DropdownMenuItem(value: 10, child: Text("10 Points (Short)")),
              DropdownMenuItem(value: 15, child: Text("15 Points (Standard)")),
              DropdownMenuItem(value: 20, child: Text("20 Points (Long)")),
              DropdownMenuItem(value: -1, child: Text("Custom...")),
            ],
            onChanged: (val) {
              if (val != null) {
                if (val == -1) {
                  _showCustomScoreDialog(context);
                } else {
                  onChanged(val);
                }
              }
            },
          ),
          if (isCustom) ...[
             const SizedBox(width: 8),
             Text("($targetScore)", style: const TextStyle(color: Colors.amber)),
          ]
        ],
      ),
    );
  }

  void _showCustomScoreDialog(BuildContext context) {
     final controller = TextEditingController(text: targetScore.toString());
     showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
           backgroundColor: Colors.blueGrey[900],
           title: const Text("Custom Score", style: TextStyle(color: Colors.white)),
           content: TextField(
              controller: controller,
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                 labelText: "Points to Win",
                 labelStyle: TextStyle(color: Colors.white70),
                 enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white30))
              ),
           ),
           actions: [
              TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("Cancel")),
              ElevatedButton(
                 onPressed: () {
                    final val = int.tryParse(controller.text);
                    if (val != null && val > 0) {
                       onChanged(val);
                    }
                    Navigator.pop(ctx);
                 }, 
                 child: const Text("Set")
              )
           ],
        )
     );
  }
}
