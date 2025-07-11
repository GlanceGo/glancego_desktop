import 'package:flutter/material.dart';
import 'package:glancego/ui/core/theme/app_theme_mixin.dart';
import 'package:glancego/ui/core/widgets/icon_widget.dart';
import 'package:glancego/ui/core/widgets/text_widget.dart';

final class EmptyWidget extends StatelessWidget with AppThemeMixin {
  const EmptyWidget({
    required this.text,
    required this.icon,
    super.key,
  });

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final (colors, metrics, _, _) = getTheme(context);

    return Column(
      spacing: metrics.small,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconWidget(icon: icon, color: colors.onSurfaceAlt),
        TextWidget(text, color: colors.onSurfaceAlt),
      ],
    );
  }
}
