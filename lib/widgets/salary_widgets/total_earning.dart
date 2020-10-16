import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/model/salary/my_salary.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_excellence_hr/services/salary/salary.dart';

class TotalEarning extends StatefulWidget {
  
  @override
  _TotalEarningState createState() => _TotalEarningState();
}

class _TotalEarningState extends State<TotalEarning> {
  MySalary api = new MySalary();
  Salary salary;
  bool yourSalary = false;
  List<ListItem> earning = [];
  _getSalary() async {
    return await api.getSalary().then((value) {
      salary = value;
      earning.add(ListItem("Basic", salary.data.salaryDetails[0].basic));
      earning.add(ListItem("HRA", salary.data.salaryDetails[0].hRA));
      earning
          .add(ListItem("Conveyance", salary.data.salaryDetails[0].conveyance));
      earning.add(ListItem(
          "Medical_Allowance", salary.data.salaryDetails[0].medicalAllowance));
      earning.add(ListItem(
          "Special Allowance", salary.data.salaryDetails[0].specialAllowance));
          
      setState(() {
        yourSalary = true;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getSalary();
  }

  @override
  Widget build(BuildContext context) {
    return yourSalary
        ? Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey[300]),
                  color: AppColors.GREEN_COLOR,
                ),
                child: Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 16, left: 8, bottom: 16),
                        child: Text(
                          'Total ',
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'OpenSans',
                              color: Colors.white),
                        )),
                    Container(
                        margin: EdgeInsets.only(top: 16, bottom: 16),
                        child: Text(
                          'Earnings ',
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'SourceSans',
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey[300])),
                child: yourSalary
                    ? ListView.separated(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        separatorBuilder: (BuildContext context, int index) =>
                            Divider(
                          height: 1,
                          thickness: .5,
                          color: Colors.grey[300],
                        ),
                        itemBuilder: (_, int index) =>
                            ListEarningItems(earning[index]),
                        itemCount: earning.length,
                      )
                    : Center(),
              ),
            ],
          )
        : Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.cyan,
            ),
          );
  }
}

class ListEarningItems extends StatelessWidget {
  ListItem itemName;
  ListEarningItems(this.itemName);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(6),
        child: Column(
          children: [
            ListTile(
              title: Text(
                itemName.key,
                style: TextStyle(
                    color: AppColors.LIGHTBLACK_COLOR,
                    fontSize: 14,
                    fontFamily: 'SourceSans'),
              ),
              trailing: Text(itemName.value,
                  style: TextStyle(
                      color: AppColors.LIGHTBLACK_COLOR,
                      fontSize: 14,
                      fontFamily: 'SourceSans')),
            ),
          ],
        ));
  }
}

class ListItem {
  String key;
  String value;
  ListItem(this.key, this.value);
}
