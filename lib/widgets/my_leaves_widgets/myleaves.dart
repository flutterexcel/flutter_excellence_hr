import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/model/leave/cancel_leave.dart';
import 'package:flutter_excellence_hr/model/leave/leave.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_excellence_hr/services/leave/cancel_leave.dart';
import 'package:flutter_excellence_hr/services/leave/leaves.dart';
import 'package:flutter_excellence_hr/widgets/my_leaves_widgets/my_leaves_widgets.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:url_launcher/url_launcher.dart';

class MyLeavesList extends StatefulWidget {
  @override
  MyLeavesListState createState() => MyLeavesListState();
}

class MyLeavesListState extends State<MyLeavesList> {
  List<String> listOf = [
    "Casual Leave",
    "Rh Compansation",
    "Casual Leave",
    "Rh Compansation",
    "Casual Leave",
    "Rh Compansation",
    "Casual Leave",
    "Rh Compansation"
  ];

  GetLeaves api = GetLeaves();

  Leave leaves;

  bool loadLeaves = false;

  _getMyRhInfo() async {
    return await api.getLeaves().then((value) {
      leaves = value;
      setState(() {
        loadLeaves = true;
      });
    });
  }

  @override
  void initState() {
    _getMyRhInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return loadLeaves
        ? Column(
            children: <Widget>[
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 16, left: 16, bottom: 16),
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
              Divider(height: 1, thickness: .5, color: Colors.grey[300]),
              ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(height: 1, thickness: .5, color: Colors.grey[300]),
                itemBuilder: (_, int index) =>
                    ListLeaves(leaves.data.leaves[index]),
                itemCount: 15, //leaves.data.leaves.length,
              ),
            ],
          )
        : Center();
  }
}

class ListLeaves extends StatefulWidget {
  var leaves;
  ListLeaves(this.leaves);
  @override
  _ListLeavesState createState() => _ListLeavesState(leaves);
}

class _ListLeavesState extends State<ListLeaves> {
  _ListLeavesState(this.leaves);
  Leaves leaves;
  //ListLeaves(this.leaves);
  bool openLink = false;
  CancelMyLeave cancelMyLeave = CancelMyLeave();
  CancelLeave cancelLeave;
  final RoundedLoadingButtonController _btnController =
      new RoundedLoadingButtonController();

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _cancelLeave(String date) async {
    return await cancelMyLeave.cancelMyLeave(date).then((value) {
      if (value.error == 1) {
        print('failed');
        _btnController.error();
      } else if (value.error == 0) {
        print('success');
        _btnController.success();
      }
      _doReset();
    });
  }

  void _doReset() async {
    Timer(Duration(seconds: 2), () {
      _btnController.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    customDialog(String leaveid) {
      return showDialog(
          context: context,
          builder: (BuildContext c) {
            return Dialog(
              child: Container(
                height: 245,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    UploadPic(
                      leavid: leaveid,
                    ),
                  ],
                ),
              ),
            );
          });
    }

    return Container(
      margin: EdgeInsets.all(7),
      padding: EdgeInsets.fromLTRB(6, 0, 0, 6),
      child: Column(children: <Widget>[
        ListTile(
          leading: CircleAvatar(
            child: Text('L', style: TextStyle(fontSize: 10)),
            backgroundColor: Colors.deepPurple[300],
            foregroundColor: Colors.white,
            radius: 14,
          ),
          title: Text(leaves.leaveType,
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'SourceSans',
                  fontWeight: FontWeight.bold)),
          subtitle: Column(children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    "From " + leaves.fromDate + " to " + leaves.toDate,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'SourceSans',
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Applied On " + leaves.appliedOn,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'SourceSans',
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Status: " + leaves.status,
                  style: TextStyle(
                    fontSize: 10,
                    fontFamily: 'SourceSans',
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    "Reason: " + leaves.reason,
                    style: TextStyle(
                      fontSize: 10,
                      fontFamily: 'SourceSans',
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Leave Type: " + leaves.leaveType,
                  style: TextStyle(
                    fontSize: 10,
                    fontFamily: 'SourceSans',
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    "Reason For Late Apply: " + leaves.lateReason,
                    style: TextStyle(
                      fontSize: 10,
                      fontFamily: 'SourceSans',
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RaisedButton(
                    key: Key('uploadDocumentKey'),
                    color: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    onPressed: () {
                      customDialog(leaves.id);
                    },
                    child: Text(
                      "Upload Document",
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'SourceSans'),
                    )),
                leaves.docLink.contains("N/A")
                    ? Center()
                    : Flexible(
                        child: Container(
                          margin: EdgeInsets.only(left: 16),
                          child: RaisedButton(
                              color: Colors.lightBlueAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              onPressed: () {
                                _launchURL(leaves.docLink);
                              },
                              child: Text(
                                "View",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'SourceSans'),
                              )),
                        ),
                      ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    "* Upload file size should be less than than 1 MB",
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'SourceSans',
                        color: Colors.redAccent),
                  ),
                ),
              ],
            ),
            leaves.status.contains('Pending')
                ? RoundedLoadingButton(
                    borderRadius: 5,
                    height: 40,
                    width: 100,
                    errorColor: Colors.blue,
                    color: Colors.red[600],
                    controller: _btnController,
                    onPressed: () {
                      _cancelLeave(leaves.fromDate);
                    },
                    child: Text(
                      "Cancel Leave",
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'SourceSans'),
                    ))
                : Center(),
          ]),
          trailing: Container(
            padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.blue),
            child: Text(
              leaves.noOfDays,
              style: TextStyle(
                  fontSize: 10, fontFamily: 'SourceSans', color: Colors.white),
            ),
          ),
        )
      ]),
    );
  }
}
