import 'dart:convert';
import 'dart:io';

import 'package:glancego/domain/enums/process_exec_enum.dart';

final class ProcessService {
  const ProcessService();

  Future<ProcessResult> run(
    ProcessExecEnum shell, {
    List<String> arguments = const [],
    String? executable,
  }) async {
    final String exec;
    const encoding = Utf8Codec(allowMalformed: true);

    if (executable != null && shell == ProcessExecEnum.custom) {
      exec = executable;
    } else {
      exec = shell.name;
    }

    final result = await Process.run(
      exec,
      arguments,
      runInShell: true,
      stderrEncoding: encoding,
      stdoutEncoding: encoding,
    );

    return result;
  }
}
