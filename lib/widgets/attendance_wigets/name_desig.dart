import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';

class NameDesignation extends StatelessWidget {
  final String name, designation, image;
  NameDesignation({this.name, this.designation, this.image});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(8, 16, 8, 8),
      child: Container(
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(radius: 30, backgroundImage: NetworkImage(image)),
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
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
