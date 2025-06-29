import 'dart:io';

import 'package:flutter/foundation.dart';

final class FileService {
  const FileService();

  Future<File> create(Uri path, {Uint8List? bytes}) async {
    final file = File(path.toFilePath());
    if (!file.existsSync()) {
      await file.create(recursive: true);
      if (bytes != null) await file.writeAsBytes(bytes);
    }

    return file;
  }

  Future<void> delete(Uri path) async {
    final file = File(path.toFilePath());
    if (file.existsSync()) await file.delete();
  }
}
