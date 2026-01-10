import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class SplendorTheme {
  Color get background;
  Color get primary;
  Color get secondary;
  Color get surface;
  Color get onBackground;
  Color get onSurface;
  
  // Gem Colors
  Color get gemRuby;
  Color get gemSapphire;
  Color get gemEmerald;
  Color get gemDiamond;
  Color get gemOnyx;
  Color get gemGold;

  ThemeData get themeData;
}

class DarkSplendorTheme extends SplendorTheme {
  @override
  Color get background => const Color(0xFF121212); // Obsidian
  @override
  Color get primary => const Color(0xFFD4AF37); // Classic Gold
  @override
  Color get secondary => const Color(0xFF2C2C2C);
  @override
  Color get surface => const Color(0xFF1E1E1E);
  @override
  Color get onBackground => Colors.white;
  @override
  Color get onSurface => Colors.white;

  @override
  Color get gemRuby => const Color(0xFFE0115F);
  @override
  Color get gemSapphire => const Color(0xFF0F52BA);
  @override
  Color get gemEmerald => const Color(0xFF50C878);
  @override
  Color get gemDiamond => const Color(0xFFE0E0E0); // White/Silver
  @override
  Color get gemOnyx => const Color(0xFF353935);
  @override
  Color get gemGold => const Color(0xFFFFD700);

  @override
  ThemeData get themeData => ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: background,
    primaryColor: primary,
    colorScheme: ColorScheme.dark(
      primary: primary,
      secondary: secondary,
      surface: surface,

    ),
    textTheme: GoogleFonts.cinzelTextTheme(ThemeData.dark().textTheme),
    useMaterial3: true,
  );
}

class LightSplendorTheme extends SplendorTheme {
  @override
  Color get background => const Color(0xFFF5F5F5); // White Marble
  @override
  Color get primary => const Color(0xFFB8860B); // Dark Goldenrod
  @override
  Color get secondary => const Color(0xFFFFFFFF);
  @override
  Color get surface => const Color(0xFFEEEEEE);
  @override
  Color get onBackground => Colors.black;
  @override
  Color get onSurface => Colors.black;

  @override
  Color get gemRuby => const Color(0xFFC21807);
  @override
  Color get gemSapphire => const Color(0xFF0067A5);
  @override
  Color get gemEmerald => const Color(0xFF009E60);
  @override
  Color get gemDiamond => const Color(0xFFB9F2FF);
  @override
  Color get gemOnyx => const Color(0xFF000000);
  @override
  Color get gemGold => const Color(0xFFDA9100);

  @override
  ThemeData get themeData => ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: background,
    primaryColor: primary,
    colorScheme: ColorScheme.light(
      primary: primary,
      secondary: secondary,
      surface: surface,

    ),
    textTheme: GoogleFonts.cinzelTextTheme(ThemeData.light().textTheme),
    useMaterial3: true,
  );
}
