import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

import 'package:flutter_excellence_hr/widgets/navigate/comment_section.dart';
import 'package:flutter_excellence_hr/widgets/navigate/imp_notes_inventory.dart';
import 'package:universal_io/io.dart';
import '../navigate/navigate.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';

class YourInventory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Widget _getFAB() {
    //     if(Platform.isWindows){
    //       return FloatingActionButton(
    //           backgroundColor: Colors.deepOrange[800],
    //           child: Icon(Icons.add_shopping_cart),
    //           onPressed: null);
    //     }else{
    //       return FloatingActionButton(
    //           backgroundColor: Colors.deepOrange[800],
    //           child: Icon(Icons.add_alarm),
    //           onPressed: null);
    //     }
    //   }

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
    /*
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
    */
    
    floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
        },
        label: Text('Assign Device'),
        backgroundColor: AppColors.GREEN_COLOR,
      ),
      

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ImportantNotesInventory(),
              SizedBox(height: 20),
             InventoryItems(),
              SizedBox(height: 50),  
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
                      
              CommentSection(),
             InventoryDetails() , 
             SizedBox(height:20),
             Container(
                      margin: EdgeInsets.fromLTRB(8, 16, 8, 16),
                      child: Text(
                        'Recent Comments',
                        style: TextStyle(
                          color: AppColors.COMMENT_ICON,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),           
             CommentList(),
             SizedBox(height:50)
            ],
          ),
        ),
      ),
    );
    }
}