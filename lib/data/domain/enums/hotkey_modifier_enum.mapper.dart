// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'hotkey_modifier_enum.dart';

class HotkeyModifierEnumMapper extends EnumMapper<HotkeyModifierEnum> {
  HotkeyModifierEnumMapper._();

  static HotkeyModifierEnumMapper? _instance;
  static HotkeyModifierEnumMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = HotkeyModifierEnumMapper._());
    }
    return _instance!;
  }

  static HotkeyModifierEnum fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  HotkeyModifierEnum decode(dynamic value) {
    switch (value) {
      case r'ctrl':
        return HotkeyModifierEnum.ctrl;
      case r'alt':
        return HotkeyModifierEnum.alt;
      case r'shift':
        return HotkeyModifierEnum.shift;
      case r'meta':
        return HotkeyModifierEnum.meta;
      case r'caps_lock':
        return HotkeyModifierEnum.capsLock;
      case r'fn':
        return HotkeyModifierEnum.fn;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(HotkeyModifierEnum self) {
    switch (self) {
      case HotkeyModifierEnum.ctrl:
        return r'ctrl';
      case HotkeyModifierEnum.alt:
        return r'alt';
      case HotkeyModifierEnum.shift:
        return r'shift';
      case HotkeyModifierEnum.meta:
        return r'meta';
      case HotkeyModifierEnum.capsLock:
        return r'caps_lock';
      case HotkeyModifierEnum.fn:
        return r'fn';
    }
  }
}

extension HotkeyModifierEnumMapperExtension on HotkeyModifierEnum {
  String toValue() {
    HotkeyModifierEnumMapper.ensureInitialized();
    return MapperContainer.globals.toValue<HotkeyModifierEnum>(this) as String;
  }
}
