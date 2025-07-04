import 'package:dart_mappable/dart_mappable.dart';

class UriDataMapper extends SimpleMapper<UriData> {
  const UriDataMapper();

  @override
  UriData decode(dynamic value) => UriData.parse(value as String);

  @override
  dynamic encode(UriData self) => self.toString();
}
