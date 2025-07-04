import 'package:dart_mappable/dart_mappable.dart';

part 'hotkey_scope_enum.mapper.dart';

@MappableEnum(caseStyle: CaseStyle.snakeCase)
enum HotkeyScopeEnum { global, application }
