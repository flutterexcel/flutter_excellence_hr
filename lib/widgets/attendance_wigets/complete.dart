import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';

class CompletePending extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(margin: EdgeInsets.fromLTRB(8, 16, 8, 16),
      child: Column(
        children: [
          Row(children: <Widget>[
            Container(margin: EdgeInsets.only(left:16),
              child: Image(
                image: AssetImage('assets/images/greenicon.png'),
                width: 10,
                height: 10,
              ),
            ),
            Container(
                margin: EdgeInsets.fromLTRB(8, 16, 16, 16),
                child: Text(
                  "Completed",
                  style: TextStyle(
                      fontFamily: 'SourceSans', color: Colors.black45),
                )),
            Image(
              image: AssetImage('assets/images/pincicon.png'),
              width: 10,
              height: 10,
            ),
            Container(
                margin: EdgeInsets.fromLTRB(8, 16, 16, 16),
                child: Text(
                  "Pending",
                  style: TextStyle(
                      fontFamily: 'SourceSans', color: Colors.black45),
                )),
          ]),
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
              Container(margin: EdgeInsets.all(8), child: Text("0 Hrs 0 Min",style: TextStyle(color:Colors.black45,fontFamily: 'SourceSans' ),)),
              Expanded(child: Container(margin: EdgeInsets.all(8), child: Text("+ 216 Hrs 0 Mins",textAlign: TextAlign.right ,style: TextStyle(color:Colors.black45,fontFamily: 'SourceSans' ),)))
            ],
          ),
          Container(
            margin: EdgeInsets.fromLTRB(8, 8, 8, 24),
            height: 5,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.LIGHT_RED,
                ),
                color: AppColors.LIGHT_RED,
                borderRadius: BorderRadius.all(Radius.circular(5))),
          ),


        ],
      ),
    );
  }
}