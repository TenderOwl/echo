class Endpoint {
  String? id;
  String title;
  Uri? url;
  String method;
  Map<String, dynamic> headers = {};
  Map<String, dynamic> queryParameters = {};

  Endpoint(
    this.title, {
    String? url,
    this.id,
    this.method = 'GET',
  }) {
    if (url != null) seturl(url);
  }

  void seturl(String url) {
    this.url = Uri.parse(url);
  }

  void addQueryParameter(String name, dynamic value) {
    queryParameters.addAll({name: value});
  }

  void addHeader(String name, String value) {
    headers.addAll({name: value});
  }
}
