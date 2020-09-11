import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';

class DocNotice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
          padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
          decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.DARK_VOILET,
              ),
              color: AppColors.DARK_VOILET,
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Text(
            'If you need to upload back side of the document, you can upload it by first uploading the  front  side saving it and then select the same document time and upload it again. you can also upload it by slecting "other documents" ',
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 1,
              fontFamily: 'OpenSans',
            ),
          ),
        ),
      ],
    );
  }
}
