part of '../modules/auth/data/data.dart';

class ApiDataSource {
  static final ApiDataSource _instance = ApiDataSource._internal();
  final String _host = 'localhost';
  final int _port = 8080;
  final HttpClient _client = HttpClient();

  ApiDataSource._internal();

  factory ApiDataSource() => _instance;

  Future<Result> get(String path) async {
    try {
      final request = await _client.get(_host, _port, path);
      request.headers.contentType = ContentType.json;

      final response = await request.close();
      return _processResponse(response);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<Result> post(String path, Map<String, dynamic> body) async {
    try {
      final request = await _client.post(_host, _port, path);
      request.headers.contentType = ContentType.json;

      request.write(jsonEncode(body));
      final response = await request.close();
      return _processResponse(response);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<Result> put(String path, Map<String, dynamic> body) async {
    try {
      final request = await _client.put(_host, _port, path);
      request.headers.contentType = ContentType.json;

      request.write(jsonEncode(body));
      final response = await request.close();
      return _processResponse(response);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<Result> delete(String path) async {
    try {
      final request = await _client.delete(_host, _port, path);
      request.headers.contentType = ContentType.json;

      final response = await request.close();
      return _processResponse(response);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<Result> _processResponse(HttpClientResponse response) async {
    final rawData = await response.transform(utf8.decoder).join();
    if (response.statusCode == 200) {
      try {
        final data = jsonDecode(rawData);
        return Result.ok(data);
      } on FormatException {
        return Result.ok(rawData);
      }
    } else {
      return Result.error(
        HttpException('Status code: ${response.statusCode}, body: $rawData'),
      );
    }
  }
}
