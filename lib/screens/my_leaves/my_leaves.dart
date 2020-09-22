import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_excellence_hr/screens/navigate/navigate.dart';
import 'package:flutter_excellence_hr/widgets/appbar.dart';
import 'package:flutter_excellence_hr/widgets/my_leaves_widgets/my_leaves_widgets.dart';
import 'package:percent_indicator/percent_indicator.dart';

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
          CircularPercentIndicator(
                radius: 120.0,
                lineWidth: 13.0,
                animation: true,
                percent: 0.7,
                center: new Text(
                  "70.0%",
                  style:
                      new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                footer: new Text(
                  "Final Leave Balance",
                  style:
                      new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0,color: AppColors.LIGHTBLACK_COLOR,fontFamily: 'SourceSans'),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: AppColors.GREEN_COLOR,
              ),
              
        ]),
      )),
    );
  }
}