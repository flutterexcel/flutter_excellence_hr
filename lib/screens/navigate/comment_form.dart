import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/bloc/inventory/inventory.dart';
import 'package:flutter_excellence_hr/model/inventory/audit_current_month.dart';
import 'package:flutter_excellence_hr/model/inventory/user_assign_machine.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/inventory/add_inventory_audit.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class KeyValueModel {
  String key;
  String value;

  KeyValueModel({this.key, this.value});
}

class CommentForm extends StatelessWidget {
  final state;
  final RoundedLoadingButtonController _btnController =
      new RoundedLoadingButtonController();
  CommentForm(this.state);
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _commentController = TextEditingController();
  bool _autoValidate = false;
  final AddInventoryAudit api = AddInventoryAudit();
  List<KeyValueModel> _datas = [
    KeyValueModel(key: "select", value: "Select your Audit Report"),
    KeyValueModel(key: "all_good", value: "Nothing To Report (all good)"),
    KeyValueModel(key: "issue", value: "Issue To Report"),
    KeyValueModel(key: "critical_issue", value: "Critical Issue To Report"),
  ];
  _error() {
    _btnController.error();
  }

  void _doReset() async {
    Timer(Duration(seconds: 2), () {
      _btnController.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    final _inventoryBloc = BlocProvider.of<InventoryBloc>(context);
    final itemmachine = state.data.userMachine[state.count];

    UserAssignMachine usermachine = UserAssignMachine.fromJson(itemmachine);
    AuditCurrentMonthStatus auditStatus = AuditCurrentMonthStatus.fromJson(
        usermachine.auditCurrentMonthStatus.toJson());
    return !auditStatus.status
        ? Form(
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
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            margin:
                                const EdgeInsets.only(left: 16.0, right: 16.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                //color: Colors.cyan,
                                border: Border.all(
                                    width: 1, color: AppColors.DARK_GREY)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: state.comment,
                                isExpanded: true,
                                items: _datas
                                    .map((data) => DropdownMenuItem<String>(
                                          child: Text(data.value,
                                              overflow: TextOverflow.ellipsis),
                                          value: data.key,
                                        ))
                                    .toList(),
                                onChanged: (String key) {
                                  _inventoryBloc.add(LoadInventory(
                                      data: state.data,
                                      enablecomment: true,
                                      comment: key,
                                      count: state.count,
                                      enableoverview: false));
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
                              state.comment != 'all_good' &&
                                      state.comment != 'select'
                                  ? Container(
                                      height: 70,
                                      color: AppColors.EDIT_TEXT_COLOR,
                                      //To make
                                      margin:
                                          EdgeInsets.fromLTRB(24, 10, 16, 0),
                                      child: TextFormField(
                                        controller: _commentController,
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
                                    )
                                  : Center(),
                              SizedBox(height: 20),
                              state.comment != 'select'
                                  ? RoundedLoadingButton(
                                      color: AppColors.BTN_BLACK_COLOR,
                                      width: 150,
                                      borderRadius: 10,
                                      child: Text('Comment',
                                          style:
                                              TextStyle(color: Colors.white)),
                                      controller: _btnController,
                                      onPressed: () async {
                                        final itemmachine =
                                            state.data.userMachine[state.count];

                                        UserAssignMachine usermachine =
                                            UserAssignMachine.fromJson(
                                                itemmachine);
                                        await api
                                            .addinventory(
                                                state.comment,
                                                _commentController.text,
                                                usermachine.id)
                                            .then((value) {
                                          if (value.error == 1) {
                                            _error();
                                          } else if (value.error == 0) {
                                            _btnController.success();
                                          }
                                          _doReset();
                                          _inventoryBloc.add(LoadInventory(
                                            count: state.count,
                                            data: null,
                                          ));
                                        });
                                      },
                                    )
                                  : Center(),
                            ],
                          ),
                        )
                      : Center(),
                ],
              ),
            ),
          )
        : Center();
  }
}
