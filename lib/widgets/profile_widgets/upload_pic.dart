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
  UploadImage api = UploadImage();
  Future getImage() async {
    final image = await ImagePicker.pickImage(source: ImageSource.gallery);
    _image = image;
    try {
      await api.uploadImage(
          doctype: 'profile_pic', action: "profile_pic", file: image);
    } catch (e) {
      print(e);
    }
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
                    Container(
                        margin: EdgeInsets.fromLTRB(0, 60, 0, 16),
                        child: Image(
                          image: (_image == null)
                              ? AssetImage('images/upload.png')
                              : Image.file(_image),
                          width: 50,
                          height: 50,
                        )),
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
}
