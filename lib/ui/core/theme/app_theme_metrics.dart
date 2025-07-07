import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

final class AppThemeMetricsImpl extends AppThemeMetrics {
  const AppThemeMetricsImpl({
    super.small = 8,
    super.medium = 16,
    super.large = 24,
    super.icon = 24,
    super.field = const BoxConstraints(minHeight: 60, maxHeight: 60),
    super.curve = Curves.easeInOut,
    super.duration = const Duration(milliseconds: 200),
  });
}

final class AppThemeMetrics extends ThemeExtension<AppThemeMetrics> {
  const AppThemeMetrics({
    required this.small,
    required this.medium,
    required this.large,
    required this.icon,
    required this.field,
    required this.curve,
    required this.duration,
  });

  final double small;
  final double medium;
  final double large;
  final double icon;
  final BoxConstraints field;
  final Curve curve;
  final Duration duration;

  @override
  ThemeExtension<AppThemeMetrics> copyWith({
    double? small,
    double? medium,
    double? large,
    double? icon,
    BoxConstraints? field,
    Curve? curve,
    Duration? duration,
  }) {
    return AppThemeMetrics(
      small: small ?? this.small,
      medium: medium ?? this.medium,
      large: large ?? this.large,
      icon: icon ?? this.icon,
      field: field ?? this.field,
      curve: curve ?? this.curve,
      duration: duration ?? this.duration,
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
      field: BoxConstraints.lerp(field, other.field, t)!,
      curve: t < 0.5 ? curve : other.curve,
      duration: lerpDuration(duration, other.duration, t),
    );
  }
}
