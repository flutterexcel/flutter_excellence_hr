import 'package:flutter/material.dart';
import 'services/storage_service.dart';
import 'routes.dart';

void main() async {
  StorageUtil.getInstance();

  runApp(HrApp());
}

class HrApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Excellence HR',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "/",
      routes: routes,
    );
  }
}
