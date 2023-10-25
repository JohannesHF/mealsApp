import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/screen/tabs.dart';

final kColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 131, 57, 0),
);

final kTextScheme = GoogleFonts.latoTextTheme();

final theme = ThemeData(
    useMaterial3: true,
    colorScheme: kColorScheme,
    textTheme: kTextScheme,
    dialogTheme: const DialogTheme().copyWith(
      backgroundColor: kColorScheme.secondaryContainer,
    ),
    inputDecorationTheme: const InputDecorationTheme()
        .copyWith());

void main() {
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: theme, home: const TabsScreen());
  }
}
