import 'package:flutter/material.dart';
import 'package:glancego/ui/core/theme/app_theme_mixin.dart';

final class TextWidget extends StatelessWidget with AppThemeMixin {
  const TextWidget(
    this.data, {
    this.type = TextWidgetType.bodyMedium,
    this.color,
    super.key,
  });

  final String data;
  final Color? color;
  final TextWidgetType type;

  @override
  Widget build(BuildContext context) {
    final theme = getTextTheme(context);

    final TextStyle style;
    switch (type) {
      case TextWidgetType.bodySmall:
        style = theme.bodySmall!;
      case TextWidgetType.bodyMedium:
        style = theme.bodyMedium!;
      case TextWidgetType.bodyLarge:
        style = theme.bodyLarge!;
      case TextWidgetType.titleSmall:
        style = theme.titleSmall!;
      case TextWidgetType.titleMedium:
        style = theme.titleMedium!;
      case TextWidgetType.titleLarge:
        style = theme.titleLarge!;
      case TextWidgetType.headlineSmall:
        style = theme.headlineSmall!;
      case TextWidgetType.headlineMedium:
        style = theme.headlineMedium!;
      case TextWidgetType.headlineLarge:
        style = theme.headlineLarge!;
    }

    return Text(
      data,
      overflow: TextOverflow.ellipsis,
      style: style.copyWith(color: color),
    );
  }
}

enum TextWidgetType {
  bodySmall,
  bodyMedium,
  bodyLarge,
  titleSmall,
  titleMedium,
  titleLarge,
  headlineSmall,
  headlineMedium,
  headlineLarge,
}
