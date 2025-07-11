import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:glancego/ui/core/theme/app_theme_mixin.dart';
import 'package:glancego/ui/core/widgets/container_widget.dart';

final class BlurWidget extends StatelessWidget with AppThemeMixin {
  const BlurWidget({
    required this.child,
    this.isEnabled = true,
    this.shape = BoxShape.rectangle,
    this.borderRadius,
    super.key,
  });

  final Widget child;
  final bool isEnabled;
  final BoxShape shape;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final metrics = getMetrics(context);

    if (!isEnabled || metrics.blur == 0) return child;

    return ContainerWidget(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(shape: shape, borderRadius: borderRadius),
      child: BackdropFilter(
        blendMode: BlendMode.src,
        filter: ImageFilter.blur(sigmaX: metrics.blur, sigmaY: metrics.blur),
        child: child,
      ),
    );
  }
}
