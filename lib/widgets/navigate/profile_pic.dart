import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_excellence_hr/screens/navigate/navigation.dart';

class InventoryProfilePic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
     /*  Container(
          margin: EdgeInsets.fromLTRB(8, 8, 8,8),
          child: RaisedButton.icon(
            onPressed: () {
            Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Navigation()),
                  );
              print('Button Clicked.');
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            label: Text(
              '',
              style: TextStyle(color: Colors.white),
            ),
            icon: Icon(
              Icons.menu,
              color: Colors.white,size: 20,
            ),
            textColor: Colors.white,
            splashColor: AppColors.BACKGROUND_COLOR,
            color: AppColors.THEME_COLOR,
          ),
        ),
        //Text('My Inventory',style: TextStyle(color:AppColors.THEME_COLOR,fontSize: 30,fontWeight: FontWeight.bold)),
       */ Container(
          margin: EdgeInsets.fromLTRB(16, 16, 16, 32),
          child: CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/images/person.jpg'),
          ),
        ),
      ],
    );
  }
}