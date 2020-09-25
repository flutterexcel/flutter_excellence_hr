import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_excellence_hr/screens/navigate/navigate.dart';
import 'package:flutter_excellence_hr/widgets/appbar.dart';

class PolicyDocuments extends StatelessWidget {
  List<String> listOf = [
    "POSH Compliance",
    "5th Saturdays Off",
    "New Leave Policy",
    "ABSENTEEISM FROM OFFICE",
    "RH Leave Clarifications",
    "NO FOOD INSIDE OFFICE",
    "Office Reporting Time",
    "Dress Code Policy w.r.t 1st Sept 2017",
    "Notice Period Announcement w.r.t 1st Jan",
    "Compensation Policy w.r.t 1st Jan 2017",
    "Leave Policy w.r.t 1st Jan 2017",
    "HR Bot & System Information Document",
    "HR Policy"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BACKGROUND_COLOR,
      appBar: AppBar(title: AppBarWidget(pageName: 'Policy Documents')),
      drawer: Navigation(),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(
            margin: EdgeInsets.all(6),
            padding: EdgeInsets.all(6),
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              separatorBuilder: (BuildContext context, int index) => Divider(
                height: 1,
                thickness: .5,
                color: Colors.grey[300],
              ),
              itemBuilder: (_, int index) => listDataItems(this.listOf[index]),
              itemCount: this.listOf.length,
            ),
          ),
        ]),
      )),
    );
  }
}

class listDataItems extends StatelessWidget {
  String itemName;
  listDataItems(this.itemName);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(7),
      padding: EdgeInsets.all(6),
      child:
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
        CircleAvatar(
          child: Text("1"),
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
        ),
        Image(image: AssetImage('assets/images/doc.png'),width: 50,height: 70),
        Padding(padding: EdgeInsets.all(8)),
        Expanded(
          child: Text(
            itemName,
            style: TextStyle(fontSize: 12,color: AppColors.LIGHTBLACK_COLOR,fontFamily: 'SourceSans',fontWeight: FontWeight.bold),
          ),
        )
      ]),
    );
  }
}