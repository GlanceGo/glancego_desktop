import 'package:flutter/material.dart';

class AppThemeColors extends ThemeExtension<AppThemeColors> {
  const AppThemeColors({
    required this.primary,
    required this.onPrimary,
    required this.onPrimaryAlt,
    required this.surface,
    required this.onSurface,
    required this.onSurfaceAlt,
    required this.outline,
    required this.background,
    required this.onBackground,
  });

  final Color primary;
  final Color onPrimary;
  final Color onPrimaryAlt;
  final Color surface;
  final Color onSurface;
  final Color onSurfaceAlt;
  final Color outline;
  final Color background;
  final Color onBackground;

  @override
  ThemeExtension<AppThemeColors> copyWith({
    Color? primary,
    Color? onPrimary,
    Color? onPrimaryAlt,
    Color? surface,
    Color? onSurface,
    Color? onSurfaceAlt,
    Color? outline,
    Color? background,
    Color? onBackground,
  }) {
    return AppThemeColors(
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      onPrimaryAlt: onPrimaryAlt ?? this.onPrimaryAlt,
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
      onSurfaceAlt: onSurfaceAlt ?? this.onSurfaceAlt,
      outline: outline ?? this.outline,
      background: background ?? this.background,
      onBackground: onBackground ?? this.onBackground,
    );
  }

  @override
  ThemeExtension<AppThemeColors> lerp(
    covariant ThemeExtension<AppThemeColors>? other,
    double t,
  ) {
    if (other is! AppThemeColors) return this;

    return AppThemeColors(
      primary: Color.lerp(primary, other.primary, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      onPrimaryAlt: Color.lerp(onPrimaryAlt, other.onPrimaryAlt, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      onSurfaceAlt: Color.lerp(onSurfaceAlt, other.onSurfaceAlt, t)!,
      outline: Color.lerp(outline, other.outline, t)!,
      background: Color.lerp(background, other.background, t)!,
      onBackground: Color.lerp(onBackground, other.onBackground, t)!,
    );
  }
}
