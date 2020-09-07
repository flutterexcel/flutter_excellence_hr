import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';

class CommentList extends StatelessWidget {
  List<String> listOf = ["Deepak ", "Ramesh", "Suman", "Deepak ", "Ramesh"];
  List<String> date = [
    "20-March-2020",
    "22-March-2020",
    "23-March-2020",
    "24-March-2020",
    "25-March-2020"
  ];
  List<String> comment = [
    "Good ",
    "Not Working ",
    "Satisfied",
    "Need to replace ",
    "Working Properly"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (_, int index) => listDataItems(
            this.listOf[index], this.date[index], this.comment[index]),
        itemCount: this.listOf.length,
      ),
    );
  }
}

class listDataItems extends StatelessWidget {
  String name, date, comment;
  listDataItems(this.name, this.date, this.comment);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
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
                          color: Colors.blueAccent,
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
                                    fontSize: 18, color: Colors.blueAccent))),
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
                      style:
                          TextStyle(fontSize: 20, color: Colors.blueAccent)))),
            ),
          ],
        )
      ]),
    );
  }
}
