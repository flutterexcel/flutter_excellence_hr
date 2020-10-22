import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/model/salary/my_salary.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_excellence_hr/services/salary/salary.dart';

class TotalDetuction extends StatefulWidget {
  Salary salary;
  TotalDetuction({this.salary});
  @override
  _TotalDetuctionState createState() => _TotalDetuctionState(salary: salary);
}

class _TotalDetuctionState extends State<TotalDetuction> {
  Salary salary;
  _TotalDetuctionState({this.salary});
  bool yourDetuction = false;
  List<ListItemDeduct> detuction = [];

  _getDeduction() {
    var index = salary.data.salaryDetails.length - 1;
    detuction.add(ListItemDeduct("Holding Amount",
        salary.data.salaryDetails[index].totalHoldingAmount.toString()));
    detuction.add(ListItemDeduct("EPF", salary.data.salaryDetails[index].ePF));
    detuction
        .add(ListItemDeduct("Loan", salary.data.salaryDetails[index].loan));
    detuction.add(ListItemDeduct(
        "Misc Deductions", salary.data.salaryDetails[index].miscDeductions));
    detuction.add(ListItemDeduct("TDS", salary.data.salaryDetails[index].tDS));
    setState(() {
      yourDetuction = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _getDeduction();
  }

  @override
  Widget build(BuildContext context) {
    var index = salary.data.salaryDetails.length - 1;
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 16, right: 16),
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey[300]),
            color: Colors.redAccent,
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
                    'Deduction ',
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
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            separatorBuilder: (BuildContext context, int index) => Divider(
              height: 1,
              thickness: .5,
              color: Colors.grey[300],
            ),
            itemBuilder: (_, int index) => ListDeductionItems(detuction[index]),
            itemCount: detuction.length,
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey[300])),
          child: Column(
            children: <Widget>[
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Flexible(
                      child: Container(
                          child: Text(
                        "TOTAL EARNING",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColors.LIGHTBLACK_COLOR),
                      )),
                    ),
                    Flexible(
                        child: Container(
                            child: Text("TOTAL DEDUCTION",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.LIGHTBLACK_COLOR)))),
                    Flexible(
                        child: Container(
                            child: Text("NET SALARY(RS.)",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.LIGHTBLACK_COLOR))))
                  ]),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Flexible(
                      child: Container(
                          margin: EdgeInsets.only(top: 6, bottom: 6),
                          child: Text(
                            salary.data.salaryDetails[index].totalEarning
                                .toString(),
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: AppColors.LIGHTBLACK_COLOR),
                          )),
                    ),
                    Flexible(
                        child: Container(
                            margin: EdgeInsets.only(top: 6, bottom: 6),
                            child: Text(
                                salary.data.salaryDetails[index].totalDeduction
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.LIGHTBLACK_COLOR)))),
                    Flexible(
                        child: Container(
                            margin: EdgeInsets.only(top: 6, bottom: 6),
                            child: Text(
                                salary.data.salaryDetails[index].totalNetSalary
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.LIGHTBLACK_COLOR))))
                  ]),
            ],
          ),
        ),
      ],
    );
  }
}

class ListDeductionItems extends StatelessWidget {
  ListItemDeduct itemName;

  ListDeductionItems(this.itemName);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(6),
        child: ListTile(
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
        ));
  }
}

class ListItemDeduct {
  String key;
  String value;
  ListItemDeduct(this.key, this.value);
}
