import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:percent_indicator/percent_indicator.dart';
class StatisticsLeave extends StatelessWidget {
  List<String> listOf = [
    "Allocated Leaves",
    "Leave Balance",
    "Total Leaves Taken",
    "Paid Leaves Taken",
    "Unpaid Leaves Taken",
  ];

  List<Color> colorOf = [
    Colors.deepPurple[300],
    Colors.yellow[300],
    AppColors.GREEN_COLOR,
    AppColors.NAVY_BLUE,
    Colors.red[300]
  ];
  List<String> numOf = [
    "0/month",
    "0",
    "0",
    "0",
    "0",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: [
            Container(
                margin: EdgeInsets.only(top: 16, left: 8),
                child: Text(
                  'STATICS ',
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'OpenSans',
                      color: AppColors.LIGHTBLACK_COLOR),
                )),
            Container(
                margin: EdgeInsets.only(top: 16),
                child: Text(
                  'MY LEAVES ',
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'SourceSans',
                      fontWeight: FontWeight.bold,
                      color: AppColors.LIGHTBLACK_COLOR),
                )),
          ],
        ),
        Card(
          margin: EdgeInsets.all(16),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (_, int index) => listStaticsLeave(
              this.listOf[index],
              this.colorOf[index],
              this.numOf[index],
            ),
            itemCount: this.listOf.length,
          ),
        ),

        CircularPercentIndicator(
                radius: 120.0,
                lineWidth: 7.0,
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
      ],
    );
  }
}

class listStaticsLeave extends StatelessWidget {
  String itemName, itemNum;
  Color color;
  listStaticsLeave(this.itemName, this.color, this.itemNum);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: CircleAvatar(
          child: Text(
            "L",
            style: TextStyle(fontSize: 10),
          ),
          backgroundColor: color,
          foregroundColor: Colors.white,
          radius: 14,
        ),
        title: Text(
          itemName,
          style: TextStyle(fontSize: 14, fontFamily: 'OpenSans'),
        ),
        trailing: Text(
          itemNum,
          style: TextStyle(
              fontSize: 14,
              fontFamily: 'SourceSans',
              color: AppColors.LIGHTBLACK_COLOR),
        ),
      ),
    );
  }
}