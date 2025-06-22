import 'package:flutter/material.dart';
import 'package:glancego/ui/core/theme/app_theme_metrics.dart';

mixin AppThemeMixin {
  ColorScheme getColors(BuildContext context) {
    return Theme.of(context).colorScheme;
  }

  AppThemeMetrics getMetrics(BuildContext context) {
    return Theme.of(context).extension<AppThemeMetrics>()!;
  }

  TextTheme getTextTheme(BuildContext context) {
    return Theme.of(context).textTheme;
  }

  Brightness getBrightness(BuildContext context) {
    return Theme.of(context).brightness;
  }

  (
    ColorScheme colors,
    AppThemeMetrics metrics,
    TextTheme textTheme,
    Brightness brightness,
  )
  getTheme(
    BuildContext context,
  ) {
    final theme = Theme.of(context);
    final metrics = theme.extension<AppThemeMetrics>()!;

    return (theme.colorScheme, metrics, theme.textTheme, theme.brightness);
  }
}
