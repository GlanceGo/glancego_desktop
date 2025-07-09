import 'dart:io';

import 'package:flutter/material.dart';
import 'package:glancego/domain/enums/window_effect_enum.dart';
import 'package:glancego/ui/core/theme/app_theme_colors.dart';
import 'package:glancego/ui/core/theme/app_theme_inherited.dart';
import 'package:glancego/ui/core/theme/app_theme_metrics.dart';
import 'package:glancego/ui/core/theme/colors/acrylic_app_theme_colors.dart';
import 'package:glancego/ui/core/theme/colors/solid_app_theme_colors.dart';
import 'package:glancego/ui/core/theme/metrics/linux_app_theme_metrics.dart';
import 'package:glancego/ui/core/theme/metrics/macos_app_theme_metrics.dart';
import 'package:glancego/ui/core/theme/metrics/windows_app_theme_metrics.dart';
import 'package:google_fonts/google_fonts.dart';

final class AppTheme {
  const AppTheme({required this.context});

  final BuildContext context;

  ThemeData getData({required bool isDark}) {
    final inherited = AppThemeInherited.of(context);

    final ThemeData theme;
    final Brightness brightness;
    final AppThemeColors colors;
    final AppThemeMetrics metrics;
    final ColorScheme colorScheme;

    if (isDark) {
      brightness = Brightness.dark;
      theme = ThemeData.dark(useMaterial3: true);
      colorScheme = _getColorScheme(
        brightness: brightness,
        colorScheme: inherited.dark,
      );
    } else {
      brightness = Brightness.light;
      theme = ThemeData.light(useMaterial3: true);
      colorScheme = _getColorScheme(
        brightness: brightness,
        colorScheme: inherited.light,
      );
    }

    if (Platform.isMacOS) {
      metrics = const MacOSAppThemeMetrics();
    } else if (Platform.isWindows) {
      metrics = const WindowsAppThemeMetrics();
    } else {
      metrics = const LinuxAppThemeMetrics();
    }

    if (metrics.window.effect == WindowEffectEnum.acrylic) {
      colors = AcrylicAppThemeColors(colorScheme: colorScheme);
    } else {
      colors = SolidAppThemeColors(colorScheme: colorScheme);
    }

    return theme.copyWith(
      brightness: brightness,
      colorScheme: colorScheme,
      extensions: [colors, metrics],
      textTheme: GoogleFonts.interTextTheme(theme.textTheme).copyWith(
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: colors.onBackground,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: colors.onBackground,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: colors.onBackground,
        ),
        titleSmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: colors.onBackground,
        ),
        titleMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: colors.onBackground,
        ),
        titleLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: colors.onBackground,
        ),
        headlineSmall: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: colors.onBackground,
        ),
        headlineMedium: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: colors.onBackground,
        ),
        headlineLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: colors.onBackground,
        ),
      ),
    );
  }

  ColorScheme _getColorScheme({
    required Brightness brightness,
    required ColorScheme? colorScheme,
  }) {
    if (colorScheme != null) return colorScheme;

    return ColorScheme.fromSeed(
      brightness: brightness,
      seedColor: const Color(0xFF272A3F),
    );
  }
}
