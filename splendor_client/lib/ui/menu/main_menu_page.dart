import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/providers/identity_provider.dart';
import '../../core/audio/audio_service.dart';
import '../lobby/lobby_page.dart';
import '../settings/settings_page.dart';
import '../leaderboard/leaderboard_page.dart';

// CONTEXT:
// Global Variables: None
// Libraries: flutter, riverpod, animate, identity_provider

class MainMenuPage extends ConsumerStatefulWidget {
  const MainMenuPage({super.key});

  @override
  ConsumerState<MainMenuPage> createState() => _MainMenuPageState();
}

class _MainMenuPageState extends ConsumerState<MainMenuPage> {
  @override
  void initState() {
    super.initState();
    // Delay slightly to ensure provider is ready or just call it
    Future.microtask(() => ref.read(audioServiceProvider).playMainMenuBgm());
  }

  @override
  Widget build(BuildContext context) {
    final identity = ref.watch(identityProvider);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black,
              Theme.of(context).scaffoldBackgroundColor,
              Colors.black,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Header / Logo
              Image.asset(
                'assets/images/ui/logo.png',
                height: 180,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => const Text(
                  'SPLENDOR',
                  style: TextStyle(
                    fontSize: 56, 
                    fontWeight: FontWeight.bold, 
                    letterSpacing: 8,
                    color: Colors.white,
                    shadows: [BoxShadow(color: Colors.amber, blurRadius: 20, spreadRadius: 5)]
                  ),
                ),
              ).animate().fadeIn(duration: 1.seconds).shimmer(),
              
              const SizedBox(height: 8),
              Text(
                'PVT CLOUD EDITION',
                style: TextStyle(
                  fontSize: 14, 
                  letterSpacing: 6, 
                  color: Colors.white.withValues(alpha: 0.5)
                ),
              ).animate().fadeIn(delay: 500.ms),

              const SizedBox(height: 80),

              // Menu Items
              _MenuButton(
                label: "开始游戏",
                icon: Icons.play_arrow_rounded,
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const LobbyPage())),
                delay: 600.ms,
              ),
              const SizedBox(height: 20),
              
              _MenuButton(
                label: "排行榜",
                icon: Icons.leaderboard_rounded,
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const LeaderboardPage())),
                delay: 700.ms,
              ),
              const SizedBox(height: 20),

              _MenuButton(
                label: "设置",
                icon: Icons.settings_rounded,
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsPage())),
                delay: 800.ms,
              ),
              
              const SizedBox(height: 20),
              
              // Identity / Profile Mini-View
              if (identity?.name != null)
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Chip(
                    avatar: CircleAvatar(child: Icon(Icons.person, size: 16)),
                    label: Text(identity!.name, style: const TextStyle(letterSpacing: 2)),
                    backgroundColor: Colors.white10,
                  ).animate().fadeIn(delay: 1.seconds),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;
  final Duration delay;

  const _MenuButton({
    required this.label,
    required this.icon,
    required this.onPressed,
    required this.delay,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      height: 60,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white.withValues(alpha: 0.05),
          foregroundColor: Colors.white,
          side: BorderSide(color: Colors.white.withValues(alpha: 0.1)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Theme.of(context).colorScheme.primary),
            const SizedBox(width: 16),
            Text(
              label, 
              style: const TextStyle(fontSize: 16, letterSpacing: 4, fontWeight: FontWeight.bold)
            ),
          ],
        ),
      ),
    ).animate().fadeIn(delay: delay).slideX(begin: -0.1, end: 0);
  }
}
