import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/model/profile/ProfileDetails.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';

class IdCard extends StatelessWidget {
  ProfileDetails profileDetails;
  IdCard({this.profileDetails});
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
                    backgroundImage: NetworkImage(
                        profileDetails.data.userProfileDetail.profileImage)),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                        child: Text(
                          profileDetails.data.userProfileDetail.username,
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
                                child: Text(
                                    profileDetails
                                        .data.userProfileDetail.jobtitle,
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
                                child: (Text(
                                    profileDetails
                                        .data.userProfileDetail.userId,
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
                      child: (Text(
                          profileDetails.data.userProfileDetail.dateofjoining,
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
                      child: (Text(
                          profileDetails.data.userProfileDetail.workEmail,
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
                      child: (Text(profileDetails.data.userProfileDetail.gender,
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
                      child: (Text(profileDetails.data.userProfileDetail.dob,
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
                      child: (Text(
                          profileDetails.data.userProfileDetail.emergencyPh1,
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
