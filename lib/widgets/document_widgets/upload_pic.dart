import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:image_picker/image_picker.dart';


class UploadDocumentPic extends StatefulWidget {
  @override
  _UploadDocumentPicState createState() => _UploadDocumentPicState();
}

class _UploadDocumentPicState extends State<UploadDocumentPic> {
   File _image;  
  Future getImage() async{
      final image = await ImagePicker.pickImage(source: ImageSource.gallery);
      _image = image;
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
                          image: (_image==null)? AssetImage('assets/images/upload.png'): Image.file(_image),
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
