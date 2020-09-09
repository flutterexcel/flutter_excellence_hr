import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/bloc/inventory/inventory.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class KeyValueModel {
  String key;
  String value;

  KeyValueModel({this.key, this.value});
}

class CommentForm extends StatelessWidget {
  final state;
  CommentForm(this.state);
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _commentController = TextEditingController();
  bool _autoValidate = false;

  List<KeyValueModel> _datas = [
    KeyValueModel(key: "select", value: "Select your Audit Report"),
    KeyValueModel(key: "all_good", value: "Nothing To Report (all good)"),
    KeyValueModel(key: "issue", value: "Issue To Report"),
    KeyValueModel(key: "critical_issue", value: "Critical Issue To Report"),
  ];
  @override
  Widget build(BuildContext context) {
    final _inventoryBloc = BlocProvider.of<InventoryBloc>(context);
    return Form(
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
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          //color: Colors.cyan,
                          border:
                              Border.all(width: 1, color: AppColors.DARK_GREY)),
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
                        state.comment != 'all_good' && state.comment != 'select'
                            ? Container(
                                height: 70,
                                color: AppColors.EDIT_TEXT_COLOR,
                                //To make
                                margin: EdgeInsets.fromLTRB(24, 10, 16, 0),
                                child: TextFormField(
                                  controller: _commentController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
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
                            ? RaisedButton(
                                onPressed: () {
                                  print(state.comment);
                                  print(_commentController.text);
                                },
                                color: AppColors.GOOGLE_BTN_COLOR,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0))),
                                child: Text(
                                  "Comment",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              )
                            : Center(),
                      ],
                    ),
                  )
                : Center(),
          ],
        ),
      ),
    );
  }
}
