import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/screens/attendance/my_attendance.dart';
import 'package:flutter_excellence_hr/screens/mydocuments/documents.dart';
import 'package:flutter_excellence_hr/screens/profile/edit_profile.dart';
import 'screens/show_inventory.dart';
import 'package:flutter_excellence_hr/screens/navigate/overview.dart';

final routes = {
  '/my_inventory': (BuildContext context) => ShowInventory(),
  '/overview': (BuildContext context) => Overview(),
  '/profile': (BuildContext context) => ShowProfile(),
};
