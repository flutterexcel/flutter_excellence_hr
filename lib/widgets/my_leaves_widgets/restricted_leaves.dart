import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/model/leave/get_rh.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_excellence_hr/services/leave/get_rh.dart';

class RestrictedLeave extends StatefulWidget {
  @override
  _RestrictedLeaveState createState() => _RestrictedLeaveState();
}

class _RestrictedLeaveState extends State<RestrictedLeave> {


  GetRh api = GetRh();
  bool loadRh = false;
  GetRhLeaves getRhLeaves;

  _getMyRhInfo() async {
    return await api.getRh().then((value) {
      getRhLeaves = value;
      setState(() {
        loadRh = true;
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
    return loadRh
        ? Column(
            children: <Widget>[
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 16, left: 16),
                      child: Text(
                        'Restricted Holiday List ',
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
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(height: 1, thickness: 1, color: Colors.grey[300]),
                  itemBuilder: (_, int index) =>
                      ListRestrictLeave(getRhLeaves.data.rhList[index]),
                  itemCount: getRhLeaves.data.rhList.length,
                ),
              )
            ],
          )
        : Padding(
          padding: const EdgeInsets.only(top: 200),
          child: CircularProgressIndicator(
              backgroundColor: Colors.cyan,
            ),
        );
  }
}

class ListRestrictLeave extends StatelessWidget {
  RhList list;

  ListRestrictLeave(this.list);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: CircleAvatar(
          child: Text(
            "1",
            style: TextStyle(fontSize: 10),
          ),
          backgroundColor: AppColors.GREEN_COLOR,
          foregroundColor: Colors.white,
          radius: 18,
        ),
        title: Text(
          list.name,
          style: TextStyle(fontSize: 14, fontFamily: 'SourceSans'),
        ),
        subtitle: Text(
          list.date.toString(),
          style: TextStyle(fontSize: 14, fontFamily: 'SourceSans'),
        ),
        // trailing: Container(
        //   width: 70,
        //   height: 30,
        //   child: RaisedButton(
        //       color: AppColors.NAVY_BLUE,
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(10),
        //       ),
        //       onPressed: () {},
        //       child: Text("Apply",
        //           style: TextStyle(
        //               fontFamily: 'SourceSans',
        //               fontSize: 12,
        //               color: Colors.white))),
        // ),
      ),
    );
  }
}
