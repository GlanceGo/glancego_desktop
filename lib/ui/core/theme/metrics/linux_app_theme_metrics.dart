import 'package:flutter/material.dart';
import 'package:glancego/domain/enums/window_effect_enum.dart';
import 'package:glancego/ui/core/theme/app_theme_metrics.dart';

final class LinuxAppThemeMetrics extends AppThemeMetrics {
  const LinuxAppThemeMetrics({
    super.small = 8,
    super.medium = 16,
    super.large = 32,
    super.icon = 24,
    super.blur = 32,
    super.radius = const Radius.circular(32),
    super.field = const BoxConstraints(minHeight: 60, maxHeight: 60),
    super.curve = Curves.easeInOut,
    super.duration = const Duration(milliseconds: 200),
    super.window = const AppWindowMetrics(
      border: BorderSide.none,
      margin: EdgeInsets.all(1),
      effect: WindowEffectEnum.transparent,
    ),
  });
}
