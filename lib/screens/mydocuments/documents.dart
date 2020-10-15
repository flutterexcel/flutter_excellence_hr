import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_excellence_hr/screens/navigate/navigate.dart';
import 'package:flutter_excellence_hr/widgets/appbar.dart';
import 'package:flutter_excellence_hr/widgets/document_widgets/document_widgets.dart';

class MyDocuments extends StatefulWidget {
  @override
  _MyDocumentsState createState() => _MyDocumentsState();
}

class _MyDocumentsState extends State<MyDocuments> {
  String document = "-";
  bool showImgUpload = false;

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
            DropDown(onDocumentChange: (String value) {
              setState(() {
                document = value;
                print("Selected document is $document");
                showImgUpload = true;
              });
            }),
            showImgUpload
                ? UploadDocumentPic(document: document.toString())
                : Center(),
            RequiredDocument(),
            DocumentListing(),
            DocumentDirectory(),
          ],
        ),
      )),
    );
  }
}
