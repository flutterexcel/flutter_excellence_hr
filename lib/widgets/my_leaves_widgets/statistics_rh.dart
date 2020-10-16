import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/model/leave/rh_stats.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_excellence_hr/services/leave/rh_stats.dart';
import 'package:percent_indicator/percent_indicator.dart';

class StatisticsRH extends StatefulWidget {
  StatisticsRH({Key key}) : super(key: key);

  @override
  _StatisticsRHState createState() => _StatisticsRHState();
}

class _StatisticsRHState extends State<StatisticsRH> {
  GetRhStats api = GetRhStats();
  RhStats rhstats;
  List<String> listOf = [
    "RH Approved",
    "RH Cancelled",
    "RH Per Quater",
    "Pending RH You Can Apply",
    "Cancelled RH: Compensation Used",
    "Pending Cancelled RH As Compensation"
  ];

  List<Color> colorOf = [
    AppColors.GREEN_COLOR,
    Colors.red[300],
    Colors.deepPurple[300],
    Colors.deepPurple[300],
    Colors.yellow[300],
    Colors.red[300]
  ];

  List<String> numOf = [];

  List<String> textOf = ["A", "R", "RH", "RH", "RH", "L"];
  int rhCanTaken, rhLeft;
  double percent;
  _getRhStats() async {
    return await api.getRhStats().then((value) {
      numOf.add(value.data.rhApproved.toString());
      numOf.add(value.data.rhRejected.toString());
      numOf.add(value.data.rhCanBeTakenThisQuarter.toString());
      numOf.add(value.data.rhCompensationPending.toString());
      numOf.add(value.data.rhLeft.toString());
      numOf.add(value.data.rhCompensationUsed.toString());
      rhCanTaken = value.data.rhCanBeTaken;
      rhLeft = value.data.rhLeft;
      percent = rhLeft / rhCanTaken;
      setState(() {
        showRhStats = true;
      });
    });
  }

  bool showRhStats = false;
  @override
  void initState() {
    _getRhStats();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return showRhStats
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
                        'RH ',
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
                  itemBuilder: (_, int index) => ListStaticsRH(
                    this.listOf[index],
                    this.colorOf[index],
                    this.numOf[index],
                    this.textOf[index],
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
                  rhLeft.toString() + "/" + rhCanTaken.toString(),
                  style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                footer: new Text(
                  "Total RH Available",
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

class ListStaticsRH extends StatelessWidget {
  String itemName, itemNum, text;
  Color color;
  ListStaticsRH(this.itemName, this.color, this.itemNum, this.text);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: CircleAvatar(
          child: Text(
            text,
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
