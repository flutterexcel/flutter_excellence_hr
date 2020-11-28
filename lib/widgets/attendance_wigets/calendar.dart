import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/model/attendance/month_attendance.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_excellence_hr/widgets/attendance_wigets/apply_attendance.dart';

class CalendarScreen extends StatelessWidget {
  final MonthAttendance monthAttendance;
  CalendarScreen({this.monthAttendance});
  Key _key;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      key: Key('leavekey'),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (_, index) => monthAttendance
                  .data.attendance[index].dayType ==
              'NON_WORKING_DAY'
          ? InkWell(
              onTap: () {
                print('tap-23');
              },
              child: Container(
                  margin: EdgeInsets.all(2),
                  height: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            color: Colors.yellowAccent,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: EdgeInsets.fromLTRB(4, 8, 0, 16),
                          child: Row(
                            children: [
                              Text(monthAttendance.data.attendance[index].date),
                            ],
                          )),
                      Container(
                        height: 30,
                        color: Colors.yellowAccent,
                      ),
                      Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: Colors.yellowAccent,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.white)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  monthAttendance
                                      .data.attendance[index].dayText,
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ],
                          ))
                    ],
                  )),
            )
          : monthAttendance.data.attendance[index].adminAlert == 1
              ? InkWell(
                  onTap: () {
                    _popupDialog(context, index);
                  },
                  child: Container(
                      key: Key('leavekey-$index'),
                      margin: EdgeInsets.all(2),
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                color: monthAttendance
                                            .data.attendance[index].dayType ==
                                        'FUTURE_WORKING_DAY'
                                    ? Colors.grey[200]
                                    : AppColors.NAVY_BLUE,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              padding: EdgeInsets.fromLTRB(4, 8, 0, 16),
                              child: Row(
                                children: [
                                  Text(
                                      "* " +
                                          monthAttendance
                                              .data.attendance[index].date,
                                      style: TextStyle(
                                        color: Colors.white,
                                      )),
                                ],
                              )),
                          Container(
                            height: 30,
                            color: monthAttendance
                                        .data.attendance[index].dayType ==
                                    'FUTURE_WORKING_DAY'
                                ? Colors.grey[200]
                                : AppColors.NAVY_BLUE,
                          ),
                          Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  color: monthAttendance
                                              .data.attendance[index].dayType ==
                                          'FUTURE_WORKING_DAY'
                                      ? Colors.grey[200]
                                      : AppColors.NAVY_BLUE,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.white)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: monthAttendance.data
                                                .attendance[index].dayType ==
                                            'FUTURE_WORKING_DAY'
                                        ? Text("")
                                        : Text(
                                            monthAttendance
                                                .data
                                                .attendance[index]
                                                .adminAlertMessage,
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white),
                                          ),
                                  ),
                                ],
                              ))
                        ],
                      )),
                )
              : monthAttendance.data.attendance[index].dayType == 'LEAVE_DAY'
                  ? InkWell(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.all(2),
                        height: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                padding: EdgeInsets.fromLTRB(4, 8, 0, 16),
                                child: Row(
                                  children: [
                                    Text(
                                        monthAttendance
                                            .data.attendance[index].date,
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                )),
                            Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'ON LEAVE',
                                        style: TextStyle(
                                            fontSize: 11, color: Colors.white),
                                      ),
                                    ),
                                  ],
                                )),
                            Divider(
                              height: 2,
                              endIndent: 4,
                              indent: 4,
                              thickness: 1,
                              color: Colors.red,
                            ),
                            Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        monthAttendance
                                            .data.attendance[index].dayText,
                                        style: TextStyle(
                                            fontSize: 11, color: Colors.white),
                                      ),
                                    ),
                                  ],
                                )),
                            monthAttendance.data.attendance[index].extraTime ==
                                    0
                                ? Container(
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: Colors.blueAccent,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center())
                                : Container(
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: monthAttendance
                                                  .data
                                                  .attendance[index]
                                                  .extraTimeStatus ==
                                              '-'
                                          ? Colors.redAccent
                                          : Colors.greenAccent,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            monthAttendance.data
                                                .attendance[index].extraTime,
                                            style: TextStyle(
                                                fontSize: 11,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ))
                          ],
                        ),
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        
                        _popupDialog(context, index);
                      },
                      child: Container(
                        key: Key('$index'),
                        margin: EdgeInsets.all(2),
                        height: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                padding: EdgeInsets.fromLTRB(4, 8, 0, 16),
                                child: Row(
                                  children: [
                                    Text(monthAttendance
                                        .data.attendance[index].date),
                                  ],
                                )),
                            Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.white10,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        monthAttendance
                                                .data.attendance[index].inTime +
                                            " - " +
                                            monthAttendance
                                                .data.attendance[index].outTime,
                                        style: TextStyle(
                                            fontSize: 11, color: Colors.black),
                                      ),
                                    ),
                                  ],
                                )),
                            // Divider(
                            //   height: 1,
                            //   endIndent: 1,
                            //   indent: 1,
                            //   thickness: 1,
                            //   color: Colors.blue[200],
                            // ),
                            Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.white10,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        Duration(
                                                    seconds: monthAttendance
                                                        .data
                                                        .attendance[index]
                                                        .secondsActualWorkedTime)
                                                .toString()
                                                .split('.')
                                                .first
                                                .padLeft(8, "0") +
                                            " Total Work Time",
                                        style: TextStyle(
                                            fontSize: 11, color: Colors.black),
                                      ),
                                    ),
                                  ],
                                )),
                            monthAttendance.data.attendance[index].extraTime ==
                                    0
                                ? Container(
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: Colors.blueAccent,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center())
                                : Container(
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: monthAttendance
                                                  .data
                                                  .attendance[index]
                                                  .extraTimeStatus ==
                                              '-'
                                          ? Colors.redAccent
                                          : Colors.greenAccent,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            monthAttendance.data
                                                .attendance[index].extraTime,
                                            style: TextStyle(
                                                fontSize: 11,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ))
                          ],
                        ),
                      ),
                    ),
      itemCount: monthAttendance.data.attendance.length,
    );
  }

  void _popupDialog(BuildContext context, int index) {
    showDialog(
        context: context,
        builder: (context) {
          return ApplyAttendance(
              monthAttendance: monthAttendance, index: index);
        });
  }
}
