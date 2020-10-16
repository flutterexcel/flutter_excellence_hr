import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';

class DropDown extends StatefulWidget {
  final Function(String) onDocumentChange;

  const DropDown({Key key, this.onDocumentChange}) : super(key: key);
  @override
  _DropDownState createState() =>
      _DropDownState(onDocumentChange: (String doc) {
        onDocumentChange(doc);
      });
}

class _DropDownState extends State<DropDown> {
  final Function(String) onDocumentChange;
  _DropDownState({this.onDocumentChange});

  List<ListItem> _dropdownItems = [
    ListItem("-", "--select Doc type--"),
    ListItem("CV", "CV"),
    ListItem("PAN Card", "PAN Card"),
    ListItem("Address Proof", "Address Proof"),
    ListItem("Photo", "Photo"),
    ListItem("Offer Letter", "Offer Letter"),
    ListItem("Appointment Letter", "Appointment Letter"),
    ListItem("Previous Company Experience Letter",
        "Previous Company Experience Letter"),
    ListItem("Previous Company Offer Letter", "Previous Company Offer Letter"),
    ListItem("Previous Company Salary Slip", "Previous Company Salary Slip"),
    ListItem(
        "Previous Company Other Documents", "Previous Company Other Documents"),
    ListItem("Qualification Certificate", "Qualification Certificate"),
    ListItem("Other Documents", "Other Documents"),
  ];

  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem _selectedItem;

  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;
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
              margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
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
                      onDocumentChange(value.value);
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
  String value;
  String name;
  ListItem(this.value, this.name);
}
