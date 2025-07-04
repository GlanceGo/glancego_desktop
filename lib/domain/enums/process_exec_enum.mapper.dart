// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'process_exec_enum.dart';

class ProcessExecEnumMapper extends EnumMapper<ProcessExecEnum> {
  ProcessExecEnumMapper._();

  static ProcessExecEnumMapper? _instance;
  static ProcessExecEnumMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProcessExecEnumMapper._());
    }
    return _instance!;
  }

  static ProcessExecEnum fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  ProcessExecEnum decode(dynamic value) {
    switch (value) {
      case r'zsh':
        return ProcessExecEnum.zsh;
      case r'bash':
        return ProcessExecEnum.bash;
      case r'powershell':
        return ProcessExecEnum.powershell;
      case r'custom':
        return ProcessExecEnum.custom;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(ProcessExecEnum self) {
    switch (self) {
      case ProcessExecEnum.zsh:
        return r'zsh';
      case ProcessExecEnum.bash:
        return r'bash';
      case ProcessExecEnum.powershell:
        return r'powershell';
      case ProcessExecEnum.custom:
        return r'custom';
    }
  }
}

extension ProcessExecEnumMapperExtension on ProcessExecEnum {
  String toValue() {
    ProcessExecEnumMapper.ensureInitialized();
    return MapperContainer.globals.toValue<ProcessExecEnum>(this) as String;
  }
}
