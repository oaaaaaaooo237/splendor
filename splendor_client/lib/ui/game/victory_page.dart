class VictoryPage extends StatelessWidget {
  final PlayerState winner;
  final VoidCallback? onRestart; // If null, implies "Return to Room" context
  
  const VictoryPage({super.key, required this.winner, this.onRestart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/ui/board_bg.png', 
            fit: BoxFit.cover,
            opacity: const AlwaysStoppedAnimation(0.3),
          ),
          
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.emoji_events, size: 100, color: Colors.amber)
                  .animate()
                  .scale(duration: 600.ms, curve: Curves.elasticOut)
                  .shimmer(delay: 600.ms, duration: 1000.ms),
                  
                const SizedBox(height: 20),
                
                const Text("VICTORY!", style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.amber, letterSpacing: 4))
                  .animate().fadeIn().slideY(begin: 0.5, end: 0),
                  
                const SizedBox(height: 20),
                
                Text(winner.playerId, style: const TextStyle(fontSize: 24, color: Colors.white70)) 
                   .animate().fadeIn(delay: 300.ms),
                   
                const SizedBox(height: 10),
                
                Text("${winner.score} Points", style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white))
                   .animate().fadeIn(delay: 500.ms),
                   
                const SizedBox(height: 60),
                
                // BUTTONS ROW
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // PRIMARY ACTION: RESTART or BACK TO ROOM
                    ElevatedButton.icon(
                      onPressed: () {
                         if (onRestart != null) {
                           Navigator.pop(context); // Close VictoryPage
                           onRestart!(); // Trigger restart in GamePage
                         } else {
                           Navigator.pop(context); // Just close (Return to Room/Lobby that pushed GamePage)
                         }
                      }, 
                      icon: Icon(onRestart != null ? Icons.refresh : Icons.meeting_room),
                      label: Text(onRestart != null ? "PLAY AGAIN" : "RETURN TO ROOM"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                        textStyle: const TextStyle(fontWeight: FontWeight.bold)
                      ),
                    ),
                    
                    const SizedBox(width: 20),
                    
                    // SECONDARY ACTION: HOME
                    OutlinedButton.icon(
                      onPressed: () {
                         Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (_) => const MainMenuPage()),
                            (route) => false
                         );
                      },
                      icon: const Icon(Icons.home),
                      label: const Text("MAIN MENU"),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: Colors.white54),
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      ),
                    ),
                  ],
                ).animate().fadeIn(delay: 800.ms).scale(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
