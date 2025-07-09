import 'package:flutter/material.dart';
import 'package:glancego/ui/core/theme/app_theme_mixin.dart';
import 'package:glancego/ui/core/widgets/icon_widget.dart';

final class TextFieldWidget extends StatelessWidget with AppThemeMixin {
  const TextFieldWidget({
    required this.icon,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    super.key,
  });

  final IconData icon;
  final String hintText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {
    final (colors, metrics, textTheme, brightness) = getTheme(context);

    final borderRadius = BorderRadius.all(metrics.radius);
    final border = OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: borderRadius,
    );

    return TextFormField(
      autofocus: true,
      keyboardType: keyboardType,
      cursorColor: colors.primary,
      keyboardAppearance: brightness,
      textInputAction: textInputAction,
      enableInteractiveSelection: true,
      style: textTheme.titleLarge!.copyWith(color: colors.onSurface),
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
        prefixIcon: IconWidget(icon: icon, color: colors.onSurfaceAlt),
        hintStyle: textTheme.titleLarge!.copyWith(color: colors.onSurfaceAlt),
      ),
    );
  }
}
