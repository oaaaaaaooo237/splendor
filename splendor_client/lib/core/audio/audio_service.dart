import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../persistence/settings_service.dart';

// CONTEXT:
// Global Variables: audioServiceProvider
// Libraries: audioplayers, flutter_riverpod, settings_service.dart

class AudioService {
  final Ref _ref;
  final AudioPlayer _bgmPlayer = AudioPlayer();
  final AudioPlayer _sfxPlayer = AudioPlayer(); // For simple SFX
  
  // BGM Playlist
  final List<String> _bgmPlaylist = [
    'audio/music/bgm_1.mp3',
    'audio/music/bgm_2.mp3', 
    'audio/music/bgm_3.mp3'
  ];
  
  int _currentBgmIndex = 0;
  bool _isPlaying = false;
  
  AudioService(this._ref) {
    _init();
  }
  
  void _init() async {
    // Set initial volumes
    final settings = await _ref.read(settingsServiceProvider).loadAudioSettings();
    await _bgmPlayer.setVolume(settings.bgm);
    await _sfxPlayer.setVolume(settings.sfx);
    
    // Setup BGM Loop / Playlist
    _bgmPlayer.onPlayerComplete.listen((_) {
      if (_isPlaying) {
        _playNextBgm();
      }
    });
  }
  
  Future<void> updateVolumes() async {
    final settings = await _ref.read(settingsServiceProvider).loadAudioSettings();
    await _bgmPlayer.setVolume(settings.bgm);
    await _sfxPlayer.setVolume(settings.sfx);
  }

  void playMainMenuBgm() {
    // Should ideally be different from game BGM, but for now reuse or pick specific
    _playBgm('audio/music/menu_theme.mp3');
  }
  
  void playGameBgm() {
    _isPlaying = true;
    _playNextBgm();
  }
  
  void _playNextBgm() async {
    if (_bgmPlaylist.isEmpty) return;
    
    // Pick random or sequence? User said "loop or random". Let's do Shuffle once or Random pick.
    _currentBgmIndex = Random().nextInt(_bgmPlaylist.length);
    final path = _bgmPlaylist[_currentBgmIndex];
    
    _playBgm(path);
  }
  
  void _playBgm(String path) async {
    try {
      await _bgmPlayer.play(AssetSource(path));
    } catch (e) {
      print("Error playing BGM $path: $e");
    }
  }

  void stopBgm() async {
    _isPlaying = false;
    await _bgmPlayer.stop();
  }
  
  // SFX Methods
  void playSfx(String type) async {
    String? path;
    switch (type) {
      case 'click': path = 'audio/sfx/click.mp3'; break;
      case 'take_gem': path = 'audio/sfx/gem_clink.mp3'; break;
      case 'buy_card': path = 'audio/sfx/card_flip.mp3'; break;
      case 'reserve': path = 'audio/sfx/reserve.mp3'; break;
      case 'victory': path = 'audio/sfx/victory.mp3'; break;
      case 'noble': path = 'audio/sfx/noble_fanfare.mp3'; break;
    }
    
    if (path != null) {
      try {
        // Use Soundpool logic or overlapping players for rapid SFX?
        // AudioPlayers 'mode: PlayerMode.lowLatency' is good.
        // For simplicity creating new player or reusing.
        // Reusing _sfxPlayer might cut off previous sound.
        // Ideally use a pool. For MVP, just fire and forget on a transient player if needed, or use the main one.
        // Let's try explicit player for each sfx if we want overlap, but that's expensive.
        // Let's stick to single channel for now or simple loose fire.
        await _sfxPlayer.play(AssetSource(path));
      } catch (e) {
         print("Error playing SFX $path: $e");
      }
    }
  }
}

final audioServiceProvider = Provider<AudioService>((ref) {
  return AudioService(ref);
});
