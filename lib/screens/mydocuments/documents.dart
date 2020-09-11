import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_excellence_hr/screens/navigate/navigate.dart';
import 'package:flutter_excellence_hr/widgets/appbar.dart';
import 'package:flutter_excellence_hr/widgets/document_widgets/document_widgets.dart';

class MyDocuments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BACKGROUND_COLOR,
      appBar: AppBar(title: AppBarWidget(pageName: "My Documents")),
      drawer: Navigation(),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            UploadDocuments(),
            DocNotice(),
            Container(margin: EdgeInsets.fromLTRB(16, 16, 16, 8), child: Text("Document Type",style: TextStyle(fontSize: 20,fontFamily:'OpenSans' ),))                          
          ],
        ),
      )),
    );
  }
}