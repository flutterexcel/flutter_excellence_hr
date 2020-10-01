import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';

class TotalEarning extends StatelessWidget {
  List<String> listOf = [
    "Basic",
    "HRA",
    "Conveyance",
    "Medical Allowance",
    "Special Allowance",
  ];

  List<String> vaueOf = [
    "7500",
    "1500",
    "1500",
    "1500",
    "3000",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 16, right: 16),
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey[300]),
            color: AppColors.GREEN_COLOR,
          ),
          child: Row(
            children: [
              Container(
                  margin: EdgeInsets.only(top: 16, left: 8, bottom: 16),
                  child: Text(
                    'Total ',
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'OpenSans',
                        color: Colors.white),
                  )),
              Container(
                  margin: EdgeInsets.only(top: 16, bottom: 16),
                  child: Text(
                    'Earnings ',
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'SourceSans',
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey[300])),
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            separatorBuilder: (BuildContext context, int index) => Divider(
              height: 1,
              thickness: .5,
              color: Colors.grey[300],
            ),
            itemBuilder: (_, int index) =>
                listEarningItems(this.listOf[index], this.vaueOf[index]),
            itemCount: this.listOf.length,
          ),
        ),
      ],
    );
  }
}

class listEarningItems extends StatelessWidget {
  String itemName, itemValue;
  listEarningItems(this.itemName, this.itemValue);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(6),
        child: ListTile(
          title: Text(
            itemName,
            style: TextStyle(
                color: AppColors.LIGHTBLACK_COLOR,
                fontSize: 14,
                fontFamily: 'SourceSans'),
          ),
          trailing: Text(itemValue,
              style: TextStyle(
                  color: AppColors.LIGHTBLACK_COLOR,
                  fontSize: 14,
                  fontFamily: 'SourceSans')),
        ));
  }
}
