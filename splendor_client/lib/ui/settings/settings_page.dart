import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/audio/audio_service.dart';
import '../../core/providers/visual_settings_provider.dart';

// CONTEXT:
// Purpose: User settings for Audio (and potential Theme/Language later).
// Logic: Reads/Writes volume via AudioService.

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final audio = ref.watch(audioServiceProvider);
    
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(title: const Text("Settings"), backgroundColor: Colors.transparent, elevation: 0),
      body: ListView(
         padding: const EdgeInsets.all(16),
         children: [
            const _SectionHeader("AUDIO"),
            
            // BGM Volume
            _VolumeSlider(
               label: "Music Volume",
               value: audio.bgmVolume,
               onChanged: (v) => ref.read(audioServiceProvider).setBgmVolume(v)
            ),
            
            // SFX Volume
             _VolumeSlider(
               label: "Sound Effects",
               value: audio.sfxVolume,
               onChanged: (v) => ref.read(audioServiceProvider).setSfxVolume(v)
            ),
            
            const Divider(color: Colors.white24, height: 40),

            const _SectionHeader("VISUAL"),
            SwitchListTile(
              title: const Text("Enable Animations", style: TextStyle(color: Colors.white70)),
              subtitle: const Text("Toggle global visual effects", style: TextStyle(color: Colors.white30, fontSize: 12)),
              value: ref.watch(visualSettingsProvider),
              onChanged: (v) => ref.read(visualSettingsProvider.notifier).toggle(v),
              activeColor: Colors.amber,
              contentPadding: EdgeInsets.zero,
            ),
            
            const Divider(color: Colors.white24, height: 40),
            
            const _SectionHeader("ABOUT"),
            const ListTile(
               title: Text("Splendor Private Cloud", style: TextStyle(color: Colors.white)),
               subtitle: Text("Version 3.2.0 (Alpha)", style: TextStyle(color: Colors.grey)),
               leading: Icon(Icons.info_outline, color: Colors.amber),
            ),
         ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
   final String title;
   const _SectionHeader(this.title);
   
   @override
   Widget build(BuildContext context) {
      return Padding(
         padding: const EdgeInsets.only(bottom: 16, top: 8),
         child: Text(title, style: const TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
      );
   }
}

class _VolumeSlider extends StatelessWidget {
   final String label;
   final double value;
   final ValueChanged<double> onChanged;
   
   const _VolumeSlider({required this.label, required this.value, required this.onChanged});
   
   @override
   Widget build(BuildContext context) {
      return Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
            Text(label, style: const TextStyle(color: Colors.white70)),
            Row(
               children: [
                  const Icon(Icons.volume_mute, color: Colors.white54, size: 20),
                  Expanded(
                     child: Slider(
                        value: value,
                        onChanged: onChanged,
                        activeColor: Colors.amber,
                        inactiveColor: Colors.white10,
                     ),
                  ),
                  const Icon(Icons.volume_up, color: Colors.white, size: 20),
               ],
            )
         ],
      );
   }
}
