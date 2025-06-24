import 'package:flutter/material.dart';
import 'package:glancego/ui/core/theme/app_theme_mixin.dart';
import 'package:glancego/ui/core/widgets/icon_widget.dart';
import 'package:glancego/ui/core/widgets/screen_widget.dart';
import 'package:glancego/ui/core/widgets/text_field_widget.dart';
import 'package:solar_icon_pack/solar_icon_pack.dart';

final class HomeScreen extends StatelessWidget with AppThemeMixin {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final (colors, _, textTheme, _) = getTheme(context);

    return ScreenWidget(
      body: Column(
        children: [
          const TextFieldWidget(
            hintText: 'GlanceGo Search',
            icon: SolarLinearIcons.magniferRounded,
            keyboardType: TextInputType.webSearch,
            textInputAction: TextInputAction.search,
          ),
          Expanded(
            child: Column(
              spacing: 8,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconWidget(
                  size: 24,
                  icon: SolarLinearIcons.magniferRounded,
                  color: colors.onSurface.withValues(alpha: 0.6),
                ),
                Text(
                  'Search for something',
                  style: textTheme.bodyMedium!.copyWith(
                    color: colors.onSurface.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
