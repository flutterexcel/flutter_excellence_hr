import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_excellence_hr/widgets/navigate/comment_section.dart';
import 'package:flutter_excellence_hr/widgets/navigate/imp_notes_inventory.dart';
import 'package:flutter_excellence_hr/widgets/navigate/profile_pic.dart';
import '../navigate/inventory_items.dart';
import '../navigate/recent_comments.dart';
import '../navigate/dropdown_inventory.dart';
import '../navigate/inventory_item_details.dart';

class MyInventory extends StatefulWidget {
  @override
  _MyInventoryState createState() => _MyInventoryState();
}

class _MyInventoryState extends State<MyInventory> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                InventoryProfilePic(),
                ImportantNotesInventory(),
                SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    customDialog();
                  },
                  child: InventoryItems(
                    company: 'LENOVO', //company
                    deviceType: 'Mouse2018', //device type
                    uid: 'MOUO27', // Uid
                  ),
                ),
                SizedBox(height: 10),
                InventoryItems(
                  company: 'BSY',
                  deviceType: 'Chargers',
                  uid: 'CHA001',
                ),
                SizedBox(height: 10),
                InventoryItems(
                  company: 'JUMPER',
                  deviceType: 'Laptop',
                  uid: 'LAP047',
                ),
                SizedBox(height: 10),
                InventoryItems(
                  company: 'Quantam',
                  deviceType: 'LAN Adapter',
                  uid: 'LA002',
                ),
                SizedBox(height: 10),
                InventoryItems(
                  company: 'Quantam QHMPL USB 2.0 LAN Adapter',
                  deviceType: 'LAN Adapter',
                  uid: 'LA015',
                ),
                SizedBox(height: 50),
                DropDown(),
                SizedBox(height: 20),
                RecentComments(),
                SizedBox(height: 10),
                Divider(
                  color: AppColors.DARK_GREY,
                  thickness: 2,
                  indent: 16,
                  endIndent: 16,
                ),
                SizedBox(height: 20),
                CommentSection(
                  name: 'Deepak Mishra',
                  date: '6th April20, 11:55 am',
                  comment: 'All Good',
                ),
                SizedBox(height: 20),
                for (int i = 0; i < 5; i++)
                  CommentSection(
                    name: 'Deepak Mishra',
                    date: '11th March20, 12:55 pm',
                    comment: 'All Good',
                  ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  customDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext c) {
          return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              height: 450,
              width: MediaQuery.of(context).size.width,
              decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.BACKGROUND_COLOR),
              child: SingleChildScrollView(
                child: Column(children: <Widget>[
                  Text(
                    'Device Details',
                    style: TextStyle(
                        color: AppColors.LIGHTBLACK_COLOR,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
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
                   RecentComments(),
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
