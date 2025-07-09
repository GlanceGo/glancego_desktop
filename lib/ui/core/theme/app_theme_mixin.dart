import 'package:flutter/material.dart';
import 'package:glancego/ui/core/theme/app_theme_colors.dart';
import 'package:glancego/ui/core/theme/app_theme_metrics.dart';

mixin AppThemeMixin {
  AppThemeColors getColors(BuildContext context) {
    return Theme.of(context).extension<AppThemeColors>()!;
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
    AppThemeColors colors,
    AppThemeMetrics metrics,
    TextTheme textTheme,
    Brightness brightness,
  )
  getTheme(
    BuildContext context,
  ) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppThemeColors>()!;
    final metrics = theme.extension<AppThemeMetrics>()!;

    return (colors, metrics, theme.textTheme, theme.brightness);
  }
}
