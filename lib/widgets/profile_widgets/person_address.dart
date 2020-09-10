import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_excellence_hr/screens/navigate/navigate.dart';

class PersonAddress extends StatelessWidget {
  final empName = TextEditingController();
  final currAddress = TextEditingController();
  final permanentAddress = TextEditingController();
  final personalContact = TextEditingController();
  final emergencyContact = TextEditingController();
  final personalEmail = TextEditingController();
  final medicalCondition = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  "Name",
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 18,
                      color: AppColors.MIDIUM_BLACK),
                )),
          ],
        ),
        Container(
          margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
          height: 35,
          color: AppColors.EDIT_TEXT_COLOR,
          child: TextFormField(
            enabled: false,
            controller: empName,
                decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),           
          ),
        ),
        Row(
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  "Marital Status",
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 18,
                      color: AppColors.MIDIUM_BLACK),
                )),
          ],
        ),
        DropDown(),
        Row(
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  "Current Address",
                  style: TextStyle(
                      fontFamily: 'SourceSans',
                      fontSize: 18,
                      color: AppColors.MIDIUM_BLACK),
                )),
          ],
        ),
        Container(
          margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
          height: 70,
          color: AppColors.EDIT_TEXT_COLOR,
          child: TextFormField(
            enabled: false,
            controller: currAddress,
            textInputAction: TextInputAction.newline,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Row(
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  "Permanent Address",
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 18,
                      color: AppColors.MIDIUM_BLACK),
                )),
          ],
        ),
        Container(
          margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
          height: 70,
          color: AppColors.EDIT_TEXT_COLOR,
          child: TextFormField(
            enabled: false,
            controller: currAddress,
            textInputAction: TextInputAction.newline,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Row(
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  "Personal Contact Number",
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 18,
                      color: AppColors.MIDIUM_BLACK),
                )),
          ],
        ),
        Container(
          margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
          height: 35,
          color: AppColors.EDIT_TEXT_COLOR,
          child: TextFormField(
            enabled: false,
            controller: personalContact,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Row(
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  "Emergency Contact",
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 18,
                      color: AppColors.MIDIUM_BLACK),
                )),
          ],
        ),
        Container(
          margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
          height: 35,
          color: AppColors.EDIT_TEXT_COLOR,
          child: TextFormField(
            enabled: false,
            controller: emergencyContact,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Row(
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  "Personal Email Address ",
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 18,
                      color: AppColors.MIDIUM_BLACK),
                )),
          ],
        ),
        Container(
          margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
          height: 35,
          color: AppColors.EDIT_TEXT_COLOR,
          child: TextFormField(
            enabled: false,
            controller: personalEmail,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Row(
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  "Blood Group ",
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 18,
                      color: AppColors.MIDIUM_BLACK),
                )),
          ],
        ),
        DropDown(),
        Row(
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  "Any Medical Condition ",
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 18,
                      color: AppColors.MIDIUM_BLACK),
                )),
          ],
        ),
        Container(
          margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
          height: 70,
          color: AppColors.EDIT_TEXT_COLOR,
          child: TextFormField(
            enabled: false,
            controller: medicalCondition,
            textInputAction: TextInputAction.newline,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ),
        SizedBox(height: 20)
      ],
    );
  }
}
