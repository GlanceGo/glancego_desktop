import 'package:flutter/material.dart';
import 'package:glancego/ui/core/theme/app_theme_mixin.dart';

final class ContainerWidget extends StatelessWidget with AppThemeMixin {
  const ContainerWidget({
    required this.child,
    this.clipBehavior = Clip.none,
    this.width,
    this.height,
    this.padding,
    this.decoration,
    this.constraints,
    this.alignment,
    super.key,
  });

  final Widget child;
  final Clip clipBehavior;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final Decoration? decoration;
  final BoxConstraints? constraints;
  final AlignmentGeometry? alignment;

  @override
  Widget build(BuildContext context) {
    final metrics = getMetrics(context);

    return AnimatedContainer(
      curve: metrics.curve,
      duration: metrics.duration,
      width: width,
      height: height,
      padding: padding,
      alignment: alignment,
      decoration: decoration,
      clipBehavior: clipBehavior,
      constraints: constraints,
      child: child,
    );
  }
}
