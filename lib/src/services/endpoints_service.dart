import 'package:echo/src/models/endpoint.dart';
import 'package:echo/src/models/endpoints_collection.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';

class EndpointsService extends GetxService {
  List<Collection>? collections;
  List<Endpoint>? endpoints;
  EndpointsCollection? currentCollection;
  Endpoint? currentEndpoint;

  Isar? isar;

  Future<EndpointsService> init() async {
    isar = await Isar.open([EndpointsCollectionSchema]);
    return this;
  }

  List<EndpointsCollection>? getCollections() {
    return isar?.endpointsCollections.filter().nameIsNotEmpty().findAllSync();
  }

  Future<EndpointsCollection?> getCollection(Id id) async {
    return await isar?.endpointsCollections.get(id);
  }

  Future<int?> addCollection(EndpointsCollection collection) async {
    return await isar?.writeTxn(
        () async => await isar?.endpointsCollections.put(collection));
  }
}
