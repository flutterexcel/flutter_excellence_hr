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
             Row(
               children: [
                 Container(
                          margin: EdgeInsets.fromLTRB(16, 16, 8, 16),
                          child: Text(
                            'Recent Comments',textAlign:TextAlign.left,
                            style: TextStyle(
                              color: AppColors.LIGHTBLACK_COLOR,
                              fontSize: 25,fontWeight: FontWeight.w400
                            ),
                          ),
                        ),
               ],
             ), 
             Divider(height: 2,endIndent: 16,indent: 16, thickness:2, color: AppColors.COMMENT_ICON,),          
             CommentList(),
             SizedBox(height:50)
            ],
          ),
        ),
      ),
    );
    }
}