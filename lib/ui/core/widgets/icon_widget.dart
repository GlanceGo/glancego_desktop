import 'package:flutter/material.dart';
import 'package:glancego/ui/core/theme/app_theme_mixin.dart';

final class IconWidget extends StatelessWidget with AppThemeMixin {
  const IconWidget({required this.icon, this.color, this.size, super.key});

  final IconData icon;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    final (colors, metrics, _, _) = getTheme(context);
    return Icon(
      icon,
      size: size ?? metrics.icon,
      color: color ?? colors.onSurface,
    );
  }
}
