import 'dart:convert';

import 'package:echo/src/models/endpoints_collection.dart';
import 'package:isar/isar.dart';

part 'endpoint.g.dart';

@collection
class Endpoint {
  Id id = Isar.autoIncrement;
  String name;
  String? url;
  String method;
  String headersString = '{}';
  String queryParametersString = '{}';

  @ignore
  Map<String, dynamic> get headers => json.decode(headersString);

  @ignore
  Map<String, dynamic> get queryParameters =>
      json.decode(queryParametersString);

  final endpointsCollection = IsarLink<EndpointsCollection>();

  Endpoint(
    this.name, {
    String? url,
    this.method = 'GET',
  });

  void addQueryParameter(String name, dynamic value) {
    queryParameters.addAll({name: value});
    queryParametersString = json.encode(queryParameters);
  }

  void addHeader(String name, String value) {
    headers.addAll({name: value});
    headersString = json.encode(headers);
  }
}
