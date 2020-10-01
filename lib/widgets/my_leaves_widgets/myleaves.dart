import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_excellence_hr/widgets/my_leaves_widgets/my_leaves_widgets.dart';



class MyLeavesList extends StatelessWidget {
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

  List<String> listLogo = ["CL", "Rh", "CL", "Rh", "CL", "Rh", "CL", "Rh"];

  @override
  Widget build(BuildContext context) {
    return Column(
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
        //              Container(height:300),
        ListView.separated(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          separatorBuilder: (BuildContext context, int index) =>
              Divider(height: 1, thickness: .5, color: Colors.grey[300]),
          itemBuilder: (_, int index) =>
              listLeaves(this.listOf[index], this.listLogo[index]),
          itemCount: this.listOf.length,
        ),
      ],
    );
  }
}



class listLeaves extends StatelessWidget {
  String leaveType, leaveIcon;
  listLeaves(this.leaveType, this.leaveIcon);
  @override
  Widget build(BuildContext context) {
    customDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext c) {
          return Dialog(
            child: Container(
              height: 245,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  UploadPic()
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
            child: Text(leaveIcon, style: TextStyle(fontSize: 10)),
            backgroundColor: Colors.deepPurple[300],
            foregroundColor: Colors.white,
            radius: 14,
          ),
          title: Text(leaveType,
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
                    "From 08-September-2020 to 10-September-2020",
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
                  "Applied On 29-September-2020",
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
                  "Status: Approved",
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
                    "Reason: Checking backend API working n shown  on My leaves page",
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
                  "Leave Type: Casual Leave",
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
                    "Reason For Late Apply: It was urgent n not known prior",
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
                RaisedButton(
                    color: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    onPressed: () {customDialog();},
                    child: Text(
                      "Upload Leave Document",
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'SourceSans'),
                    ))
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
          ]),
          trailing: Container(
            padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.blue),
            child: Text(
              "3 Day",
              style: TextStyle(
                  fontSize: 10, fontFamily: 'SourceSans', color: Colors.white),
            ),
          ),
        )
      ]),
    );
  }
}
