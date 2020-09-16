import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';

class TimeCompensate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    customDialog() {
      return showDialog(
          context: context,
          builder: (BuildContext c) {
            return Dialog(
              child: Container(
                height: 250,
                width: MediaQuery.of(context).size.width,
                child: Column(children: <Widget>[
                  Row(
                    children: [
                      Container(
                          margin: EdgeInsets.fromLTRB(16, 24, 16, 0),
                          child: Text(
                            "Time Comapnsation Summary",
                            style: TextStyle(
                                color: AppColors.THEME_COLOR,
                                fontSize: 20,
                                fontFamily: 'OpenSans'),
                          )),
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
                      child: Text(
                        'Nothing To Compensate',
                        style: TextStyle(
                            color: AppColors.THEME_COLOR,
                            fontSize: 16,
                            fontFamily: 'OpenSans'),
                      ))
                ]),
              ),
            );
          });
    }

    return Card(
      child: Column(children: <Widget>[
        Row(
          children: [
            Container(
                margin: EdgeInsets.all(8),
                child: Text(
                  "Time to Compansate",
                  style: TextStyle(
                      color: Colors.black45, fontFamily: 'SourceSans'),
                )),
            Expanded(
                child: Container(
                    margin: EdgeInsets.all(8),
                    child: Text(
                      "0.00%",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          color: Colors.black45, fontFamily: 'SourceSans'),
                    )))
          ],
        ),
        Container(
          margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
          height: 5,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey[200],
              ),
              color: Colors.grey[200],
              borderRadius: BorderRadius.all(Radius.circular(5))),
        ),
        Row(
          children: [
            Container(
                margin: EdgeInsets.only(left: 8),
                child: InkWell(
                  onTap: () {
                    customDialog();
                  },
                  child: Icon(
                    Icons.info_outline_rounded,
                    color: AppColors.LIGHT_YELLOW,
                  ),
                )),
          ],
        ),
        Row(
          children: [
            Container(
                margin: EdgeInsets.all(8),
                child: Text(
                  "Total Working",
                  style: TextStyle(
                      color: Colors.black45, fontFamily: 'SourceSans'),
                )),
            Expanded(
                child: Container(
                    margin: EdgeInsets.all(8),
                    child: Text(
                      "216 Hrs 0 Mins",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          color: Colors.black45, fontFamily: 'SourceSans'),
                    )))
          ],
        ),
      ]),
    );
  }
}
