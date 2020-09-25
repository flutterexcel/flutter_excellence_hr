import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/model/policy/policy_document.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_excellence_hr/screens/navigate/navigate.dart';
import 'package:flutter_excellence_hr/services/policy/get_policy.dart';
import 'package:flutter_excellence_hr/widgets/appbar.dart';
import 'package:url_launcher/url_launcher.dart';

class PolicyDocuments extends StatefulWidget {
  @override
  _PolicyDocumentsState createState() => _PolicyDocumentsState();
}

class _PolicyDocumentsState extends State<PolicyDocuments> {
  GetPolicy api = GetPolicy();
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
  Future<dynamic> _getPolicy() async {
    return await api.getPolicy();
  }

  PolicyDocument policy;
  @override
  void initState() {
    _getPolicy().then((value) => policy);
    super.initState();
  }

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
              itemBuilder: (_, int index) => ListDataItems(policy.data[index]),
              itemCount: policy.data.length,
            ),
          ),
        ]),
      )),
    );
  }
}

class ListDataItems extends StatelessWidget {
  Data data;

  ListDataItems(this.data);

  _launchURL(String url) async {
    //const url = 'https://flutter.dev';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

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
        Image(
            image: AssetImage('assets/images/doc.png'), width: 50, height: 70),
        Padding(padding: EdgeInsets.all(8)),
        InkWell(
            onTap: _launchURL(data.link),
            child: Expanded(
              child: Text(
                data.name,
                style: TextStyle(
                    fontSize: 12,
                    color: AppColors.LIGHTBLACK_COLOR,
                    fontFamily: 'SourceSans',
                    fontWeight: FontWeight.bold),
              ),
            ))
      ]),
    );
  }
}
