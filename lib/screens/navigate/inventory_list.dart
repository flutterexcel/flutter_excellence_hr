import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/bloc/inventory/inventory.dart';
import 'package:flutter_excellence_hr/model/inventory/history.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InventoryList extends StatelessWidget {
  final usermachine;
  int index;
  final data;

  InventoryList(this.usermachine, this.index, this.data);
  @override
  Widget build(BuildContext context) {
    final _inventoryBloc = BlocProvider.of<InventoryBloc>(context);
    final itemHistory = usermachine.history[0];
    History machinehistory = History.fromJson(itemHistory.toJson());
    var machinehistorymonth = DateTime.parse(machinehistory.updatedAt);
    var currDt = DateTime.now();

    return Container(
      margin: EdgeInsets.all(8),
      child: Card(
        elevation: 7,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: machinehistorymonth.month < currDt.month
            ? InkWell(
                onTap: () {
                  _inventoryBloc.add(LoadInventory(
                      data: data,
                      count: index,
                      enablecomment: false,
                      enableoverview: false));
                },
                child: Column(
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                  left: BorderSide(
                                      color: AppColors.DARK_GREY, width: 5)),
                            ),
                            padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                            child: Text(
                              usermachine.machineName,
                              style: TextStyle(
                                  fontSize: 20, color: AppColors.DARK_GREY),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    left: BorderSide(
                                        color: AppColors.DARK_GREY, width: 5))),
                            padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                            child: Text(usermachine.machineType,
                                style: TextStyle(
                                    fontSize: 20, color: AppColors.DARK_GREY))),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    left: BorderSide(
                                        color: AppColors.DARK_GREY, width: 5))),
                            padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                            child: (Text(usermachine.billNumber,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: AppColors.DARK_GREY)))),
                      ],
                    )
                  ],
                ),
              )
            : Center(),
      ),
    );
  }
}
