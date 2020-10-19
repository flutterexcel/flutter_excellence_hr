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
  bool show = false;

  Future<dynamic> _getPolicy() async {
    return await api.getPolicy();
  }

  PolicyDocument policy;
  @override
  void initState() {
    _getPolicy().then((value) {
      policy = value;
      setState(() {
        show = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return show
        ? Scaffold(
            backgroundColor: AppColors.BACKGROUND_COLOR,
            appBar: AppBar(
                title: AppBarWidget(pageName: 'Policy Documents directory')),
            drawer: Navigation(),
            body: SafeArea(
              child: SingleChildScrollView(
                  child: Column(children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(8, 32, 8, 32),
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      border: Border(
                          left: BorderSide(width: 1, color: Colors.grey[300]),
                          right: BorderSide(width: 1, color: Colors.grey[300]),
                          top: BorderSide(width: 2, color: Colors.grey[300]),
                          bottom:
                              BorderSide(width: 1, color: Colors.grey[300]))),
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(
                      height: 1,
                      thickness: .5,
                      color: Colors.grey[300],
                    ),
                    itemBuilder: (_, int index) =>
                        ListDataItems(policy.data[index]),
                    itemCount: policy.data.length,
                  ),
                ),
              ])),
            ),
          )
        : Scaffold(
            backgroundColor: Colors.white,
            body: Center(
                child: CircularProgressIndicator(backgroundColor: Colors.cyan)),
          );
  }
}

class ListDataItems extends StatelessWidget {
  Data data;
  ListDataItems(this.data);
  
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
        Checkbox(value: data.read == 1 ? true : false, onChanged: null),
        InkWell(
          onTap: () {
            _launchURL(data.link);
          },
          child: Image(
              image: AssetImage('assets/images/doc.png'),
              width: 40,
              height: 60),
        ),
        Padding(padding: EdgeInsets.all(8)),
        Expanded(
          child: Text(
            data.name,
            style: TextStyle(
                fontSize: 12,
                color: AppColors.LIGHTBLACK_COLOR,
                fontFamily: 'SourceSans',
                fontWeight: FontWeight.bold),
          ),
        )
      ]),
    );
  }
}
