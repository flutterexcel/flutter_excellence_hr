import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';

class BottomSection extends StatelessWidget {
  List<String> listOf = [
    "January",
    "January",
    "January",
    "January",
    "January",
    "January",
    "January",
    "January",
    "January",
    "January",
    "January",
    "January"
  ];

  List<String> totalLeave = [
    "1",
    "2",
    "4",
    "2",
    "3",
    "1",
    "2",
    "1",
    "3",
    "4",
    "1",
    "2"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context,int index){ 
          return listDataItems(this.listOf[index], this.totalLeave[index] 
            );
        } 
        ), 
    );
  }
}

class listDataItems extends StatelessWidget {
  String monthName, totalLeave;
  listDataItems(this.monthName, this.totalLeave);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      child: Row(children: <Widget>[
  SizedBox(width:16),
        Container(padding: EdgeInsets.all(8), color: AppColors.EDIT_TEXT_COLOR,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
              Container(
        child: Text(
                'MONTH',
                style: TextStyle(
          fontSize: 12,
          fontFamily: 'SourceSans',
          fontWeight: FontWeight.bold,
          color:AppColors.GREEN_COLOR),
              )),
              Container(
        child: Text(
                'TOTAL LEAVE TAKEN',
                style: TextStyle(
          fontSize: 12,
          fontFamily: 'SourceSans',
          fontWeight: FontWeight.bold,
          color: Colors.red[300]),
              )),
              Container(
        child: Text(
                'LEAVE BALANCE',
                style: TextStyle(
          fontSize: 12,
          fontFamily: 'SourceSans',
          fontWeight: FontWeight.bold,
          color: Colors.deepPurple[300]),
              )),
              Container(
        child: Text(
                'ALLOACTED LEAVES',
                style: TextStyle(
          fontSize: 12,
          fontFamily: 'SourceSans',
          fontWeight: FontWeight.bold,
          color: Colors.deepPurple[300]),
              )),
              Container(
        child: Text(
                'PAID LEAVES',
                style: TextStyle(
          fontSize: 12,
          fontFamily: 'SourceSans',
          fontWeight: FontWeight.bold,
          color:AppColors.GREEN_COLOR),
              )),
              Container(
        child: Text(
                'UNPAID LEAVES',
                style: TextStyle(
          fontSize: 12,
          fontFamily: 'SourceSans',
          fontWeight: FontWeight.bold,
          color: Colors.red[300]),
              )),
            ]),
          ),
        Container(padding: EdgeInsets.all(8), color: AppColors.EDIT_TEXT_COLOR,

          child: Column(children: <Widget>[
            Container(
                child: Text(
              monthName,
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'SourceSans',
                  color: AppColors.LIGHTBLACK_COLOR),
            )),
            Container(
                child: Text(
              totalLeave,
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'SourceSans',
                  color: AppColors.LIGHTBLACK_COLOR),
            )),
            Container(
                child: Text(
              '1',
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'SourceSans',
                  color: AppColors.LIGHTBLACK_COLOR),
            )),
            Container(
                child: Text(
              '2',
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'SourceSans',
                  color: AppColors.LIGHTBLACK_COLOR),
            )),
            Container(
                child: Text(
              '2',
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'SourceSans',
                  color: AppColors.LIGHTBLACK_COLOR),
            )),
            Container(
                child: Text(
              '0',
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'SourceSans',
                  fontWeight: FontWeight.bold,
                  color: AppColors.LIGHTBLACK_COLOR),
            )),
          ]),
        ),
        SizedBox(width:16),
        Container(padding: EdgeInsets.all(8),color: AppColors.EDIT_TEXT_COLOR,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
            Container(
                child: Text(
              'MONTH',
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'SourceSans',
                  fontWeight: FontWeight.bold,
                  color: AppColors.GREEN_COLOR),
            )),
            Container(
                child: Text(
              'TOTAL LEAVE TAKEN',
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'SourceSans',
                  fontWeight: FontWeight.bold,
                  color: Colors.red[300]),
            )),
            Container(
                child: Text(
              'LEAVE BALANCE',
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'SourceSans',
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple[300]),
            )),
            Container(
                child: Text(
              'ALLOACTED LEAVES',
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'SourceSans',
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple[300]),
            )),
            Container(
                child: Text(
              'PAID LEAVES',
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'SourceSans',
                  fontWeight: FontWeight.bold,
                  color: AppColors.GREEN_COLOR),
            )),
            Container(
                child: Text(
              'UNPAID LEAVES',
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'SourceSans',
                  fontWeight: FontWeight.bold,
                  color:Colors.red[300]),
            )),
          ]),
        ),
        Container(padding: EdgeInsets.all(8), color: AppColors.EDIT_TEXT_COLOR,
          child: Column(children: <Widget>[
            Container(
                child: Text(
              monthName,
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'SourceSans',
                  color: AppColors.LIGHTBLACK_COLOR),
            )),
            Container(
                child: Text(
              totalLeave,
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'SourceSans',
                  color: AppColors.LIGHTBLACK_COLOR),
            )),
            Container(
                child: Text(
              '1',
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'SourceSans',
                  color: AppColors.LIGHTBLACK_COLOR),
            )),
            Container(
                child: Text(
              '2',
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'SourceSans',
                  color: AppColors.LIGHTBLACK_COLOR),
            )),
            Container(
                child: Text(
              '2',
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'SourceSans',
                  color: AppColors.LIGHTBLACK_COLOR),
            )),
            Container(
                child: Text(
              '0',
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'SourceSans',
                  fontWeight: FontWeight.bold,
                  color: AppColors.LIGHTBLACK_COLOR),
            )),
          ]),
        ),        
      ]),
    );
  }
}
