import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_excellence_hr/widgets/apply_leave_widgets/dropdown_rh.dart';
import 'package:flutter_excellence_hr/screens/navigate/navigate.dart';
import 'package:flutter_excellence_hr/widgets/appbar.dart';
import 'package:flutter_excellence_hr/widgets/document_widgets/document_widgets.dart';
import 'package:flutter_excellence_hr/widgets/profile_widgets/profile_widgets.dart';

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
            DocumentType(),
            DropDown(),
            UploadPic(),
            CertifyDocuments(),
            RequiredDocument(),
            DocumentList(),
            DocumentDirectory(),
          ],
        ),
      )),
    );
  }
}
