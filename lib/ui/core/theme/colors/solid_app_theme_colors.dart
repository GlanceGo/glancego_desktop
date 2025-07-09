import 'package:flutter/material.dart';
import 'package:glancego/ui/core/theme/app_theme_colors.dart';

final class SolidAppThemeColors extends AppThemeColors {
  SolidAppThemeColors({required ColorScheme colorScheme})
    : super(
        primary: colorScheme.primary,
        onPrimary: colorScheme.onPrimary,
        onPrimaryAlt: colorScheme.onPrimaryContainer,
        surface: colorScheme.surfaceContainerHighest,
        onSurface: colorScheme.onSurface,
        onSurfaceAlt: colorScheme.onSurfaceVariant,
        outline: colorScheme.outlineVariant,
        background: colorScheme.surface,
        onBackground: colorScheme.onSurface,
      );
}
