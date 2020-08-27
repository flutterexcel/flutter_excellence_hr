import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';

class MyInventory extends StatefulWidget {
  @override
  _MyInventoryState createState() => _MyInventoryState();
}

class _MyInventoryState extends State<MyInventory> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(16, 32, 16, 32),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('assets/images/person.jpg'),
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(16, 32, 16, 0),
                          padding: EdgeInsets.fromLTRB(16, 32, 16, 0),
                          width: MediaQuery.of(context).size.width,
                          color: AppColors.PINK_COLOR,
                          child: Text(
                            'Important:',
                            style: TextStyle(
                                fontSize: 30,
                                color: AppColors.RED_COLOR,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                          padding: EdgeInsets.fromLTRB(16, 16, 0, 8),
                          width: MediaQuery.of(context).size.width,
                          color: AppColors.PINK_COLOR,
                          child: Text(
                            '- Your monthly audit of inventories is pending',
                            style: TextStyle(
                                fontSize: 25, color: AppColors.RED_COLOR),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                          padding: EdgeInsets.fromLTRB(16, 0, 0, 8),
                          width: MediaQuery.of(context).size.width,
                          color: AppColors.PINK_COLOR,
                          child: Text(
                            '- Select your audit report from the drop down for each of your inventory item',
                            style: TextStyle(
                                fontSize: 25, color: AppColors.RED_COLOR),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                          padding: EdgeInsets.fromLTRB(16, 0, 0, 32),
                          width: MediaQuery.of(context).size.width,
                          color: AppColors.PINK_COLOR,
                          child: Text(
                            '- Once you are done with all the inventories you will be able to access rest of HR app',
                            style: TextStyle(
                                fontSize: 25, color: AppColors.RED_COLOR),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Card(
                  margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Column(children: <Widget>[
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                          child: Text(
                            'LENOVO',
                            style: TextStyle(
                                fontSize: 20, color: AppColors.DARK_GREY),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                            child: Text('Mouse 2018',
                                style: TextStyle(
                                    fontSize: 20, color: AppColors.DARK_GREY))),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                            child: (Text('MOUO27',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: AppColors.DARK_GREY)))),
                      ],
                    )
                  ]),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Column(children: <Widget>[
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                          child: Text(
                            'BSY',
                            style: TextStyle(
                                fontSize: 20, color: AppColors.DARK_GREY),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                            child: Text('Chargers',
                                style: TextStyle(
                                    fontSize: 20, color: AppColors.DARK_GREY))),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                            child: (Text('CHA001',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: AppColors.DARK_GREY)))),
                      ],
                    )
                  ]),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Column(children: <Widget>[
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                          child: Text(
                            'JUMPER',
                            style: TextStyle(
                                fontSize: 20, color: AppColors.DARK_GREY),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                            child: Text('laptop',
                                style: TextStyle(
                                    fontSize: 20, color: AppColors.DARK_GREY))),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                            child: (Text('LAPO47',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: AppColors.DARK_GREY)))),
                      ],
                    )
                  ]),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Column(children: <Widget>[
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                          child: Text(
                            'Quantam',
                            style: TextStyle(
                                fontSize: 20, color: AppColors.DARK_GREY),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                            child: Text('LAN Adapter',
                                style: TextStyle(
                                    fontSize: 20, color: AppColors.DARK_GREY))),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                            child: (Text('LA002',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: AppColors.DARK_GREY)))),
                      ],
                    )
                  ]),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Column(children: <Widget>[
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                          child: Text(
                            'Quantam QHMPL USB 2.0 LAN Adapter',
                            style: TextStyle(
                                fontSize: 20, color: AppColors.DARK_GREY),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                            child: Text('LAN Adapter',
                                style: TextStyle(
                                    fontSize: 20, color: AppColors.DARK_GREY))),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                            child: (Text('LA015',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: AppColors.DARK_GREY)))),
                      ],
                    )
                  ]),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  
                  margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Column(children: <Widget>[
                    Row(
                      children: [
                        Container(
                            padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                            child: Text('BSY',
                                style: TextStyle(
                                    fontSize: 20, color: AppColors.DARK_GREY))),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                            child: (Text('charges',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: AppColors.DARK_GREY)))),
                      ],
                    )
                  ]),
                ),
                Card(
                  margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Column(children: <Widget>[
                    Row(
                      children: [
                        Container(
                            padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                            child: Text('id',
                                style: TextStyle(
                                    fontSize: 20, color: AppColors.DARK_GREY))),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                            child: (Text('504',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: AppColors.LIGHTBLACK_COLOR)))),
                      ],
                    )
                  ]),
                ),
                Card(
                  margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Column(children: <Widget>[
                    Row(
                      children: [
                        Container(
                            padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                            child: Text('Assign Date',
                                style: TextStyle(
                                    fontSize: 20, color: AppColors.DARK_GREY))),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                            child: (Text('2018-08-04',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: AppColors.LIGHTBLACK_COLOR)))),
                      ],
                    )
                  ]),
                ),
                Card(
                  margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Column(children: <Widget>[
                    Row(
                      children: [
                        Container(
                            padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                            child: Text('Serial Number',
                                style: TextStyle(
                                    fontSize: 20, color: AppColors.DARK_GREY))),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                            child: (Text('BSYE120200',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: AppColors.LIGHTBLACK_COLOR)))),
                      ],
                    )
                  ]),
                ),
                Card(
                  margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Column(children: <Widget>[
                    Row(
                      children: [
                        Container(
                            padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                            child: Text('Internal Serial Number',
                                style: TextStyle(
                                    fontSize: 20, color: AppColors.DARK_GREY))),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                            child: (Text('CHA001',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: AppColors.LIGHTBLACK_COLOR)))),
                      ],
                    )
                  ]),
                ),
                Card(
                  margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Column(children: <Widget>[
                    Row(
                      children: [
                        Container(
                            padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                            child: (Text('Deepak Mishra',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: AppColors.LIGHTBLACK_COLOR)))),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                            child: Text('Internal Serial Number',
                                style: TextStyle(
                                    fontSize: 20, color: AppColors.DARK_GREY))),
                      ],
                    ),
                  ]),
                ),
                SizedBox(height:50)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
