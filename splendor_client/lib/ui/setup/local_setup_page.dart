import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:splendor_shared/splendor_shared.dart';
import '../game/game_page.dart';
import '../widgets/turn_duration_selector.dart';
import '../widgets/target_score_selector.dart';


class LocalGameSetupPage extends ConsumerStatefulWidget {
  const LocalGameSetupPage({super.key});

  @override
  ConsumerState<LocalGameSetupPage> createState() => _LocalGameSetupPageState();
}

class _LocalGameSetupPageState extends ConsumerState<LocalGameSetupPage> {
  final List<PlayerIdentity> _players = [];
  final int _maxPlayers = 4;

  @override
  void initState() {
    super.initState();
    // Default setup: 1 Human, 1 Bot
    _addHumanPlayer();
    _addBotPlayer();
  }

  void _addHumanPlayer() {
    if (_players.length >= _maxPlayers) return;
    
    final newIndex = _players.length;
    setState(() {
      _players.add(PlayerIdentity(
        uuid: "human_${DateTime.now().millisecondsSinceEpoch}",
        name: "Player ${_players.length + 1}",
        avatarId: "avatar_1",
        isBot: false,
      ));
    });
    
    // Valid UX: Prompt for name immediately after adding
    WidgetsBinding.instance.addPostFrameCallback((_) {
       _editPlayer(newIndex);
    });
  }

  void _addBotPlayer() {
    if (_players.length >= _maxPlayers) return;
    setState(() {
      _players.add(PlayerIdentity(
        uuid: "bot_${DateTime.now().millisecondsSinceEpoch}",
        name: "Bot ${_players.length + 1}",
        avatarId: "avatar_2",
        isBot: true,
      ));
    });
  }

  void _removePlayer(int index) {
    setState(() {
      _players.removeAt(index);
    });
  }

  void _editPlayer(int index) {
    final p = _players[index];
    if (p.isBot) {
      _showBotDifficultyDialog(index);
    } else {
      _showHumanNameDialog(index);
    }
  }

  void _showHumanNameDialog(int index) {
    TextEditingController controller = TextEditingController(text: _players[index].name);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: Colors.blueGrey[900],
        title: const Text("Edit Name", style: TextStyle(color: Colors.white)),
        content: TextField(
          controller: controller,
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            labelText: "Name",
            labelStyle: TextStyle(color: Colors.white70),
            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white30))
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("Cancel")),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _players[index] = _players[index].copyWith(name: controller.text);
              });
              Navigator.pop(ctx);
            },
            child: const Text("Save"),
          )
        ],
      ),
    );
  }

  void _showBotDifficultyDialog(int index) {
    showDialog(
      context: context,
      builder: (ctx) => SimpleDialog(
        backgroundColor: Colors.blueGrey[900],
        title: const Text("Select Difficulty", style: TextStyle(color: Colors.white)),
        children: [
          _buildDiffOption(ctx, index, "Easy", "EASY BOT"),
          _buildDiffOption(ctx, index, "Standard", "STD BOT"),
          _buildDiffOption(ctx, index, "Hard", "HARD BOT"),
        ],
      )
    );
  }

  Widget _buildDiffOption(BuildContext ctx, int index, String label, String prefix) {
    return SimpleDialogOption(
      onPressed: () {
        setState(() {
          // Update name to reflect difficulty (Simple approach for now, usually we'd store a difficulty property)
          // Since PlayerIdentity doesn't have difficulty field, we encode it in name or just keep name distinctive
          _players[index] = _players[index].copyWith(name: "$prefix ${index + 1}");
        });
        Navigator.pop(ctx);
      },
      child: Text(label, style: const TextStyle(color: Colors.white70, fontSize: 16)),
    );
  }

  int _turnDuration = 60; // Default to 60s
  int _targetScore = 15; // Default to 15 points

  void _startGame() {
    if (_players.length < 2) return;
    Navigator.push(context, MaterialPageRoute(builder: (_) => GamePage(
      players: _players,
      turnDuration: _turnDuration,
      targetScore: _targetScore,
    )));
  }

  @override
  Widget build(BuildContext context) {
    bool canStart = _players.length >= 2;
    bool canAdd = _players.length < _maxPlayers;

    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("本地游戏设置 (Local Game)", style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _players.length,
                itemBuilder: (context, index) {
                  final p = _players[index];
                  String subtitle = "Human Player";
                  if (p.isBot) {
                     // Parse difficulty from name for display or keep simple
                     subtitle = "Bot"; 
                     if (p.name.contains("EASY")) subtitle = "Bot (Easy)";
                     if (p.name.contains("HARD")) subtitle = "Bot (Hard)";
                     if (p.name.contains("STD")) subtitle = "Bot (Standard)";
                  }

                  return Card(
                    color: Colors.white10,
                    margin: const EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      leading: Icon(p.isBot ? Icons.computer : Icons.person, color: Colors.amber),
                      title: Text(p.name, style: const TextStyle(color: Colors.white)),
                      subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey)),
                      trailing: IconButton(
                        icon: const Icon(Icons.close, color: Colors.redAccent),
                        onPressed: () => _removePlayer(index),
                      ),
                      onTap: () => _editPlayer(index),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            // Actions Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: canAdd ? _addHumanPlayer : null,
                  icon: const Icon(Icons.person_add),
                  label: const Text("添加人类"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                ),
                ElevatedButton.icon(
                  onPressed: canAdd ? _addBotPlayer : null,
                  icon: const Icon(Icons.smart_toy),
                  label: const Text("添加电脑"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            // Settings Row (Duration & Score)
            Row(
              children: [
                Expanded(
                  child: TurnDurationSelector(
                    currentDuration: _turnDuration,
                    onChanged: (val) => setState(() => _turnDuration = val),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TargetScoreSelector(
                    targetScore: _targetScore,
                    onChanged: (val) => setState(() => _targetScore = val),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: canStart ? _startGame : null,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                  backgroundColor: canStart ? Colors.amber : Colors.grey[800],
                ),
                child: const Text("开始游戏 (Start Game)", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
