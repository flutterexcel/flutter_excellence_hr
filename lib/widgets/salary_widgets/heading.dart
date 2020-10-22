import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/model/salary/my_salary.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';

class Heading extends StatefulWidget {
  Salary salary;
  Heading({this.salary});
  @override
  _HeadingState createState() => _HeadingState(salary: salary);
}

class _HeadingState extends State<Heading> {
  Salary salary;
  _HeadingState({this.salary});
  bool salHeading = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var index = salary.data.salaryDetails.length - 1;
    return Column(
      children: <Widget>[
        Container(
          color: Colors.grey[100],
          margin: EdgeInsets.only(left: 16, right: 16),
          child: Row(
            children: [
              Container(
                  margin: EdgeInsets.only(top: 16, left: 8, bottom: 16),
                  child: Text(
                    'SALARY ',
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'OpenSans',
                        color: AppColors.LIGHTBLACK_COLOR),
                  )),
              Container(
                  margin: EdgeInsets.only(top: 16, bottom: 16),
                  child: Text(
                    'DETAILS ',
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'SourceSans',
                        fontWeight: FontWeight.bold,
                        color: AppColors.LIGHTBLACK_COLOR),
                  )),
            ],
          ),
        ),
        SizedBox(height: 30),
        Container(
          color: Colors.grey[200],
          margin: EdgeInsets.only(left: 16, right: 16),
          child: salHeading
              ? Column(children: <Widget>[
                  Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 16, left: 8),
                          child: Text(
                            'Applicabel From: ',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'OpenSans',
                                color: AppColors.LIGHTBLACK_COLOR),
                          )),
                      Container(
                          margin: EdgeInsets.only(top: 16),
                          child: Text(
                            salary
                                .data.salaryDetails[index].test.applicableFrom,
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'SourceSans',
                                fontWeight: FontWeight.bold,
                                color: AppColors.LIGHTBLACK_COLOR),
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 8, left: 8),
                          child: Text(
                            'Applicabel Till: ',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'OpenSans',
                                color: AppColors.LIGHTBLACK_COLOR),
                          )),
                      Container(
                          margin: EdgeInsets.only(top: 8),
                          child: Text(
                            salary
                                .data.salaryDetails[index].test.applicableTill,
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'SourceSans',
                                fontWeight: FontWeight.bold,
                                color: AppColors.LIGHTBLACK_COLOR),
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 8, left: 8),
                          child: Text(
                            'Increment Amount: ',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'OpenSans',
                                color: AppColors.LIGHTBLACK_COLOR),
                          )),
                      Container(
                          margin: EdgeInsets.only(top: 8),
                          child: Text(
                            salary.data.salaryDetails[index].incrementAmount,
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'SourceSans',
                                fontWeight: FontWeight.bold,
                                color: AppColors.LIGHTBLACK_COLOR),
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 8, left: 8),
                          child: Text(
                            'Leave Allocated: ',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'OpenSans',
                                color: AppColors.LIGHTBLACK_COLOR),
                          )),
                      Container(
                          margin: EdgeInsets.only(top: 8),
                          child: Text(
                            salary
                                .data.salaryDetails[index].test.leavesAllocated,
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'SourceSans',
                                fontWeight: FontWeight.bold,
                                color: AppColors.LIGHTBLACK_COLOR),
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 8, left: 8, bottom: 16),
                          child: Text(
                            'Updated On: ',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'OpenSans',
                                color: AppColors.LIGHTBLACK_COLOR),
                          )),
                      Container(
                          margin: EdgeInsets.only(top: 8, bottom: 16),
                          child: Text(
                            salary.data.salaryDetails[index].test.lastUpdatedOn,
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'SourceSans',
                                fontWeight: FontWeight.bold,
                                color: AppColors.LIGHTBLACK_COLOR),
                          )),
                    ],
                  ),
                ])
              : Center(),
        )
      ],
    );
  }
}
