import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ui/welcome/welcome_page.dart';
import 'ui/lobby/lobby_page.dart';
import 'core/providers/identity_loader.dart';
import 'core/providers/identity_provider.dart';
import 'core/providers/theme_provider.dart';

void main() {
  runApp(const ProviderScope(child: SplendorApp()));
}

class SplendorApp extends ConsumerWidget {
  const SplendorApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loader = ref.watch(identityLoaderProvider);
    final appTheme = ref.watch(appThemeProvider);

    return MaterialApp(
      title: 'Splendor Private Cloud',
      theme: appTheme.themeData,
      home: const WelcomePage(),
        loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
        error: (e, st) => const WelcomePage(), // Fallback
      ),
    );
  }
}
