import 'dart:convert';
import 'dart:io';

import 'package:glancego/data/domain/enums/process_exec_enum.dart';

final class ProcessService {
  const ProcessService();

  Future<ProcessResult> run(
    ProcessExecEnum shell, {
    List<String> arguments = const [],
    String? executable,
  }) async {
    final String exec;
    if (executable != null && shell == ProcessExecEnum.custom) {
      exec = executable;
    } else {
      exec = shell.name;
    }

    final result = await Process.run(
      exec,
      arguments,
      runInShell: true,
      stderrEncoding: utf8,
      stdoutEncoding: utf8,
    );

    return result;
  }
}
