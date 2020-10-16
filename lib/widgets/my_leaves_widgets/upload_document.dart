import 'dart:convert';
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_excellence_hr/services/profile/upload_image.dart';
import 'package:image_picker/image_picker.dart';

class UploadPic extends StatefulWidget {
  String leavid;
  UploadPic({this.leavid});

  @override
  _UploadPicState createState() => _UploadPicState(leavid: leavid);
}

class _UploadPicState extends State<UploadPic> {
  File _image;
  var val;
  String leavid;
  _UploadPicState({this.leavid});
  UploadImage api = UploadImage();
  UploadImg uploadImg;
  Future getImage() async {
    final image = await ImagePicker.pickImage(source: ImageSource.gallery);
    _image = image;
    try {
      await api
          .uploadImage(
              doctype: 'leave_doc',
              action: "profile_pic",
              file: _image,
              leaveId: leavid)
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
                child: Column(
                  children: <Widget>[
                    // Container(
                    //     margin: EdgeInsets.fromLTRB(0, 60, 0, 16),
                    //     child: Image(
                    //       image: (_image == null)
                    //           ? AssetImage('assets/images/upload.png')
                    //           : Image.file(_image),
                    //       width: 50,
                    //       height: 50,
                    //     )),
                    Text(
                      "Drop a document or click to select file to upload",
                      style: TextStyle(
                          color: AppColors.MIDIUM_BLACK,
                          fontFamily: 'OpenSans'),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  void alertDialog() {
    var alert = AlertDialog(
      title: Text('Your Leave Document'),
      content: Text(val['message']),
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
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
