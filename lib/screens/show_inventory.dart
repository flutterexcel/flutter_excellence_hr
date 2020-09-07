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
            body: Container(
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
                    return ListTile(
                      title: Text(usermachine.machineName),
                      onTap: () {
                        _inventoryBloc.add(LoadInventory(
                            data: state.data,
                            count: index,
                            enablecomment: false));
                      },
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
                      Container(
                        padding: EdgeInsets.all(20.0),
                        child: DropdownButton<String>(
                          items: _datas
                              .map((data) => DropdownMenuItem<String>(
                                    child: Text(data.value),
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
                      SizedBox(
                        height: 10,
                      ),
                      state.enablecomment
                          ? Container(
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: _commentController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Comment',
                                    ),
                                  ),
                                  RaisedButton(
                                    textColor: Colors.white,
                                    color: AppColors.BTN_BLACK_COLOR,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0))),
                                    child: Text('Submit'),
                                    onPressed: () {},
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
                    return ListTile(
                      title: Text(userhistory.comment),
                    );
                  },
                ),
              },
            ],
          ),
        ));
      },
    );
  }
}
