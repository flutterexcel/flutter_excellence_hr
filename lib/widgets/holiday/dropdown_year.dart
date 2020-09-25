import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_excellence_hr/services/holiday/holiday.dart';

class DropDown extends StatefulWidget {
  final Function(Future<dynamic>, String) onYearChange;

  DropDown({Key key, this.onYearChange});
  @override
  _DropDownState createState() =>
      _DropDownState(onYearChange: (Future<dynamic> holiday, String year) {
        onYearChange(holiday, year);
      });
}

class _DropDownState extends State<DropDown> {
  final Function(Future<dynamic>, String) onYearChange;
  int _currentYear = DateTime.now().year;

  List<ListItem> _dropdownItems = [];

  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem _selectedItem;

  _DropDownState({this.onYearChange});
  GetHoliday api = GetHoliday();
  Future _getHoliday(String year) async {
    return await api.getHoliday(year: year);
  }

  void initState() {
    super.initState();
    for (var i = 0; i <= 5; i++) {
      var year = (_currentYear - i).toString();
      _dropdownItems.add(ListItem(i, year));
    }
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;
    onYearChange(_getHoliday(_selectedItem.name), _selectedItem.name);
  }

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
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 35,
              //  margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  //color: Colors.cyan,
                  border: Border.all(width: 1, color: AppColors.DARK_GREY),
                  color: AppColors.EDIT_TEXT_COLOR),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<ListItem>(
                  value: _selectedItem,
                  items: _dropdownMenuItems,
                  onChanged: (value) {
                    setState(() {
                      _selectedItem = value;
                      onYearChange(_getHoliday(value.name), value.name);
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
