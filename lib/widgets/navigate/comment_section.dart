import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'dart:io';

//import 'package:universal_io/io.dart';
class CommentSection extends StatelessWidget {
  final commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // Widget _getFAB() {
    //     if(Platform.isWindows){
    //       return ;
    //     }else{
    //     }
    //   }

    return Column(
      children: <Widget>[
        Container(
          height: 70,
          color: AppColors.EDIT_TEXT_COLOR,
          //To make
          margin: EdgeInsets.fromLTRB(24, 10, 16, 0),
          child: TextFormField(
            controller: commentController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(10.0),
                ),
              ),
              labelText: 'Comment',
            ),
          ),
        ),
        SizedBox(height: 20),
        RaisedButton(
          onPressed: () {},
          color: AppColors.GOOGLE_BTN_COLOR,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
          child: Text(
            "Comment",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
