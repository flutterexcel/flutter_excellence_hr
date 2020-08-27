import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/screens/login_screen.dart';
//import 'package:flutter_excellence_hr/screens/navigate/navigation.dart';
import 'package:flutter_excellence_hr/screens/navigate/inventory.dart';
final routes = {
  '/login': (BuildContext context) => LoginScreen(),
  // '/home': (BuildContext context) =>  HomeScreen(),
  '/': (BuildContext context) => MyInventory(),
  '/nav': (BuildContext context) => MyInventory(),
};