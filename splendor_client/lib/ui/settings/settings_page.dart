import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/audio/audio_service.dart';
import '../../core/providers/theme_provider.dart';
import '../../core/providers/visual_settings_provider.dart';
import '../../core/providers/server_config_provider.dart';
import 'package:http/http.dart' as http;

// CONTEXT:
// Purpose: User settings for Audio, Theme, and Network.
// Logic: Uses Providers (AudioService, ThemeProvider, ServerConfig) for state.

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
            // VISUAL & AUDIO SECTION (Unified)
            Consumer(
              builder: (context, ref, _) {
                 final settings = ref.watch(visualSettingsProvider);
                 final notifier = ref.read(visualSettingsProvider.notifier);
                 
                 return Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                      const _SectionHeader("AUDIO & VISUAL"),
                      
                      // Music Volume
                      _VolumeSlider(
                         label: "Music Volume",
                         value: settings.bgmVolume,
                         onChanged: (v) => notifier.updateBgmVolume(v)
                      ),
                      
                      const SizedBox(height: 16),

                      // SFX Volume
                      _VolumeSlider(
                         label: "Sound Effects",
                         value: settings.sfxVolume,
                         onChanged: (v) => notifier.updateSfxVolume(v)
                      ),

                      const SizedBox(height: 16),

                      // Visual Effects
                      SwitchListTile(
                        title: const Text("Enable Animations", style: TextStyle(color: Colors.white70)),
                        subtitle: const Text("Particles and visual flair", style: TextStyle(color: Colors.white30, fontSize: 12)),
                        value: settings.enableEffects,
                        onChanged: (v) => notifier.toggle(v),
                        activeColor: Colors.amber,
                        contentPadding: EdgeInsets.zero,
                      ),
                   ],
                 );
              }
            ),
            
            const Divider(color: Colors.white24, height: 40),

            const _SectionHeader("APP THEME"),
            Consumer(
              builder: (context, ref, _) {
                 final themeMode = ref.watch(themeProvider); 
                 return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                       _ThemeOption("Dark", Colors.black, themeMode == ThemeMode.dark, () => ref.read(themeProvider.notifier).setTheme(ThemeMode.dark)),
                       _ThemeOption("Light", Colors.white, themeMode == ThemeMode.light, () => ref.read(themeProvider.notifier).setTheme(ThemeMode.light)),
                       _ThemeOption("System", Colors.grey, themeMode == ThemeMode.system, () => ref.read(themeProvider.notifier).setTheme(ThemeMode.system)),
                    ],
                 );
              }
            ),

            const Divider(color: Colors.white24, height: 40),

            const _SectionHeader("NETWORK"),
            Consumer(
               builder: (context, ref, _) {
                  final serverUrl = ref.watch(serverConfigProvider);
                  return Column(
                     children: [
                        TextFormField(
                           initialValue: serverUrl,
                           style: const TextStyle(color: Colors.white),
                           decoration: const InputDecoration(
                              labelText: "Server Address",
                              labelStyle: TextStyle(color: Colors.white54),
                              helperText: "Format: http://ip:port",
                              helperStyle: TextStyle(color: Colors.white30),
                              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white24)),
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
                              prefixIcon: Icon(Icons.dns, color: Colors.white54),
                           ),
                           onFieldSubmitted: (v) => ref.read(serverConfigProvider.notifier).setUrl(v),
                        ),
                        const SizedBox(height: 8),
                        Align(
                           alignment: Alignment.centerRight,
                           child: TextButton.icon(
                              onPressed: () async {
                                 final url = ref.read(serverConfigProvider);
                                 try {
                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Connecting...")));
                                    final response = await http.get(Uri.parse("$url/health")); 
                                    if (response.statusCode == 200 || response.statusCode == 404) {
                                       ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Success: Server Reachable!"), backgroundColor: Colors.green));
                                    } else {
                                       throw "Status ${response.statusCode}";
                                    }
                                 } catch (e) {
                                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed: $e"), backgroundColor: Colors.red));
                                 }
                              }, 
                              icon: const Icon(Icons.wifi_find),
                              label: const Text("Test Connection")
                           ),
                        )
                     ],
                  );
               }
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

class _ThemeOption extends StatelessWidget {
   final String label;
   final Color color;
   final bool isSelected;
   final VoidCallback onTap;
   
   const _ThemeOption(this.label, this.color, this.isSelected, this.onTap);

   @override
   Widget build(BuildContext context) {
      return GestureDetector(
         onTap: onTap,
         child: Column(
            children: [
               Container(
                  width: 48, height: 48,
                  decoration: BoxDecoration(
                     color: color,
                     border: Border.all(color: isSelected ? Colors.amber : Colors.white24, width: isSelected ? 3 : 1),
                     borderRadius: BorderRadius.circular(24),
                     boxShadow: isSelected ? [BoxShadow(color: Colors.amber.withOpacity(0.4), blurRadius: 8)] : []
                  ),
                  child: isSelected ? const Icon(Icons.check, color: Colors.amber, size: 28) : null,
               ),
               const SizedBox(height: 8),
               Text(label, style: TextStyle(color: isSelected ? Colors.amber : Colors.white54, fontWeight: isSelected ? FontWeight.bold : FontWeight.normal))
            ],
         ),
      );
   }
}
