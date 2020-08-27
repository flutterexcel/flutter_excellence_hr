import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Post {
  final JsonDecoder _decoder = JsonDecoder();

  Future<dynamic> post(String url, {Map headers, body, encoding}) async {
    return http
        .post(url, body: body, headers: headers, encoding: encoding)
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return _decoder.convert(res);
    });
  }
}
