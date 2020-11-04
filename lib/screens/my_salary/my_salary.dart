import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/model/salary/my_salary.dart';
import 'package:flutter_excellence_hr/screens/navigate/navigate.dart';
import 'package:flutter_excellence_hr/widgets/appbar.dart';
import 'package:flutter_excellence_hr/widgets/salary_widgets/salary_widgets.dart';
import 'package:flutter_excellence_hr/services/salary/salary.dart';

class MySalary extends StatefulWidget {
  @override
  _MySalaryState createState() => _MySalaryState();
}

class _MySalaryState extends State<MySalary> {
  SalaryService api = SalaryService();
  Salary salary;
  bool salInfo = false;
  bool noSalInfo = true;
  _getSlip() async {
    return await api.getSalary().then((value) {
      salary = value;
      setState(() {
        salInfo = true;
        if (salary.data.payslipHistory.length == 0) {
          noSalInfo = false;
          salInfo = false;
        }
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
    return salInfo
        ? Scaffold(
            appBar: AppBar(title: AppBarWidget(pageName: "My Salary")),
            drawer: Navigation(),
            body: SafeArea(
                child: SingleChildScrollView(
                    child: Column(
              children: [
                Heading(salary: salary),
                TotalEarning(salary: salary),
                TotalDetuction(salary: salary),
                PaySlip(salary: salary),
              ],
            ))),
          )
        : Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.cyan,
              ),
            ),
          );
  }
}
