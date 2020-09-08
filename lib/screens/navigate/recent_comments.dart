import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:intl/intl.dart'; // for date format

class RecentComments extends StatelessWidget {
  final userprofile;
  final userhistory;
  RecentComments(this.userprofile, this.userhistory);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.COMMENT_ICON)),
      ),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.account_circle,
                color: AppColors.COMMENT_ICON,
                size: 50,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: Text(
                        userprofile.name,
                        style: TextStyle(
                            fontSize: 20,
                            color: AppColors.COMMENT_NAME,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                              padding: EdgeInsets.fromLTRB(16, 0, 16, 4),
                              child: Text(
                                  DateFormat.yMMMMd().format(DateTime.parse(
                                          userhistory.updatedAt)) +
                                      ", " +
                                      DateFormat.jms().format(DateTime.parse(
                                          userhistory.updatedAt)),
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: AppColors.LIGHTBLACK_COLOR))),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                    padding: EdgeInsets.fromLTRB(64, 8, 16, 16),
                    child: (Text(userhistory.comment,
                        style: TextStyle(
                            fontSize: 20, color: AppColors.LIGHTBLACK_COLOR)))),
              ),
            ],
          )
        ],
      ),
    );
  }
}
