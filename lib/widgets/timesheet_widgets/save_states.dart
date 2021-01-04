import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/model/timesheet/timesheet.dart';
import 'package:flutter_excellence_hr/model/tmsreport/tmsreport.dart';

class SaveStates extends StatelessWidget {
  TMSReport tmsReport;
  SaveStates({this.tmsReport});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(8, 8, 8, 7),
                height: 20,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: FlatButton(
                    onPressed: null,
                    child: Text('Status: saved',
                        style: TextStyle(color: Colors.white, fontSize: 11))),
              ),
            ),
            Expanded(flex: 2, child: Container()),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Image(
              image: AssetImage('assets/images/tracker.png'),
              height: 60,
            )),
            Expanded(flex: 2, child: Container()),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Container(
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Text(
                      "Tow Api Integrated",
                      //  tmsReport.data.report,
                      style: TextStyle(fontFamily: 'SourceSans'),
                    ))),
            Expanded(flex: 2, child: Container()),
          ],
        ),
      ],
    );
  }
}
