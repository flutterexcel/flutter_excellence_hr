import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/model/attendance/user_rh.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_excellence_hr/services/attendance/get_user_rh.dart';

class DropDown extends StatefulWidget {
  final Function(String) onLeaveChange;
  final Function(String) onRHChange;
  const DropDown({this.onLeaveChange, this.onRHChange});

  @override
  _DropDownState createState() => _DropDownState(onLeaveChange: (String leave) {
        onLeaveChange(leave);
      }, onRHChange: (String rh) {
        onRHChange(rh);
      });
}

class _DropDownState extends State<DropDown> {
  final Function(String) onLeaveChange;
  final Function(String) onRHChange;
  _DropDownState({this.onLeaveChange, this.onRHChange});
  List<ListItem> _dropdownItems = [
    ListItem(1, "Leave Option"),
    ListItem(2, "Casual"),
    ListItem(3, "Sick"),
    ListItem(4, "RH Compansation")
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

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 35,
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
                    if (value.name == 'RH Compansation') {
                      showRh = true;
                      var today = DateTime.now();
                      await api
                          .getRh(today.year.toString())
                          .then((value) => _data = value.data);
                    }
                    setState(() {
                      _selectedItem = value;
                      if (value.name == "Leave Option")
                        borderColor = true;
                      else
                        borderColor = false;
                      onLeaveChange(value.name);
                      showRh = false;
                      if (value.name == 'RH Compansation') {
                        showRh = true;
                      }
                    });
                  },
                  style: TextStyle(
                      color: AppColors.LIGHTBLACK_COLOR, fontSize: 20),
                ),
              ),
            ),
          ),
        ),
        if (showRh) ...{
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 35,
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    //color: Colors.cyan,
                    border: Border.all(width: 1, color: AppColors.DARK_GREY),
                    color: AppColors.EDIT_TEXT_COLOR),
                child: DropdownButtonHideUnderline(
                  child: new DropdownButton<String>(
                    hint: new Text("Select RH"),
                    value: selectedRH,
                    isDense: true,
                    onChanged: (String newValue) {
                      setState(() {
                        selectedRH = newValue;
                      });

                      onRHChange(selectedRH);
                    },
                    items: _data.map((Data map) {
                      return new DropdownMenuItem<String>(
                        value: map.rawDate,
                        child: new Text(map.name,
                            style: new TextStyle(color: Colors.black)),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),
        }
      ],
    );
  }
}

class ListItem {
  int value;
  String name;
  ListItem(this.value, this.name);
}
