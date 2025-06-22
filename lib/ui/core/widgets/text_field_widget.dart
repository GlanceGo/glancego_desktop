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

    final hintTextColor = colors.onSurface.withValues(alpha: 0.6);
    const border = OutlineInputBorder(borderSide: BorderSide.none);

    return TextFormField(
      autofocus: true,
      keyboardType: keyboardType,
      cursorColor: colors.primary,
      keyboardAppearance: brightness,
      textInputAction: textInputAction,
      enableInteractiveSelection: true,
      style: textTheme.bodyLarge!.copyWith(color: colors.onSurface),
      decoration: InputDecoration(
        filled: false,
        border: border,
        hintText: hintText,
        errorBorder: border,
        enabledBorder: border,
        focusedBorder: border,
        disabledBorder: border,
        focusedErrorBorder: border,
        prefixIcon: IconWidget(icon: icon, color: hintTextColor),
        constraints: BoxConstraints.tight(const Size.fromHeight(60)),
        hintStyle: textTheme.titleLarge!.copyWith(color: hintTextColor),
      ),
    );
  }
}
