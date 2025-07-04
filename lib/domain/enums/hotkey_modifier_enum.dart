import 'package:dart_mappable/dart_mappable.dart';

part 'hotkey_modifier_enum.mapper.dart';

@MappableEnum(caseStyle: CaseStyle.snakeCase)
enum HotkeyModifierEnum { ctrl, alt, shift, meta, capsLock, fn }
