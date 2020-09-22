import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';

class RestrictedLeave extends StatelessWidget {
  List<String> listOf = [
    "Holiday : Lohri",
    "Holiday : Mahashivaratri",
    "Holiday : Buddha Purnima",
    "Holiday : Idul-Fitr",
    "Holiday : Idul-Zuha Bakrid"
  ];

  List<String> dateOf = [
    "Date : 13-January-2020",
    "Date : 21-February-2020",
    "Date : 07-May-2020",
    "Date : 25-May-2020",
    "Date : 02-August-2020",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: [
            Container(
                margin: EdgeInsets.only(top: 16, left: 16),
                child: Text(
                  'Restricted Holiday List ',
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'SourceSans',
                      fontWeight: FontWeight.bold,
                      color: AppColors.LIGHTBLACK_COLOR),
                )),
          ],
        ),
        Card(
          margin: EdgeInsets.all(16),
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            separatorBuilder: (BuildContext context, int index) =>
                Divider(height: 1, thickness: 1, color: Colors.grey[300]),
            itemBuilder: (_, int index) => listRestrictLeave(
              this.listOf[index],
              this.dateOf[index],
            ),
            itemCount: this.listOf.length,
          ),
        )
      ],
    );
  }
}

class listRestrictLeave extends StatelessWidget {
  String itemName, itemNum, itemDate;

  listRestrictLeave(this.itemName, this.itemDate);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: CircleAvatar(
          child: Text(
            "1",
            style: TextStyle(fontSize: 10),
          ),
          backgroundColor: AppColors.GREEN_COLOR,
          foregroundColor: Colors.white,
          radius: 18,
        ),
        title: Text(
          itemName,
          style: TextStyle(fontSize: 14, fontFamily: 'SourceSans'),
        ),
        subtitle: Text(
          itemDate,
          style: TextStyle(fontSize: 14, fontFamily: 'SourceSans'),
        ),
        trailing: Container(width: 70,height: 30,
          child: RaisedButton( color: AppColors.NAVY_BLUE,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
            onPressed: () {},child:Text("Apply",style:TextStyle(fontFamily: 'SourceSans',fontSize: 12,color: Colors.white))),
        ),
      ),
    );
  }
}
