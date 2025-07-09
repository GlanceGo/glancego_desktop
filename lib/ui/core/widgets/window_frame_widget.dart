import 'package:flutter/material.dart';
import 'package:glancego/ui/core/theme/app_theme_mixin.dart';
import 'package:glancego/ui/core/widgets/container_widget.dart';

final class WindowFrameWidget extends StatelessWidget with AppThemeMixin {
  const WindowFrameWidget({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final (colors, metrics, _, _) = getTheme(context);

    return Padding(
      padding: metrics.window.margin,
      child: ContainerWidget(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: colors.background,
          borderRadius: BorderRadius.all(metrics.radius),
          border: Border.fromBorderSide(
            metrics.window.border.copyWith(color: colors.outline),
          ),
        ),
        child: child,
      ),
    );
  }
}
