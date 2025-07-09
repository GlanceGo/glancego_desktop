import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:glancego/domain/enums/window_effect_enum.dart';

class AppThemeMetrics extends ThemeExtension<AppThemeMetrics> {
  const AppThemeMetrics({
    required this.small,
    required this.medium,
    required this.large,
    required this.icon,
    required this.blur,
    required this.radius,
    required this.field,
    required this.curve,
    required this.duration,
    required this.window,
  });

  final double small;
  final double medium;
  final double large;
  final double icon;
  final double blur;
  final Radius radius;
  final BoxConstraints field;
  final Curve curve;
  final Duration duration;
  final AppWindowMetrics window;

  @override
  ThemeExtension<AppThemeMetrics> copyWith({
    double? small,
    double? medium,
    double? large,
    double? icon,
    double? blur,
    Radius? radius,
    BoxConstraints? field,
    Curve? curve,
    Duration? duration,
    AppWindowMetrics? window,
  }) {
    return AppThemeMetrics(
      small: small ?? this.small,
      medium: medium ?? this.medium,
      large: large ?? this.large,
      icon: icon ?? this.icon,
      blur: blur ?? this.blur,
      radius: radius ?? this.radius,
      field: field ?? this.field,
      curve: curve ?? this.curve,
      duration: duration ?? this.duration,
      window: window ?? this.window,
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
      blur: lerpDouble(blur, other.blur, t)!,
      radius: Radius.lerp(radius, other.radius, t)!,
      field: BoxConstraints.lerp(field, other.field, t)!,
      curve: t < 0.5 ? curve : other.curve,
      duration: lerpDuration(duration, other.duration, t),
      window: t < 0.5 ? window : other.window,
    );
  }
}

final class AppWindowMetrics {
  const AppWindowMetrics({
    required this.border,
    required this.margin,
    required this.effect,
  });

  final BorderSide border;
  final EdgeInsets margin;
  final WindowEffectEnum effect;
}
