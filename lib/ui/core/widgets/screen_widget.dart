import 'package:flutter/material.dart';
import 'package:glancego/ui/core/theme/app_theme_mixin.dart';

final class ScreenWidget extends StatelessWidget with AppThemeMixin {
  const ScreenWidget({
    this.body,
    super.key,
  });

  final Widget? body;

  @override
  Widget build(BuildContext context) {
    final metrics = getMetrics(context);

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(metrics.small),
          child: body,
        ),
      ),
    );
  }
}
