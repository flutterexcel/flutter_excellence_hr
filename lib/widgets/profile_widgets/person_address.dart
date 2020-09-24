import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/model/profile/ProfileDetails.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'dart:io';

// ignore: must_be_immutable
class PersonAddress extends StatelessWidget {
  ProfileDetails profileDetails;
  final empName = TextEditingController();
  final currAddress = TextEditingController();
  final permanentAddress = TextEditingController();
  final personalContact = TextEditingController();
  final emergencyContact = TextEditingController();
  final personalEmail = TextEditingController();
  final medicalCondition = TextEditingController();
  final martialStatus = TextEditingController();
  final bloodgroup = TextEditingController();
  PersonAddress({this.profileDetails});
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
            controller: empName
              ..text = profileDetails.data.userProfileDetail.name,
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
        Container(
          margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
          height: 35,
          color: AppColors.EDIT_TEXT_COLOR,
          child: TextFormField(
            enabled: false,
            controller: martialStatus
              ..text = profileDetails.data.userProfileDetail.maritalStatus,
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
            controller: (profileDetails.data.userProfileDetail.address2) != null
                ? (currAddress
                  ..text = profileDetails.data.userProfileDetail.address1 +
                      profileDetails.data.userProfileDetail.address2)
                : profileDetails.data.userProfileDetail.address1,
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
            controller: permanentAddress
              ..text = profileDetails.data.userProfileDetail.permanentAddress,
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
            controller: personalContact
              ..text = profileDetails.data.userProfileDetail.emergencyPh1,
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
            controller: emergencyContact
              ..text = profileDetails.data.userProfileDetail.emergencyPh1,
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
            controller: personalEmail
              ..text = profileDetails.data.userProfileDetail.otherEmail,
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
        Container(
          margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
          height: 35,
          color: AppColors.EDIT_TEXT_COLOR,
          child: TextFormField(
            enabled: false,
            controller: bloodgroup
              ..text = profileDetails.data.userProfileDetail.bloodGroup,
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
            controller: medicalCondition
              ..text = profileDetails.data.userProfileDetail.medicalCondition,
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
