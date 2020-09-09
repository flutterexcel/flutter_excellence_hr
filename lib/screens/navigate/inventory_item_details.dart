import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:intl/intl.dart'; // for date format

class InventoryDetails extends StatelessWidget {
  final usermachine;
  final userprofile;
  InventoryDetails(this.usermachine, this.userprofile);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Container(
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                    child: (Text(usermachine.machineName,
                        style: TextStyle(
                            fontSize: 20, color: AppColors.LIGHTBLACK_COLOR)))),
              ],
            ),
            Row(
              children: [
                Container(
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                    child: Text(usermachine.machineType,
                        style: TextStyle(
                            fontSize: 20, color: AppColors.DARK_GREY))),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                    child: (Text('ID',
                        style: TextStyle(
                            fontSize: 20, color: AppColors.LIGHTBLACK_COLOR)))),
              ],
            ),
            Row(
              children: [
                Container(
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                    child: Text(usermachine.id,
                        style: TextStyle(
                            fontSize: 20, color: AppColors.DARK_GREY))),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                    child: (Text('Assign Date',
                        style: TextStyle(
                            fontSize: 20, color: AppColors.LIGHTBLACK_COLOR)))),
              ],
            ),
            Row(
              children: [
                Container(
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                    child: Text(
                        DateFormat.yMMMMd()
                            .format(DateTime.parse(usermachine.assignDate)),
                        style: TextStyle(
                            fontSize: 20, color: AppColors.DARK_GREY))),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                    child: (Text('Serial Number',
                        style: TextStyle(
                            fontSize: 20, color: AppColors.LIGHTBLACK_COLOR)))),
              ],
            ),
            Row(
              children: [
                Container(
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                    child: Text(usermachine.serialNumber,
                        style: TextStyle(
                            fontSize: 20, color: AppColors.DARK_GREY))),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                    child: (Text('Interanal Serial No.',
                        style: TextStyle(
                            fontSize: 20, color: AppColors.LIGHTBLACK_COLOR)))),
              ],
            ),
            Row(
              children: [
                Container(
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                    child: Text(usermachine.billNumber,
                        style: TextStyle(
                            fontSize: 20, color: AppColors.DARK_GREY))),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                    child: (Text(userprofile.name,
                        style: TextStyle(
                            fontSize: 20, color: AppColors.LIGHTBLACK_COLOR)))),
              ],
            ),
            Row(
              children: [
                Container(
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                    child: Text(userprofile.jobtitle,
                        style: TextStyle(
                            fontSize: 20, color: AppColors.DARK_GREY))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
