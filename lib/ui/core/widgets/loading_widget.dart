import 'dart:io';

import 'package:flutter/material.dart';
import 'package:glancego/ui/core/theme/app_theme_mixin.dart';

final class LoadingWidget extends StatelessWidget with AppThemeMixin {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = getColors(context);

    final Color? bgColor;
    final Animation<Color>? fgColor;
    if (Platform.isMacOS) {
      bgColor = colors.primary;
      fgColor = null;
    } else {
      bgColor = null;
      fgColor = AlwaysStoppedAnimation(colors.primary);
    }

    return Center(
      child: CircularProgressIndicator.adaptive(
        valueColor: fgColor,
        backgroundColor: bgColor,
      ),
    );
  }
}
