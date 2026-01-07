import 'dart:math';

class BotNameGenerator {
  static const List<String> _pool = [
    'ALPHA', 'OMEGA', 'TITAN', 'NEO', 'ZEUS', 'HERA', 'APOLLO', 'ARES',
    'ATLAS', 'CHRONOS', 'HYPERION', 'OCEANUS', 'PROMETHEUS', 'RHEA', 'THEIA',
    'URANUS', 'GAIA', 'HADES', 'POSEIDON', 'ARTEMIS', 'ATHENA', 'DEMETER',
    'DIONYSUS', 'HEPHAESTUS', 'HERMES', 'HESTIA', 'PERSEPHONE', 'EROS', 'NIKE',
    'HELIOS', 'SELENE', 'EOS', 'BOREAS', 'ZEPHYRUS', 'NOTUS', 'EURUS',
    'TRITON', 'NEREUS', 'PROTEUS', 'THAUMAS', 'PHORCYS', 'CETO', 'EURYBIA',
    'ASTERIA', 'PALLAS', 'PERSES', 'STYX', 'CHARON', 'CERBERUS', 'HYDRA'
  ];

  static String getNextName(List<String> excludedNames) {
    final available = _pool.where((n) => !excludedNames.contains(n)).toList();
    if (available.isEmpty) {
      // Fallback
      return 'BOT-${Random().nextInt(9999)}';
    }
    return available[Random().nextInt(available.length)];
  }
  
  static String formatName(String name) {
    return "$name (BOT)";
  }
}
