import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

// CONTEXT:
// Global Variables: None
// Libraries: flutter, flutter_animate

class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({super.key});
  
  // Mock Data
  static const _mockData = [
    {'rank': 1, 'name': 'SplendorMaster', 'score': 2500, 'avatar': 'avatar_3'},
    {'rank': 2, 'name': 'GemCollector', 'score': 2350, 'avatar': 'avatar_1'},
    {'rank': 3, 'name': 'NobleKing', 'score': 2100, 'avatar': 'avatar_5'},
    {'rank': 4, 'name': 'Bot_Hard', 'score': 1950, 'avatar': 'avatar_8'},
    {'rank': 5, 'name': 'Rookie', 'score': 1200, 'avatar': 'avatar_2'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LEADERBOARD"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.background,
              Colors.black87,
            ],
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.fromLTRB(20, 100, 20, 20),
          itemCount: _mockData.length,
          itemBuilder: (context, index) {
            final item = _mockData[index];
            final rank = item['rank'] as int;
            final isTop3 = rank <= 3;
            
            return Card(
              color: Colors.white.withOpacity(0.05),
              margin: const EdgeInsets.only(bottom: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                  color: isTop3 ? Colors.amber.withOpacity(0.5) : Colors.transparent, 
                  width: 1
                )
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: isTop3 ? Colors.amber : Colors.grey[800],
                  foregroundColor: isTop3 ? Colors.black : Colors.white,
                  child: Text("#$rank"),
                ),
                title: Text(
                  item['name'] as String,
                  style: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
                ),
                trailing: Text(
                  "${item['score']} PTS",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ).animate().fadeIn(delay: (index * 100).ms).slideX();
          },
        ),
      ),
    );
  }
}
