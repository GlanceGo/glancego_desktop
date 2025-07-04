import 'package:dart_mappable/dart_mappable.dart';
import 'package:glancego/domain/mappers.dart';

part 'app_entity.mapper.dart';

@MappableClass(
  ignoreNull: true,
  caseStyle: CaseStyle.snakeCase,
  includeCustomMappers: [UriDataMapper()],
)
final class AppEntity with AppEntityMappable {
  const AppEntity({
    required this.name,
    required this.icon,
    required this.target,
  });

  final String name;
  final UriData icon;
  final String target;
}
