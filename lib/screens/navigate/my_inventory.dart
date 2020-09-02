import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:universal_io/io.dart';
import '../navigate/navigate.dart';
import 'package:flutter_excellence_hr/widgets/navigate/imp_notes_inventory.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_excellence_hr/widgets/navigate/comment_section.dart';

class YourInventory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      print('OS: ${Platform.isIOS}');
    }
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

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('My Inventory',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/images/person.jpg'))
          ],
        ),
      ),
      drawer: Navigation(),
      floatingActionButton: CupertinoButton(
        onPressed: () => {},
        color: Colors.orange,
        borderRadius: new BorderRadius.circular(30.0),
        child: new Text(
          "Get Started",
          textAlign: TextAlign.center,
          style: new TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
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
            ],
          ),
        ),
      ),
    );
    }
}
