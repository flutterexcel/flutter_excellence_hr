import 'package:flutter/material.dart';
import 'screens/myInventory.dart';
import 'LoginScreen.dart';

final routes = {
  '/my_inventory': (BuildContext context) => MyInventory(),
  '/': (BuildContext context) => LoginScreen(),
};
