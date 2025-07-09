import 'package:dynamic_system_colors/dynamic_system_colors.dart';
import 'package:flutter/material.dart';
import 'package:glancego/ui/core/theme/app_theme_inherited.dart';

final class AppThemeWidget extends StatelessWidget {
  const AppThemeWidget({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (light, dark) => AppThemeInherited(
        dark: dark,
        light: light,
        child: child,
      ),
    );
  }
}
