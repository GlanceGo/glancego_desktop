// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'window_effect_enum.dart';

class WindowEffectEnumMapper extends EnumMapper<WindowEffectEnum> {
  WindowEffectEnumMapper._();

  static WindowEffectEnumMapper? _instance;
  static WindowEffectEnumMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WindowEffectEnumMapper._());
    }
    return _instance!;
  }

  static WindowEffectEnum fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  WindowEffectEnum decode(dynamic value) {
    switch (value) {
      case r'acrylic':
        return WindowEffectEnum.acrylic;
      case r'transparent':
        return WindowEffectEnum.transparent;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(WindowEffectEnum self) {
    switch (self) {
      case WindowEffectEnum.acrylic:
        return r'acrylic';
      case WindowEffectEnum.transparent:
        return r'transparent';
    }
  }
}

extension WindowEffectEnumMapperExtension on WindowEffectEnum {
  String toValue() {
    WindowEffectEnumMapper.ensureInitialized();
    return MapperContainer.globals.toValue<WindowEffectEnum>(this) as String;
  }
}
