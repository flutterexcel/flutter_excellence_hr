import 'package:flutter/material.dart';
import 'screens/my_inventory.dart';
import 'screens/login_screen.dart';

final routes = {
  '/my_inventory': (BuildContext context) => MyInventory(),
  '/': (BuildContext context) => LoginScreen(),
};
