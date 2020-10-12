import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/model/leave/user_sal_info.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_excellence_hr/services/leave/sal_info.dart';

class BottomSection extends StatefulWidget {
  @override
  _BottomSectionState createState() => _BottomSectionState();
}

class _BottomSectionState extends State<BottomSection> {
  GetSalInfo api = GetSalInfo();
  UserSalaryInfo leave;
  _getLeave() async {
    await api.getSalInfo().then((value) {
      leave = value;
      setState(() {
        showLeaves = true;
      });
    });
  }

  bool showLeaves = false;
  @override
  void initState() {
    _getLeave();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return showLeaves
        ? Container(
            child: ListView.builder(
                itemCount: leave.data.payslipHistory.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return ListDataItems(leave.data.payslipHistory[index]);
                }),
          )
        : Center();
  }
}

class ListDataItems extends StatelessWidget {
  Map<String, String> monthsInYear = {
    "01": "Jan",
    "02": "Feb",
    "03": "Mar",
    "04": "Apr",
    "05": "May",
    "06": "Jun",
    "07": "Jul",
    "08": "Aug",
    "09": "Sep",
    "10": "Oct",
    "11": "Nov",
    "12": "Dec"
  };
  PayslipHistory totalLeave;
  ListDataItems(this.totalLeave);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      child:
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
        SizedBox(width: 16),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(8),
            color: AppColors.EDIT_TEXT_COLOR,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      child: Text(
                    'MONTH',
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'SourceSans',
                        fontWeight: FontWeight.bold,
                        color: AppColors.GREEN_COLOR),
                  )),
                  Container(
                      child: Text(
                    'TOTAL LEAVE TAKEN',
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'SourceSans',
                        fontWeight: FontWeight.bold,
                        color: Colors.red[300]),
                  )),
                  Container(
                      child: Text(
                    'LEAVE BALANCE',
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'SourceSans',
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple[300]),
                  )),
                  Container(
                      child: Text(
                    'ALLOACTED LEAVES',
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'SourceSans',
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple[300]),
                  )),
                  Container(
                      child: Text(
                    'PAID LEAVES',
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'SourceSans',
                        fontWeight: FontWeight.bold,
                        color: AppColors.GREEN_COLOR),
                  )),
                  Container(
                      child: Text(
                    'UNPAID LEAVES',
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'SourceSans',
                        fontWeight: FontWeight.bold,
                        color: Colors.red[300]),
                  )),
                  Container(
                      child: Text(
                    'FINAL LEAVE BALANCE',
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'SourceSans',
                        fontWeight: FontWeight.bold,
                        color: Colors.red[300]),
                  )),
                ]),
          ),
        ),
        Container(
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.only(right: 16),
          color: AppColors.EDIT_TEXT_COLOR,
          child: Column(children: <Widget>[
            Container(
                child: Text(
              monthsInYear[totalLeave.month] + ", " + totalLeave.year,
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'SourceSans',
                  color: AppColors.LIGHTBLACK_COLOR),
            )),
            Container(
                child: Text(
              totalLeave.totalLeaveTaken,
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'SourceSans',
                  color: AppColors.LIGHTBLACK_COLOR),
            )),
            Container(
                child: Text(
              totalLeave.leaveBalance,
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'SourceSans',
                  color: AppColors.LIGHTBLACK_COLOR),
            )),
            Container(
                child: Text(
              totalLeave.allocatedLeaves,
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'SourceSans',
                  color: AppColors.LIGHTBLACK_COLOR),
            )),
            Container(
                child: Text(
              totalLeave.paidLeaves,
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'SourceSans',
                  color: AppColors.LIGHTBLACK_COLOR),
            )),
            Container(
                child: Text(
              totalLeave.unpaidLeaves,
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'SourceSans',
                  fontWeight: FontWeight.bold,
                  color: AppColors.LIGHTBLACK_COLOR),
            )),
            Container(
                child: Text(
              totalLeave.finalLeaveBalance,
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'SourceSans',
                  fontWeight: FontWeight.bold,
                  color: AppColors.LIGHTBLACK_COLOR),
            )),
          ]),
        ),
      ]),
    );
  }
}
