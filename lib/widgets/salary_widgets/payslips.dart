import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/model/salary/my_salary.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_excellence_hr/services/salary/salary.dart';

class PaySlip extends StatefulWidget {
  @override
  _PaySlipState createState() => _PaySlipState();
}

class _PaySlipState extends State<PaySlip> {
  MySalary api = new MySalary();
  Salary salary;
  bool yourSlips = false;
  List<ListItemPay> slips = [];

  _getSlip() async {
    return await api.getSalary().then((value) {
      salary = value;
      int i = 0;
      while (i < salary.data.payslipHistory.length) {
        slips.add(ListItemPay(
            "PAY DATE",
            salary.data.payslipHistory[0].month +
                ", " +
                salary.data.payslipHistory[0].year));
        slips.add(ListItemPay("TOTAL EARNINGS (Rs.)",
            salary.data.payslipHistory[0].totalEarnings));

        slips.add(
            ListItemPay("TAXES", salary.data.payslipHistory[0].totalTaxes));
        slips.add(ListItemPay("TOTAL DEDUCTIONS (Rs.)",
            salary.data.payslipHistory[0].totalDeductions));
        slips.add(ListItemPay(
            "NET SALARY", salary.data.payslipHistory[0].totalNetSalary));
        i++;
      }

      setState(() {
        yourSlips = true;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getSlip();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 16, right: 16),
          child: Row(
            children: [
              Container(
                  margin: EdgeInsets.only(top: 16, left: 8, bottom: 16),
                  child: Text(
                    'EMPLOYEE ',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'OpenSans',
                    ),
                  )),
              Container(
                  margin: EdgeInsets.only(top: 16, bottom: 16),
                  child: Text(
                    'PAYSLIPS ',
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'SourceSans',
                        fontWeight: FontWeight.bold,
                        color: AppColors.LIGHTBLACK_COLOR),
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
            itemBuilder: (_, int index) => ListPayItems(slips[index]),
            itemCount: slips.length,
          ),
        ),
      ],
    );
  }
}

class ListPayItems extends StatelessWidget {
  ListItemPay itemName;
  ListPayItems(this.itemName);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(6),
        child: ListTile(
          title: Text(
            itemName.key,
            style: TextStyle(fontSize: 16, fontFamily: 'SourceSans'),
          ),
          trailing: Text(itemName.value,
              style: TextStyle(
                  color: AppColors.LIGHTBLACK_COLOR,
                  fontSize: 14,
                  fontFamily: 'SourceSans')),
        ));
  }
}

class ListItemPay {
  String key;
  String value;
  ListItemPay(this.key, this.value);
}
