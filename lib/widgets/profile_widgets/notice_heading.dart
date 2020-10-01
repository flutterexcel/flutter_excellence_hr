import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';

class EditNotice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              margin: EdgeInsets.fromLTRB(16, 16, 0, 16),
              padding: EdgeInsets.fromLTRB(
                16,
                9,
                0,
                9,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5)),
                  color: AppColors.LIGHT_VOILET),
              child: Text("INFO: ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.DARK_VOILET))),
          Expanded(
            child: Container(
                margin: EdgeInsets.fromLTRB(0, 16, 16, 16),
                padding: EdgeInsets.fromLTRB(0, 8, 8, 8),
                 decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5),
                      bottomRight: Radius.circular(5)),
                  color: AppColors.LIGHT_VOILET),                
                child: Text("If you want to edit contact HR",
                    style: TextStyle(
                      fontFamily: 'SourceSans',
                      color: AppColors.DARK_VOILET,
                    ))),
          )
        ],
      ),
    );
  }
}
