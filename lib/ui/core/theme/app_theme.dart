import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTheme {
  const AppTheme();

  static ThemeData getData({required bool isDark}) {
    final ThemeData theme;
    final Brightness brightness;
    if (isDark) {
      brightness = Brightness.dark;
      theme = ThemeData.dark(useMaterial3: true);
    } else {
      brightness = Brightness.light;
      theme = ThemeData.light(useMaterial3: true);
    }

    return theme.copyWith(
      brightness: brightness,
      colorScheme: ColorScheme.fromSeed(
        brightness: brightness,
        seedColor: const Color(0xFF272A3F),
      ),
      textTheme: GoogleFonts.interTextTheme(theme.textTheme).copyWith(
        bodySmall: const TextStyle(fontSize: 12),
        bodyMedium: const TextStyle(fontSize: 14),
        bodyLarge: const TextStyle(fontSize: 16),
        titleSmall: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        titleMedium: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        titleLarge: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        headlineSmall: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        headlineLarge: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
