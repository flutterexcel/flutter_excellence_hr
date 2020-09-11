import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';

class IdCard extends StatelessWidget {
  String name, designation, empId, joinDate, workEmail, gender, dob, contact;
  IdCard(
      {this.name,
      this.designation,
      this.empId,
      this.joinDate,
      this.workEmail,
      this.gender,
      this.dob,
      this.contact});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/person.jpg')),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                        child: Text(
                          name,
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'SourceSans',
                            color: AppColors.BTN_BLACK_COLOR,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                                padding: EdgeInsets.fromLTRB(16, 0, 16, 4),
                                child: Text(designation,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'SourceSans',
                                        color: AppColors.BTN_BLACK_COLOR))),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(16, 0, 0, 4),
                            child: (Text("Emp ID: ",
                                style: TextStyle(
                                    fontFamily: 'SourceSans',
                                    fontSize: 14,
                                    color: AppColors.FADE_BLACK))),
                          ),
                          Expanded(
                            child: Container(
                                padding: EdgeInsets.fromLTRB(0, 0, 16, 4),
                                child: (Text(empId,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontFamily: 'SourceSans',
                                        fontSize: 14,
                                        color: Colors.black)))),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            //Write code here
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: (Text("Joining Date: ",
                      style: TextStyle(
                          fontFamily: 'SourceSans',
                          fontSize: 14,
                          color: AppColors.FADE_BLACK))),
                ),
                Expanded(
                  child: Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
                      child: (Text(joinDate,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'SourceSans',
                              fontSize: 14,
                              color: AppColors.MIDIUM_BLACK)))),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: (Text("Work Email: ",
                      style: TextStyle(
                          fontFamily: 'SourceSans',
                          fontSize: 14,
                          color: AppColors.FADE_BLACK))),
                ),
                Expanded(
                  child: Container(
                      child: (Text(workEmail,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'SourceSans',
                              fontSize: 14,
                              color: AppColors.MIDIUM_BLACK)))),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: (Text("Gender: ",
                      style: TextStyle(
                          fontFamily: 'SourceSans',
                          fontSize: 14,
                          color: AppColors.FADE_BLACK))),
                ),
                Expanded(
                  child: Container(
                      child: (Text(gender,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'SourceSans',
                              fontSize: 14,
                              color: AppColors.MIDIUM_BLACK)))),
                ),
              ],
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: (Text("Date Of Birth: ",
                      style: TextStyle(
                          fontFamily: 'SourceSans',
                          fontSize: 14,
                          color: AppColors.FADE_BLACK))),
                ),
                Expanded(
                  child: Container(
                      child: (Text(dob,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'SourceSans',
                              fontSize: 14,
                              color: AppColors.MIDIUM_BLACK)))),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: (Text("Contact Number: ",
                      style: TextStyle(
                          fontFamily: 'SourceSans',
                          fontSize: 14,
                          color: AppColors.FADE_BLACK))),
                ),
                Expanded(
                  child: Container(
                      child: (Text(contact,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'SourceSans',
                              fontSize: 14,
                              color: AppColors.MIDIUM_BLACK)))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
