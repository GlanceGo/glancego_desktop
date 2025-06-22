import 'dart:ui';

import 'package:flutter/material.dart';

final class AppThemeMetricsImpl extends AppThemeMetrics {
  const AppThemeMetricsImpl({
    super.small = 8,
    super.medium = 16,
    super.large = 24,
    super.icon = 24,
  });
}

final class AppThemeMetrics extends ThemeExtension<AppThemeMetrics> {
  const AppThemeMetrics({
    required this.small,
    required this.medium,
    required this.large,
    required this.icon,
  });

  final double small;
  final double medium;
  final double large;
  final double icon;

  @override
  ThemeExtension<AppThemeMetrics> copyWith({
    double? small,
    double? medium,
    double? large,
    double? icon,
  }) {
    return AppThemeMetrics(
      small: small ?? this.small,
      medium: medium ?? this.medium,
      large: large ?? this.large,
      icon: icon ?? this.icon,
    );
  }

  @override
  ThemeExtension<AppThemeMetrics> lerp(
    covariant ThemeExtension<AppThemeMetrics>? other,
    double t,
  ) {
    if (other is! AppThemeMetrics) return this;

    return AppThemeMetrics(
      small: lerpDouble(small, other.small, t)!,
      medium: lerpDouble(medium, other.medium, t)!,
      large: lerpDouble(large, other.large, t)!,
      icon: lerpDouble(icon, other.icon, t)!,
    );
  }
}
