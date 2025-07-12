import 'dart:convert';

import 'package:glancego/data/repositories/apps/apps_repository.dart';
import 'package:glancego/data/services/directory_service.dart';
import 'package:glancego/data/services/process_service.dart';
import 'package:glancego/domain/entities/app_entity.dart';
import 'package:glancego/domain/enums/process_exec_enum.dart';
import 'package:path/path.dart' as p;

final class WindowsAppsRepository implements AppsRepository {
  const WindowsAppsRepository(this._processService, this._directoryService);

  final ProcessService _processService;
  final DirectoryService _directoryService;

  @override
  Future<List<AppEntity>> getAll() async {
    final assets = await _directoryService.getAssets();
    final script = p.join(assets.path, 'scripts', 'get_all_apps.ps1');

    final result = await _processService.run(
      ProcessExecEnum.powershell,
      arguments: [
        '-NoProfile',
        '-ExecutionPolicy',
        'Bypass',
        '-Command',
        'chcp 65001 | Out-Null; & "$script"',
      ],
    );

    if (result.exitCode == 0) {
      final appList = jsonDecode(result.stdout as String) as List<dynamic>;
      final apps = appList.map(
        (e) => AppEntityMapper.fromMap(e as Map<String, dynamic>),
      );

      return apps.toList();
    }

    return [];
  }

  @override
  Future<void> open(AppEntity app) async {
    await _processService.run(
      ProcessExecEnum.powershell,
      arguments: [
        'Start-Process',
        'explorer.exe',
        '-ArgumentList',
        app.target,
        '&',
      ],
    );
  }
}
