// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'hotkey_scope_enum.dart';

class HotkeyScopeEnumMapper extends EnumMapper<HotkeyScopeEnum> {
  HotkeyScopeEnumMapper._();

  static HotkeyScopeEnumMapper? _instance;
  static HotkeyScopeEnumMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = HotkeyScopeEnumMapper._());
    }
    return _instance!;
  }

  static HotkeyScopeEnum fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  HotkeyScopeEnum decode(dynamic value) {
    switch (value) {
      case r'global':
        return HotkeyScopeEnum.global;
      case r'application':
        return HotkeyScopeEnum.application;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(HotkeyScopeEnum self) {
    switch (self) {
      case HotkeyScopeEnum.global:
        return r'global';
      case HotkeyScopeEnum.application:
        return r'application';
    }
  }
}

extension HotkeyScopeEnumMapperExtension on HotkeyScopeEnum {
  String toValue() {
    HotkeyScopeEnumMapper.ensureInitialized();
    return MapperContainer.globals.toValue<HotkeyScopeEnum>(this) as String;
  }
}
