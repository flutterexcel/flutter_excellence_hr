import 'dart:convert';
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_excellence_hr/services/profile/upload_image.dart';
import 'package:image_picker/image_picker.dart';

class UploadPic extends StatefulWidget {
  @override
  _UploadPicState createState() => _UploadPicState();
}

class _UploadPicState extends State<UploadPic> {

  File _image;
  var val;
  UploadImage api = UploadImage();
  UploadImg uploadImg;
  bool uploading = true;

  Future getImage() async {
    final image = await ImagePicker.pickImage(source: ImageSource.gallery);
    _image = image;

    setState(() {
      if (_image.path.isNotEmpty) uploading = false;
    });

    try {
      await api   
          .uploadImage(
              doctype: 'profile_pic', action: "profile_pic", file: _image)
          .then((value) {
        val = jsonDecode(value.body);
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
      title: Text('Your Profile Pic'),
      content: Text(val['message']),
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