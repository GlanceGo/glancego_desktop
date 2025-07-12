import 'package:glancego/domain/entities/app_entity.dart';

abstract class AppsRepository {
  Future<List<AppEntity>> getAll();
  Future<void> open(AppEntity app);
}
