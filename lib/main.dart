import 'package:flutter/material.dart';
//import 'package:flutter_excellence_hr/LoginScreen.dart';
import 'routes.dart';

void main() {
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
     // home: LoginScreen(),


    initialRoute: "/",
      routes: routes
       
    );
  }
}
