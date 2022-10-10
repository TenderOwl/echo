import 'package:isar/isar.dart';

part 'endpoints_collection.g.dart';

@collection
class EndpointsCollection {
  Id id = Isar.autoIncrement;

  String? name;
}
