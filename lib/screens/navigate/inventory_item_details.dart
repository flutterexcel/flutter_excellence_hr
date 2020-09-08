import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';

class InventoryDetails extends StatelessWidget {
  List<String> text1 = [
    "BSY ",
    "id",
    "Serial Number ",
    "Internal Serial Nummber",
    "Deepak Mishra"
  ];
  List<String> text2 = [
    "Chargers",
    "504",
    "BSYE1202000",
    "CHA001",
    "No Designation Data"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (_, int index) =>
            listDetails(this.text1[index], this.text2[index]),
        itemCount: this.text1.length,
      ),
    );
  }
}

class listDetails extends StatelessWidget {
  String text1, text2;
  listDetails(this.text1, this.text2);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Container(
                  padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                  child: (Text(text1,
                      style: TextStyle(
                          fontSize: 20, color: AppColors.LIGHTBLACK_COLOR)))),
            ],
          ),
          Row(
            children: [
              Container(
                  padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                  child: Text(text2,
                      style:
                          TextStyle(fontSize: 20, color: AppColors.DARK_GREY))),
            ],
          ),
        ],
      ),
    );
  }
}
