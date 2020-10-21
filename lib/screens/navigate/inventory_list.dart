import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/bloc/inventory/inventory.dart';
import 'package:flutter_excellence_hr/model/inventory/audit_current_month.dart';
import 'package:flutter_excellence_hr/model/inventory/history.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InventoryList extends StatelessWidget {
  final usermachine;
  int index;
  final state;

  InventoryList(this.usermachine, this.index, this.state);
  @override
  Widget build(BuildContext context) {
    final _inventoryBloc = BlocProvider.of<InventoryBloc>(context);
    AuditCurrentMonthStatus auditStatus = AuditCurrentMonthStatus.fromJson(
        usermachine.auditCurrentMonthStatus.toJson());
    if (state.showInventory) {
      auditStatus.status = false;
    }
    return Container(
      margin: EdgeInsets.all(8),
      child: Card(
        elevation: 7,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: !auditStatus.status
            ? InkWell(
                onTap: () {
                  _inventoryBloc.add(LoadInventory(
                      data: state.data,
                      count: index,
                      enablecomment: false,
                      enableoverview: false,
                      enableInventory: state.showInventory));
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
