import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';

void main() => runApp(Navigation());

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
          color: AppColors.THEME_COLOR,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Image(
                        image: AssetImage('assets/images/logo.jpg'), fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: AppColors.THEME_COLOR,
                ),
              ),
              ListTile(
                leading: Icon(Icons.person,color: AppColors.NAV_ICON_COLOR,),
                title: Text('My Profile',style: TextStyle(color:AppColors.NAV_ICON_COLOR),),
                
              ),
              ListTile(
                leading: Icon(Icons.calendar_today,color: AppColors.NAV_ICON_COLOR),
                title: Text('My Attendance',style: TextStyle(color:AppColors.NAV_ICON_COLOR)),
              ),
              ListTile(
                leading: Icon(Icons.calendar_view_day,color: AppColors.NAV_ICON_COLOR),
                title: Text('Weekly Time Sheet',style: TextStyle(color:AppColors.NAV_ICON_COLOR)),
              ),
              ListTile(
                leading: Icon(Icons.calendar_today,color: AppColors.NAV_ICON_COLOR),
                title: Text('Apply Leave',style: TextStyle(color:AppColors.NAV_ICON_COLOR)),
              ),
              ListTile(
                leading: Icon(Icons.calendar_today,color: AppColors.NAV_ICON_COLOR),
                title: Text('My Leaves',style: TextStyle(color:AppColors.NAV_ICON_COLOR)),
              ),
              ListTile(
                leading: Icon(Icons.calendar_today,color: AppColors.NAV_ICON_COLOR),
                title: Text('My Salary',style: TextStyle(color:AppColors.NAV_ICON_COLOR)),
              ),
              ListTile(
                leading: Icon(Icons.calendar_today,color: AppColors.NAV_ICON_COLOR),
                title: Text('My Inventory',style: TextStyle(color:AppColors.NAV_ICON_COLOR)),
              ),
              ListTile(
                leading: Icon(Icons.calendar_today,color: AppColors.NAV_ICON_COLOR),
                title: Text('My Documents',style: TextStyle(color:AppColors.NAV_ICON_COLOR)),
              ),
              ListTile(
                leading: Icon(Icons.calendar_today,color: AppColors.NAV_ICON_COLOR),
                title: Text('Policy Documents',style: TextStyle(color:AppColors.NAV_ICON_COLOR)),
                
              ),
              ListTile(
                leading: Icon(Icons.calendar_today,color: AppColors.NAV_ICON_COLOR),
                title: Text('Holidays',style: TextStyle(color:AppColors.NAV_ICON_COLOR)),
              ),
              Divider(height: 1),
              ListTile(
                leading: Icon(Icons.exit_to_app,color: AppColors.NAV_ICON_COLOR),
                title: Text('Logout',style: TextStyle(color:AppColors.NAV_ICON_COLOR)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
