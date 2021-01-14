import 'dart:convert';
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_excellence_hr/widgets/timesheet_widgets/timesheet_widgets.dart';
import 'package:image_picker/image_picker.dart';

class UploadTracker extends StatefulWidget {
  @override
  _UploadPicState createState() => _UploadPicState();
}

class _UploadPicState extends State<UploadTracker> {
  File _image;
  var val;
  UploadTrackerScreen api = UploadTrackerScreen();
  UploadTrac uploadTrac;
  bool uploading = true;

  Future getImage() async {
    final image = await ImagePicker.pickImage(source: ImageSource.gallery);
    _image = image;

    setState(() {
      if (_image.path.isNotEmpty) uploading = false;
    });

    try {
      await api
          .uploadTrackerScreen(
              docs: '(binary)',
              action: "timesheet_docs",
              file: _image,
              submit: "Upload")
          .then((value) {
        uploadTrac = jsonDecode(value.body);
        print("your tracker msg  " + uploadTrac.message.toString());
        val = jsonDecode(value.body);
        print(" Your value is  " + val);
        alertDialog();
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          getImage();
        },
        child: Container(
          margin: EdgeInsets.all(8),
          child: DottedBorder(
            borderType: BorderType.RRect,
            color: Colors.grey,
            radius: Radius.circular(0),
            padding: EdgeInsets.all(6),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: uploading
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Drop a document or click to select file to upload",
                            style: TextStyle(
                                color: AppColors.MIDIUM_BLACK,
                                fontFamily: 'OpenSans'),
                          )
                        ],
                      )
                    : Center(
                        child: CircularProgressIndicator(
                            backgroundColor: Colors.cyan)),
              ),
            ),
          ),
        ));
  }

  void alertDialog() {
    var alert = AlertDialog(
      title: Text('Your Traker Pic'),
      content: Text(val["message"]),
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              setState(() {
                uploading = true;
                Navigator.of(context).pop();
              });
            },
            child: Text(
              'OK',
              style: TextStyle(fontSize: 20),
            ))
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext c) {
          return alert;
        });
  }
}
