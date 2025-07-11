import 'package:flutter/material.dart';
import 'package:glancego/ui/core/theme/app_theme_mixin.dart';
import 'package:glancego/ui/core/widgets/icon_widget.dart';
import 'package:glancego/ui/core/widgets/text_widget.dart';

final class TextFieldWidget extends StatelessWidget with AppThemeMixin {
  const TextFieldWidget({
    required this.icon,
    required this.hintText,
    this.textType = TextWidgetType.bodyMedium,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    super.key,
  });

  final IconData icon;
  final String hintText;
  final TextWidgetType textType;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  @override
  Widget build(BuildContext context) {
    final (colors, metrics, textTheme, brightness) = getTheme(context);

    final borderRadius = BorderRadius.all(metrics.radius);
    final border = OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: borderRadius,
    );

    final TextStyle style;
    switch (textType) {
      case TextWidgetType.bodySmall:
        style = textTheme.bodySmall!;
      case TextWidgetType.bodyMedium:
        style = textTheme.bodyMedium!;
      case TextWidgetType.bodyLarge:
        style = textTheme.bodyLarge!;
      case TextWidgetType.titleSmall:
        style = textTheme.titleSmall!;
      case TextWidgetType.titleMedium:
        style = textTheme.titleMedium!;
      case TextWidgetType.titleLarge:
        style = textTheme.titleLarge!;
      case TextWidgetType.headlineSmall:
        style = textTheme.headlineSmall!;
      case TextWidgetType.headlineMedium:
        style = textTheme.headlineMedium!;
      case TextWidgetType.headlineLarge:
        style = textTheme.headlineLarge!;
    }

    return TextFormField(
      autofocus: true,
      onChanged: onChanged,
      controller: controller,
      keyboardType: keyboardType,
      cursorColor: colors.primary,
      onFieldSubmitted: onSubmitted,
      keyboardAppearance: brightness,
      textInputAction: textInputAction,
      enableInteractiveSelection: true,
      style: style.copyWith(color: colors.onSurface),
      decoration: InputDecoration(
        filled: false,
        border: border,
        hintText: hintText,
        errorBorder: border,
        enabledBorder: border,
        focusedBorder: border,
        disabledBorder: border,
        focusedErrorBorder: border,
        constraints: metrics.field,
        fillColor: colors.surface,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        hintStyle: style.copyWith(color: colors.onSurfaceAlt),
        prefixIcon: IconWidget(icon: icon, color: colors.onSurfaceAlt),
      ),
    );
  }
}
