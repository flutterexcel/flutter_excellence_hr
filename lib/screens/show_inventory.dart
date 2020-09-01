import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/inventory/inventory.dart';
import '../model/inventory/user_assign_machine.dart';

class ShowInventory extends StatelessWidget {
  //final Inventory api = Inventory();

  @override
  Widget build(BuildContext context) {
    final _inventoryBloc = BlocProvider.of<InventoryBloc>(context);

    _onGetInventoryPressed() {
      _inventoryBloc.add(LoadInventory());
    }

    return BlocBuilder<InventoryBloc, InventoryState>(
      builder: (context, state) {
        print(state.toString());
        if (state is InventoryLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is InventorySuccess) {
          print(state.toString());
          print('====');
          // UserProfileDetail userprofile =
          //     UserProfileDetail.fromJson(state.data.userProfile);
          // print(userprofile.jobtitle);
          print('----------');
          //print(state.data.userMachine.toList());
          // UserAssignMachine usermachine =
          //     UserAssignMachine.fromJson(state.data.userMachine.toJson());
          final items = state.data.userMachine.toList();
          return Scaffold(
              body: Container(
                  child: ListView.builder(
            // Let the ListView know how many items it needs to build.
            itemCount: items.length,
            // Provide a builder function. This is where the magic happens.
            // Convert each item into a widget based on the type of item it is.
            itemBuilder: (context, index) {
              final item = items[index];
              print(item);
              UserAssignMachine usermachine = UserAssignMachine.fromJson(item);
              return ListTile(
                title: Text(usermachine.machineName),
              );
            },
          )));
          //print(items.length);

          // print(usermachine);
        }
        return Container(
          child: Row(
            children: <Widget>[
              RaisedButton(
                padding: const EdgeInsets.all(8.0),
                textColor: Colors.white,
                color: Colors.blue,
                onPressed:
                    state is InventoryLoading ? () {} : _onGetInventoryPressed,
                child: Text("Get User Inventory"),
              ),
            ],
          ),
        );
      },
    );
    //
    // InventoryState state = _inventoryBloc.state;
  }
}
