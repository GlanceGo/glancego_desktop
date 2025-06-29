import 'package:dart_mappable/dart_mappable.dart';

part 'process_exec_enum.mapper.dart';

@MappableEnum(caseStyle: CaseStyle.snakeCase)
enum ProcessExecEnum { zsh, bash, powershell, custom }
