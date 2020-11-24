import 'dart:convert';
import 'package:flutter/services.dart';

class AppConfig {
  String baseUrl;

  AppConfig({this.baseUrl});

  AppConfig.withMocks({this.baseUrl});
  static Future<AppConfig> forEnvironment(String env, String url) async {
    // set default to dev if nothing was passed
    env = env ?? 'dev';

    // load the json file
    final contents = await rootBundle.loadString(
      'assets/config/$env.json',
    );

    // decode our json
    final json = jsonDecode(contents);

    // convert our JSON into an instance of our AppConfig class
    return AppConfig(baseUrl: json['baseUrl'] + json[url]);
  }
}
