import 'package:flutter/material.dart';

final class AppThemeInherited extends InheritedWidget {
  const AppThemeInherited({
    required this.dark,
    required this.light,
    required super.child,
    super.key,
  });

  factory AppThemeInherited.of(BuildContext context) {
    final result = context
        .dependOnInheritedWidgetOfExactType<AppThemeInherited>();

    assert(result != null, 'No AppThemeInherited found in context');
    return result!;
  }

  final ColorScheme? dark;
  final ColorScheme? light;

  @override
  bool updateShouldNotify(covariant AppThemeInherited oldWidget) {
    return dark != oldWidget.dark || light != oldWidget.light;
  }
}
