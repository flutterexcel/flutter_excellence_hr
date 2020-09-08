import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';

class InventoryItems extends StatelessWidget {
  List<String> company = ["LENOVO ", "BSY", "JUMPER", "Quantam ", "Quantam QHMPL USB 2.0 LAN Adapter"];
  List<String> deviceType = [
    "Mouse2018",
    "Chargers",
    "Laptop",
    "LAN Adapter",
    "LAN Adapter"
  ];
  List<String> uid = [
    "MOUO27",
    "CHA001 ",
    "LAP047",
    "LA002",
    "LA015"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (_, int index) =>
            listItems(this.company[index], this.deviceType[index],this.uid[index]),
        itemCount: this.company.length,
      ),
    );
  }
}


class listItems extends StatelessWidget {
  String company, deviceType, uid;
  listItems(this.company, this.deviceType, this.uid);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Card(
        elevation: 7,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                          left: BorderSide(color: AppColors.DARK_GREY, width: 5)),
                    ),
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                    child: Text(
                      company,
                      style: TextStyle(fontSize: 20, color: AppColors.DARK_GREY),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                    decoration: BoxDecoration(
                        border: Border(
                            left: BorderSide(
                                color: AppColors.DARK_GREY, width: 5))),
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                    child: Text(deviceType,
                        style:
                            TextStyle(fontSize: 20, color: AppColors.DARK_GREY))),
              ],
            ),
            Row(
              children: [
                Container(
                    decoration: BoxDecoration(
                        border: Border(
                            left: BorderSide(
                                color: AppColors.DARK_GREY, width: 5))),
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                    child: (Text(uid,
                        style: TextStyle(
                            fontSize: 20, color: AppColors.DARK_GREY)))),
              ],
            )
          ],
        ),
      ),
    );
  }
}