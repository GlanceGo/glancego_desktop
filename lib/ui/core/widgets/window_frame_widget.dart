import 'package:flutter/material.dart';
import 'package:glancego/ui/core/theme/app_theme_mixin.dart';

final class WindowFrameWidget extends StatelessWidget with AppThemeMixin {
  const WindowFrameWidget({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final (colors, metrics, _, _) = getTheme(context);

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: colors.surface,
        border: BoxBorder.all(color: colors.outline),
        borderRadius: BorderRadius.circular(metrics.medium),
      ),
      child: child,
    );
  }
}
