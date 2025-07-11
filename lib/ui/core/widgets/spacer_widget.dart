import 'package:flutter/material.dart';
import 'package:glancego/ui/core/theme/app_theme_mixin.dart';

enum SpacerWidgetSize { zero, small, medium, large, custom }

final class SpacerWidget extends StatelessWidget with AppThemeMixin {
  const SpacerWidget({
    required this.direction,
    this.spacing = 0,
    this.size = SpacerWidgetSize.medium,
    super.key,
  });

  final Axis direction;
  final double spacing;
  final SpacerWidgetSize size;

  @override
  Widget build(BuildContext context) {
    final metrics = getMetrics(context);

    final double dimension;
    switch (size) {
      case SpacerWidgetSize.zero:
        dimension = 0;
      case SpacerWidgetSize.small:
        dimension = metrics.small;
      case SpacerWidgetSize.medium:
        dimension = metrics.medium;
      case SpacerWidgetSize.large:
        dimension = metrics.large;
      case SpacerWidgetSize.custom:
        dimension = spacing;
    }

    return SizedBox(
      height: direction == Axis.vertical ? dimension : null,
      width: direction == Axis.horizontal ? dimension : null,
    );
  }
}
