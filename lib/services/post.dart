import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_excellence_hr/globals.dart';
import 'package:http/http.dart' as http;

class Post {
  final JsonDecoder _decoder = JsonDecoder();

  Future<dynamic> post(String url, {Map headers, body, encoding}) async {
    var checkAction = json.decode(body);
    String action = checkAction['action'];
      if (testingActive) {
       if(loginActive){
          final contents = await rootBundle.loadString(
          'assets/test/$action.json',
        );
         return _decoder.convert(contents);
      
       }
       else{
          final contents = await rootBundle.loadString(
          'assets/test/login_fail.json',
        );
         return _decoder.convert(contents);
      
       }
    } else {
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
}
