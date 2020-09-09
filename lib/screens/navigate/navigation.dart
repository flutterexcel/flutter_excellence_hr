import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_excellence_hr/screens/profile/edit_profile.dart';
import '../navigate/navigate.dart';

class Navigation extends StatelessWidget {
  final appTitle = 'Excellence Technosoft H.R.M.S';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BACKGROUND_COLOR,
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(child: Text('My Page!')),
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
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
              ListTile(
                leading: Icon(
                  Icons.person,
                  color: AppColors.LIGHTBLACK_COLOR,
                ),
                title: Text('My Profile',
                    style: TextStyle(color: AppColors.LIGHTBLACK_COLOR)),
                    onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyProfile())
                  );
                },
              ),
              ListTile(
                leading:
                    Icon(Icons.view_day, color: AppColors.LIGHTBLACK_COLOR),
                title: Text('My Attendance',
                    style: TextStyle(color: AppColors.LIGHTBLACK_COLOR)),
              ),
              ListTile(
                leading:
                    Icon(Icons.view_week, color: AppColors.LIGHTBLACK_COLOR),
                title: Text('Weekly Time Sheet',
                    style: TextStyle(color: AppColors.LIGHTBLACK_COLOR)),
              ),
              ListTile(
                leading: Icon(Icons.view_carousel,
                    color: AppColors.LIGHTBLACK_COLOR),
                title: Text('Apply Leave',
                    style: TextStyle(color: AppColors.LIGHTBLACK_COLOR)),
              ),
              ListTile(
                leading:
                    Icon(Icons.view_list, color: AppColors.LIGHTBLACK_COLOR),
                title: Text('My Leaves',
                    style: TextStyle(color: AppColors.LIGHTBLACK_COLOR)),
              ),
              ListTile(
                leading: Icon(Icons.view_module_rounded,
                    color: AppColors.LIGHTBLACK_COLOR),
                title: Text('My Salary',
                    style: TextStyle(color: AppColors.LIGHTBLACK_COLOR)),
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
                    MaterialPageRoute(builder: (context) => YourInventory()),
                  );
                },
              ),
              ListTile(
                leading:
                    Icon(Icons.view_array, color: AppColors.LIGHTBLACK_COLOR),
                title: Text('My Documents',
                    style: TextStyle(color: AppColors.LIGHTBLACK_COLOR)),
              ),
              ListTile(
                leading:
                    Icon(Icons.view_column, color: AppColors.LIGHTBLACK_COLOR),
                title: Text('Policy Documents',
                    style: TextStyle(color: AppColors.LIGHTBLACK_COLOR)),
              ),
              ListTile(
                leading:
                    Icon(Icons.bookmark, color: AppColors.LIGHTBLACK_COLOR),
                title: Text('Holidays',
                    style: TextStyle(color: AppColors.LIGHTBLACK_COLOR)),
              ),
              Divider(height: 1),
              ListTile(
                leading:
                    Icon(Icons.exit_to_app, color: AppColors.LIGHTBLACK_COLOR),
                title: Text('Logout',
                    style: TextStyle(color: AppColors.LIGHTBLACK_COLOR)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
