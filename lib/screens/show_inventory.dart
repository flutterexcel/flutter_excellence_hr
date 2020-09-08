import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_excellence_hr/model/inventory/history.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import '../bloc/inventory/inventory.dart';
import '../model/inventory/user_assign_machine.dart';

class KeyValueModel {
  String key;
  String value;

  KeyValueModel({this.key, this.value});
}

class ShowInventory extends StatelessWidget {
  //final Inventory api = Inventory();
  final commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _key = GlobalKey<FormState>();
    final _commentController = TextEditingController();
    bool _autoValidate = false;

    final _inventoryBloc = BlocProvider.of<InventoryBloc>(context);
    List<KeyValueModel> _datas = [
      KeyValueModel(key: "", value: "Select your Audit Report"),
      KeyValueModel(key: "all_good", value: "Nothing To Report (all good)"),
      KeyValueModel(key: "issue", value: "Issue To Report"),
      KeyValueModel(key: "critical_issue", value: "Critical Issue To Report"),
    ];

    _onGetInventoryPressed() {
      _inventoryBloc.add(LoadInventory());
    }

    return BlocBuilder<InventoryBloc, InventoryState>(
      builder: (context, state) {
        if (state is InventoryLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return Scaffold(
            body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                if (state is InventoryInitial) ...{
                  Center(
                    child: RaisedButton(
                      padding: const EdgeInsets.all(8.0),
                      textColor: Colors.white,
                      color: Colors.blue,
                      onPressed: state is InventoryLoading
                          ? () {}
                          : _onGetInventoryPressed,
                      child: Text("Get User Inventory"),
                    ),
                  ),
                },
                if (state is InventorySuccess) ...{
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    // Let the ListView know how many items it needs to build.
                    itemCount: state.data.userMachine.length,
                    // Provide a builder function. This is where the magic happens.
                    // Convert each item into a widget based on the type of item it is.
                    itemBuilder: (context, index) {
                      final item = state.data.userMachine[index];
                      UserAssignMachine usermachine =
                          UserAssignMachine.fromJson(item);
                      return Column(
                        children: [
                          ListTile(
                            title: Text(usermachine.machineName),
                            subtitle: Text(usermachine.machineType),
                      
                            onTap: () {
                              _inventoryBloc.add(LoadInventory(
                                  data: state.data,
                                  count: index,
                                  enablecomment: false));
                            },
                          ),
                          ListTile(
                            title: Text("id"),
                            subtitle: Text(usermachine.id),
                            onTap: () {
                              _inventoryBloc.add(LoadInventory(
                                  data: state.data,
                                  count: index,
                                  enablecomment: false));
                            },
                          ),
                          ListTile(
                            title: Text("Assign Date"),
                            subtitle: Text(usermachine.assignDate),
                            onTap: () {
                              _inventoryBloc.add(LoadInventory(
                                  data: state.data,
                                  count: index,
                                  enablecomment: false));
                            },
                          ),
                          ListTile(
                            title: Text("Serial Number"),
                            subtitle: Text(usermachine.serialNumber),
                            onTap: () {
                              _inventoryBloc.add(LoadInventory(
                                  data: state.data,
                                  count: index,
                                  enablecomment: false));
                            },
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Form(
                      child: Container(
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width * .9,
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10.0),
                                  margin: const EdgeInsets.only(
                                      left: 16.0, right: 16.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      //color: Colors.cyan,
                                      border: Border.all(
                                          width: 1,
                                          color: AppColors.DARK_GREY)),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      isExpanded: true,
                                      items: _datas
                                          .map((data) =>
                                              DropdownMenuItem<String>(
                                                child: Text(data.value,overflow: TextOverflow.ellipsis),
                                                value: data.key,
                                              ))
                                          .toList(),
                                      onChanged: (String key) {
                                        _inventoryBloc.add(LoadInventory(
                                            data: state.data,
                                            enablecomment: true,
                                            comment: key));
                                      },
                                      hint: Text('Select Your Audit Report'),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        state.enablecomment
                            ? Container(
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      height: 70,
                                      color: AppColors.EDIT_TEXT_COLOR,
                                      //To make
                                      margin:
                                          EdgeInsets.fromLTRB(24, 10, 16, 0),
                                      child: TextFormField(
                                        controller: commentController,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                const BorderRadius.all(
                                              const Radius.circular(10.0),
                                            ),
                                          ),
                                          labelText: 'Comment',
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    RaisedButton(
                                      onPressed: () {},
                                      color: AppColors.GOOGLE_BTN_COLOR,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.0))),
                                      child: Text(
                                        "Comment",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.fromLTRB(
                                                16, 16, 8, 16),
                                            child: Text(
                                              'Recent Comments',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: AppColors
                                                      .LIGHTBLACK_COLOR,
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      height: 2,
                                      endIndent: 16,
                                      indent: 16,
                                      thickness: 2,
                                      color: AppColors.COMMENT_ICON,
                                    ),
                                  ],
                                ),
                              )
                            : Center(),
                      ],
                    ),
                  )),
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),

                    // Let the ListView know how many items it needs to build.
                    itemCount: 5,
                    // Provide a builder function. This is where the magic happens.
                    // Convert each item into a widget based on the type of item it is.
                    itemBuilder: (context, index) {
                      final itemmachine = state.data.userMachine[state.count];

                      UserAssignMachine usermachine =
                          UserAssignMachine.fromJson(itemmachine);
                      final item = usermachine.history[index];
                      History userhistory = History.fromJson(item.toJson());
                      return Container(
                        margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(color: AppColors.COMMENT_ICON))),
                        child: Column(
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.account_circle,
                                  color: AppColors.COMMENT_ICON,
                                  size: 50,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        padding:
                                            EdgeInsets.fromLTRB(16, 0, 16, 0),
                                        child: Text(
                                          "Shakti",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: AppColors.COMMENT_NAME,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                                padding: EdgeInsets.fromLTRB(
                                                    16, 0, 16, 4),
                                                child: Text(
                                                    "8th Aug 20,7:01 PM",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: AppColors
                                                            .LIGHTBLACK_COLOR))),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(64, 8, 16, 16),
                                      child: (Text(userhistory.comment,
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: AppColors
                                                  .LIGHTBLACK_COLOR)))),
                                ),
                              ],
                            )
                          ],
                        ),
                      );

                      // return ListTile(
                      //   title: Text(userhistory.comment),
                      // );
                    },
                  ),
                },
              ],
            ),
          ),
        ));
      },
    );
  }
}
