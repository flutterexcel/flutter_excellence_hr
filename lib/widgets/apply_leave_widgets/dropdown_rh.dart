import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/model/attendance/user_rh.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_excellence_hr/services/attendance/get_user_rh.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class DropDown extends StatefulWidget {
  final Function(String) onLeaveChange;
  final Function(List<String>) onRHChange;
  const DropDown({this.onLeaveChange, this.onRHChange});

  @override
  _DropDownState createState() => _DropDownState(onLeaveChange: (String leave) {
        onLeaveChange(leave);
      }, onRHChange: (List<String> rh) {
        onRHChange(rh);
      });
}

class _DropDownState extends State<DropDown> {
  final Function(String) onLeaveChange;
  final Function(List<String>) onRHChange;
  _DropDownState({this.onLeaveChange, this.onRHChange});
  List<ListItem> _dropdownItems = [
    ListItem(1, "Leave Option"),
    ListItem(2, "Casual"),
    ListItem(3, "Sick"),
    ListItem(4, "RH Compensation")
  ];
  bool showRH = false;
  bool borderColor = false;

  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem _selectedItem;
  bool showRh = false;
  var data;
  GetUserRh api = GetUserRh();

  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;
  }

  List<Data> _data = [];
  String selectedRH;
  List<String> _selectedRhDates = [];
  List<bool> _boolList = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = List();
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(
            listItem.name,
            style: TextStyle(fontSize: 15),
          ),
          value: listItem,
        ),
      );
    }
    return items;
  }

  void _popupDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return Dialog(
                  child: Container(
                height: 200,
                width: 20,
                child: ListView.builder(
                    itemCount: _data.length,
                    itemBuilder: (
                      context,
                      int index,
                    ) {
                      return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (_boolList[index]) {
                                _boolList[index] = false;
                                _selectedRhDates.remove(_data[index].rawDate);
                                onRHChange(_selectedRhDates);
                              } else if (!_boolList[index]) {
                                _boolList[index] = true;
                                _selectedRhDates.add(_data[index].rawDate);
                                onRHChange(_selectedRhDates);
                              }
                            });
                          },
                          child: ListTile(
                              title: Text(_data[index].name),
                              leading: _boolList[index]
                                  ? Icon(Icons.check_box)
                                  : Icon(Icons.check_box_outline_blank)));
                    }),
              ));
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              //height: 35,
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  border: borderColor
                      ? Border.all(width: 1, color: Colors.redAccent)
                      : Border.all(width: 1, color: AppColors.DARK_GREY),
                  color: AppColors.EDIT_TEXT_COLOR),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<ListItem>(
                  value: _selectedItem,
                  items: _dropdownMenuItems,
                  onChanged: (value) async {
                    _selectedItem = value;
                    setState(() async {
                      showRh = false;
                      borderColor = false;
                      if (value.name == 'RH Compensation') {
                        var today = DateTime.now();
                        await api.getRh(today.year.toString()).then((value) {
                          _data = value.data;
                          _popupDialog(context);
                        });
                      } else if (value.name == "Leave Option") {
                        borderColor = true;
                      }
                      onLeaveChange(value.name);
                    });
                  },
                  style: TextStyle(
                      color: AppColors.LIGHTBLACK_COLOR, fontSize: 20),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ListItem {
  int value;
  String name;
  ListItem(this.value, this.name);
}
