import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';

class DocumentDirectory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(8, 32, 0, 16),
                child: Text(
                  "DOCUMENT VIEW ",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'SourceSans',fontWeight: FontWeight.bold
                  ),
                )),
            Container(
                margin: EdgeInsets.fromLTRB(8, 32, 0, 16),
                child: Text(
                  "TYPE",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'SourceSans',
                      fontWeight: FontWeight.bold),
                )),
                Container(
                margin: EdgeInsets.fromLTRB(8, 32, 0, 16),
                child: Text(
                  "LAST MODIFIED",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'SourceSans',
                      fontWeight: FontWeight.bold),
                )),
          ],
        ),
        Container(color: AppColors.BACKGROUND_COLOR, margin: EdgeInsets.only(bottom:40), child: Text("No Data Avaliable",style: TextStyle(fontFamily:'OpenSans'),))
      ],
    );
  }
}
