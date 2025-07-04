import 'dart:io';

import 'package:package_info_plus/package_info_plus.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

final class DirectoryService {
  const DirectoryService();

  Future<Directory> create(Uri path) async {
    final dir = Directory(path.toFilePath());
    if (!dir.existsSync()) await dir.create(recursive: true);
    return dir;
  }

  Future<void> delete(Uri path) async {
    final dir = Directory(path.toFilePath());
    if (dir.existsSync()) await dir.delete(recursive: true);
  }

  Future<Directory> getTemp() async {
    final result = await Future.wait([
      getTemporaryDirectory(),
      PackageInfo.fromPlatform(),
    ]);

    final tempDir = result[0] as Directory;
    final package = result[1] as PackageInfo;

    final path = p.join(tempDir.path, package.packageName);
    final dir = await create(Uri.parse(path));

    return dir;
  }

  Future<Directory> getAssets() async {
    final mainExe = Platform.resolvedExecutable;
    final mainDir = Directory(p.dirname(mainExe));

    final path = p.join(mainDir.path, 'data', 'flutter_assets', 'assets');
    final dir = await create(Uri.file(path));

    return dir;
  }
}
