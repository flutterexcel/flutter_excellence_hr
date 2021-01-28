import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_excellence_hr/bloc/bloc.dart';
import 'package:flutter_excellence_hr/bloc/inventory/inventory.dart';
import 'package:flutter_excellence_hr/bloc/inventory/inventory_bloc.dart';
import 'package:flutter_excellence_hr/bloc/login/login_bloc.dart';
import 'package:flutter_excellence_hr/bloc/profile/profile_bloc.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_excellence_hr/screens/apply_leave/apply_leave.dart';
import 'package:flutter_excellence_hr/screens/attendance/my_attendance.dart';
import 'package:flutter_excellence_hr/screens/holiday_list/holiday_list.dart';
import 'package:flutter_excellence_hr/screens/my_leaves/my_leaves.dart';
import 'package:flutter_excellence_hr/screens/my_salary/my_salary.dart';
import 'package:flutter_excellence_hr/screens/mydocuments/documents.dart';
import 'package:flutter_excellence_hr/screens/policy_documents/policy_documents.dart';
import 'package:flutter_excellence_hr/screens/screens.dart';
import 'package:flutter_excellence_hr/screens/weekly_timesheet/header_issue.dart';
import 'package:flutter_excellence_hr/screens/weekly_timesheet/timesheet.dart';
import 'package:flutter_excellence_hr/screens/weekly_timesheet/weekly_timesheet.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  Widget build(BuildContext context) {
    final _loginBloc = BlocProvider.of<LoginBloc>(context);
    final _inventoryBloc = BlocProvider.of<InventoryBloc>(context);
    final _profileBloc = BlocProvider.of<ProfileBloc>(context);
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 100.0,
              child: DrawerHeader(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      child: Image(
                        image: AssetImage('assets/images/logo.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: AppColors.LIGHTBLACK_COLOR,
              ),
              title: Text(
                'My Profile',
                style: TextStyle(color: AppColors.LIGHTBLACK_COLOR),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShowProfile()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.view_day, color: AppColors.LIGHTBLACK_COLOR),
              title: Text('My Attendance',
                  style: TextStyle(color: AppColors.LIGHTBLACK_COLOR)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyAttendance()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.view_day, color: AppColors.LIGHTBLACK_COLOR),
              title: Text('Weekly Timesheet',
                  style: TextStyle(color: AppColors.LIGHTBLACK_COLOR)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HeaderIssue()),
                );
              },
            ),
            ListTile(
              leading:
                  Icon(Icons.view_carousel, color: AppColors.LIGHTBLACK_COLOR),
              title: Text('Apply Leave',
                  style: TextStyle(color: AppColors.LIGHTBLACK_COLOR)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ApplyLeave()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.view_list, color: AppColors.LIGHTBLACK_COLOR),
              title: Text('My Leaves',
                  style: TextStyle(color: AppColors.LIGHTBLACK_COLOR)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyLeaves()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.view_module_rounded,
                  color: AppColors.LIGHTBLACK_COLOR),
              title: Text('My Salary',
                  style: TextStyle(color: AppColors.LIGHTBLACK_COLOR)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MySalary()),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.dashboard_rounded,
                color: AppColors.LIGHTBLACK_COLOR,
              ),
              title: Text('My Inventory',
                  style: TextStyle(color: AppColors.LIGHTBLACK_COLOR)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShowInventory()),
                );

                _inventoryBloc.add(LoadInventory(enableInventory: true));
              },
            ),
            ListTile(
              leading:
                  Icon(Icons.view_array, color: AppColors.LIGHTBLACK_COLOR),
              title: Text('My Documents',
                  style: TextStyle(color: AppColors.LIGHTBLACK_COLOR)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyDocuments()),
                );
              },
            ),
            ListTile(
              leading:
                  Icon(Icons.view_column, color: AppColors.LIGHTBLACK_COLOR),
              title: Text('Policy Documents',
                  style: TextStyle(color: AppColors.LIGHTBLACK_COLOR)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PolicyDocuments()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.bookmark, color: AppColors.LIGHTBLACK_COLOR),
              title: Text('Holidays',
                  style: TextStyle(color: AppColors.LIGHTBLACK_COLOR)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HolidayList()),
                );
              },
            ),
            Divider(height: 1),
            ListTile(
              leading:
                  Icon(Icons.exit_to_app, color: AppColors.LIGHTBLACK_COLOR),
              title: Text('Logout',
                  style: TextStyle(color: AppColors.LIGHTBLACK_COLOR)),
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, "/", (route) => false);

                _loginBloc.add(UserLogOut());
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
