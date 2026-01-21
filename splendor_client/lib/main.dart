import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'ui/welcome/welcome_page.dart';
import 'core/providers/identity_loader.dart';
import 'core/providers/theme_provider.dart';

import 'package:window_manager/window_manager.dart';
import 'ui/shell/frameless_window.dart';
import 'dart:io'; // Import for HttpOverrides

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Allow self-signed certificates for local NAS testing
  HttpOverrides.global = MyHttpOverrides();
  
  // Configure Window (Window Manager)
  await windowManager.ensureInitialized();
  
  WindowOptions windowOptions = const WindowOptions(
    size: Size(1100, 700),
    minimumSize: Size(960, 600),
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.hidden,
  );
  
  await windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).then((_) {
    runApp(const ProviderScope(child: SplendorApp()));
  });
}

class SplendorApp extends ConsumerWidget {
  const SplendorApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loader = ref.watch(identityLoaderProvider);
    final appTheme = ref.watch(appThemeProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Splendor Private Cloud',
      theme: appTheme.themeData,
      builder: (context, child) {
         // Wrap content in frameless shell
         return FramelessWindow(child: child!);
      },
      home: loader.when(
        data: (_) => const WelcomePage(),
        loading: () => const Scaffold(backgroundColor: Color(0xFF121212), body: Center(child: CircularProgressIndicator())),
        error: (e, st) => const WelcomePage(),
      ),
    );
  }
}
