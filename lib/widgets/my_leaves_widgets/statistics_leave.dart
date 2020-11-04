import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/model/leave/user_sal_info.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_excellence_hr/services/leave/sal_info.dart';
import 'package:percent_indicator/percent_indicator.dart';

class StatisticsLeave extends StatefulWidget {
  final Function(Future<dynamic>) onPayslipHistory;

  const StatisticsLeave({Key key, this.onPayslipHistory}) : super(key: key);

  @override
  _StatisticsLeaveState createState() => _StatisticsLeaveState();
}

class _StatisticsLeaveState extends State<StatisticsLeave> {
  final GetSalInfo api = GetSalInfo();
  List<String> listOf = [
    "Allocated Leaves",
    "Leave Balance",
    "Total Leaves Taken",
    "Paid Leaves Taken",
    "Unpaid Leaves Taken",
  ];
  List<dynamic> numOf = [];
  double leaveTaken, totalLeave, percent;
  PayslipHistory usersalnfo;

  _getMyLeaveInfo() async {
    return await api.getSalInfo().then((value) {
      numOf.add(value.data.payslipHistory[0].allocatedLeaves + "/month");
      numOf.add(value.data.payslipHistory[0].finalLeaveBalance);
      numOf.add(value.data.payslipHistory[0].totalLeaveTaken);
      numOf.add(value.data.payslipHistory[0].paidLeaves);
      numOf.add(value.data.payslipHistory[0].unpaidLeaves);
      leaveTaken = double.parse(value.data.payslipHistory[0].totalLeaveTaken);
      totalLeave = double.parse(value.data.payslipHistory[0].leaveBalance) +
          double.parse(value.data.payslipHistory[0].allocatedLeaves);
      percent = (leaveTaken / totalLeave);
      
      if (percent < 0) {
        percent = 0.0;
      }
      if (percent > 1) {
        percent = 0.9;
      }

      setState(() {
        loadLeaveStat = true;
      });
    });
  }

  List<Color> colorOf = [
    Colors.deepPurple[300],
    Colors.yellow[300],
    AppColors.GREEN_COLOR,
    AppColors.NAVY_BLUE,
    Colors.red[300]
  ];

  bool loadLeaveStat = false;
  @override
  void initState() {
    _getMyLeaveInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return loadLeaveStat
        ? Column(
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
                  itemBuilder: (_, int index) => ListStaticsLeave(
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
                percent: percent,
                center: new Text(
                  leaveTaken.toString() + "/" + totalLeave.toString(),
                  style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                footer: new Text(
                  "Final Leave Balance",
                  style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                      color: AppColors.LIGHTBLACK_COLOR,
                      fontFamily: 'SourceSans'),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: AppColors.GREEN_COLOR,
              ),
            ],
          )
        : Center();
  }
}

class ListStaticsLeave extends StatelessWidget {
  String itemName, itemNum;
  Color color;
  ListStaticsLeave(this.itemName, this.color, this.itemNum);
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
