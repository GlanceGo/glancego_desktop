import 'package:flutter/material.dart';
import 'package:glancego/ui/core/theme/app_theme_colors.dart';

final class AcrylicAppThemeColors extends AppThemeColors {
  AcrylicAppThemeColors({required ColorScheme colorScheme})
    : super(
        primary: colorScheme.primary,
        onPrimary: colorScheme.onPrimary,
        onPrimaryAlt: colorScheme.onPrimaryContainer,
        surface: colorScheme.surfaceContainer.withValues(alpha: 0.4),
        onSurface: colorScheme.onSurface,
        onSurfaceAlt: colorScheme.onSurface.withValues(alpha: 0.6),
        outline: colorScheme.outlineVariant.withValues(alpha: 0.8),
        background: colorScheme.surface.withValues(alpha: 0.6),
        onBackground: colorScheme.onSurface,
      );
}
