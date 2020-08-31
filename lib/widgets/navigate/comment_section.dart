import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';

class CommentSection extends StatelessWidget {
  String name, date, comment;
  CommentSection({this.name, this.date, this.comment});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Column(children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.account_circle,
              color: AppColors.COMMENT_ICON,
              size: 80,
            ),
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
                            child: Text(date,
                                style: TextStyle(
                                    fontSize: 18, color: AppColors.DARK_GREY))),
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
                  padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                  child: (Text(comment,
                      style: TextStyle(
                          fontSize: 20, color: AppColors.DARK_GREY)))),
            ),
          ],
        )
      ]),
    );
  }
}
