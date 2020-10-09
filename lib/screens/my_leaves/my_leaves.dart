import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_excellence_hr/screens/navigate/navigate.dart';
import 'package:flutter_excellence_hr/widgets/appbar.dart';
import 'package:flutter_excellence_hr/widgets/my_leaves_widgets/my_leaves_widgets.dart';

class MyLeaves extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BACKGROUND_COLOR,
      appBar: AppBar(
          title: AppBarWidget(
        pageName: "My Leaves",
      )),
      drawer: Navigation(),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: <Widget>[
          StatisticsLeave(),
          StatisticsRH(),
          MyLeavesList(),
          RestrictedLeave(),
          BottomSection(),
        ]),
      )),
    );
  }
}
