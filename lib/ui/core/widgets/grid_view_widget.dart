import 'package:flutter/material.dart';
import 'package:glancego/ui/core/theme/app_theme_mixin.dart';

final class GridViewWidget extends StatelessWidget with AppThemeMixin {
  const GridViewWidget({
    required this.count,
    required this.builder,
    this.direction = Axis.vertical,
    this.emptyChild,
    this.controller,
    super.key,
  });

  final int count;
  final Widget Function(BuildContext, int) builder;
  final Axis direction;
  final Widget? emptyChild;
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    final metrics = getMetrics(context);

    if (count == 0) return SizedBox.expand(child: emptyChild);

    return GridView.builder(
      itemCount: count,
      itemBuilder: builder,
      controller: controller,
      scrollDirection: direction,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6,
        mainAxisSpacing: metrics.small,
        crossAxisSpacing: metrics.small,
      ),
    );
  }
}
