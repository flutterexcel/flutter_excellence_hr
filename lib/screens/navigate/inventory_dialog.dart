import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_excellence_hr/widgets/navigate/comment_section.dart';
import 'navigate.dart';

class InventoryDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Text("Hello Shakti")
    );
  }
}
/*
class InventoryDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    customDialog() {
      return showDialog(
          context: context,
          builder: (BuildContext c) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                height: 450,
                width: MediaQuery.of(context).size.width,
                decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.BACKGROUND_COLOR),
                child: SingleChildScrollView(
                  child: Column(children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(8, 16, 8, 16),
                      child: Text(
                        'Device Details',
                        style: TextStyle(
                          color: AppColors.LIGHTBLACK_COLOR,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DropDown(),
                    InventoryItemDetails(
                      text1: "BSY ",
                      text2: "Chargers",
                    ),
                    InventoryItemDetails(
                      text1: "id",
                      text2: "504",
                    ),
                    InventoryItemDetails(
                        text1: "Assign Date", text2: "2018-08-08"),
                    InventoryItemDetails(
                      text1: "Serial Number",
                      text2: "BSYE1202000",
                    ),
                    InventoryItemDetails(
                      text1: "Internal Serial Nummber ",
                      text2: "CHA001",
                    ),
                    InventoryItemDetails(
                      text1: "Deepak Mishra",
                      text2: "No Designation Data",
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    for (int i = 0; i < 5; i++)
                      CommentSection(
                        name: 'Deepak Mishra',
                        date: '6th April20, 11:55 am',
                        comment: 'All Good',
                      ),
                  ]),
                ),
              ),
            );
          });
    }
  }
}

*/