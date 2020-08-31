import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';

class CommentSection extends StatelessWidget {
  String name,date,comment;
  CommentSection({this.name,this.date,this.comment});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Column(children: <Widget>[
        Row(
          children: [
            Icon(
              Icons.account_circle,
              color: AppColors.COMMENT_ICON,
              size: 80,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Text(
                    name,
                    style: TextStyle(
                        fontSize: 25,
                        color: AppColors.COMMENT_NAME,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 4),
                    child: Text(date,
                        style: TextStyle(
                            fontSize: 20, color: AppColors.DARK_GREY))),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Container(
                padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                child: (Text(comment,
                    style:
                        TextStyle(fontSize: 20, color: AppColors.DARK_GREY)))),
          ],
        )
      ]),
    );
  }
}
