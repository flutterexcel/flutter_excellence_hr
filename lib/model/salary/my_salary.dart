class Salary {
  int error;
  Data data;

  Salary({this.error, this.data});

  Salary.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String id;
  String name;
  String email;
  String dateOfJoining;
  String type;
  List<SalaryDetails> salaryDetails;
  List<Null> holdingDetails;
  List<PayslipHistory> payslipHistory;

  Data(
      {this.id,
      this.name,
      this.email,
      this.dateOfJoining,
      this.type,
      this.salaryDetails,
      this.holdingDetails,
      this.payslipHistory});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    dateOfJoining = json['date_of_joining'];
    type = json['type'];
    if (json['salary_details'] != null) {
      salaryDetails = new List<SalaryDetails>();
      json['salary_details'].forEach((v) {
        salaryDetails.add(new SalaryDetails.fromJson(v));
      });
    }
    if (json['payslip_history'] != null) {
      payslipHistory = new List<PayslipHistory>();
      if (json['payslip_history'] is List) {
        json['payslip_history'].forEach((v) {
          payslipHistory.add(new PayslipHistory.fromJson(v));
        });
      } else {
        json['payslip_history'].forEach((key, value) {
          payslipHistory.add(new PayslipHistory.fromJson(value));
        });
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['date_of_joining'] = this.dateOfJoining;
    data['type'] = this.type;
    if (this.salaryDetails != null) {
      data['salary_details'] =
          this.salaryDetails.map((v) => v.toJson()).toList();
    }
    if (this.payslipHistory != null) {
      data['payslip_history'] =
          this.payslipHistory.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SalaryDetails {
  String specialAllowance;
  String medicalAllowance;
  String conveyance;
  String hRA;
  String basic;
  String arrears;
  String incrementAmount = '-';
  String tDS;
  String miscDeductions;
  String advance;
  String loan;
  String ePF;
  int totalHoldingAmount;
  int totalEarning;
  int totalDeduction;
  int totalNetSalary;
  Test test;
  String date;

  SalaryDetails(
      {this.specialAllowance,
      this.medicalAllowance,
      this.conveyance,
      this.hRA,
      this.basic,
      this.arrears,
      this.incrementAmount,
      this.tDS,
      this.miscDeductions,
      this.advance,
      this.loan,
      this.ePF,
      this.totalHoldingAmount,
      this.totalEarning,
      this.totalDeduction,
      this.totalNetSalary,
      this.test,
      this.date});

  SalaryDetails.fromJson(Map<String, dynamic> json) {
    specialAllowance = json['Special_Allowance'];
    medicalAllowance = json['Medical_Allowance'];
    conveyance = json['Conveyance'];
    hRA = json['HRA'];
    basic = json['Basic'];
    arrears = json['Arrears'];
    incrementAmount =
        json.containsKey('Increment_Amount') ? json['Increment_Amount'] : '-';
    tDS = json['TDS'];
    miscDeductions = json['Misc_Deductions'];
    advance = json['Advance'];
    loan = json['Loan'];
    ePF = json['EPF'];
    totalHoldingAmount = json['total_holding_amount'];
    totalEarning = json['total_earning'];
    totalDeduction = json['total_deduction'];
    totalNetSalary = json['total_net_salary'];
    test = json['test'] != null ? new Test.fromJson(json['test']) : null;
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Special_Allowance'] = this.specialAllowance;
    data['Medical_Allowance'] = this.medicalAllowance;
    data['Conveyance'] = this.conveyance;
    data['HRA'] = this.hRA;
    data['Basic'] = this.basic;
    data['Arrears'] = this.arrears;
    data['Increment_Amount'] = this.incrementAmount;
    data['TDS'] = this.tDS;
    data['Misc_Deductions'] = this.miscDeductions;
    data['Advance'] = this.advance;
    data['Loan'] = this.loan;
    data['EPF'] = this.ePF;
    data['total_holding_amount'] = this.totalHoldingAmount;
    data['total_earning'] = this.totalEarning;
    data['total_deduction'] = this.totalDeduction;
    data['total_net_salary'] = this.totalNetSalary;
    if (this.test != null) {
      data['test'] = this.test.toJson();
    }
    data['date'] = this.date;
    return data;
  }
}

class Test {
  String id;
  String userId;
  String totalSalary;
  String lastUpdatedOn;
  String updatedBy;
  String leavesAllocated;
  String applicableFrom;
  String applicableTill;
  int applicableMonth;

  Test(
      {this.id,
      this.userId,
      this.totalSalary,
      this.lastUpdatedOn,
      this.updatedBy,
      this.leavesAllocated,
      this.applicableFrom,
      this.applicableTill,
      this.applicableMonth});

  Test.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_Id'];
    totalSalary = json['total_salary'];
    lastUpdatedOn = json['last_updated_on'];
    updatedBy = json['updated_by'];
    leavesAllocated = json['leaves_allocated'];
    applicableFrom = json['applicable_from'];
    applicableTill = json['applicable_till'];
    applicableMonth = json['applicable_month'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_Id'] = this.userId;
    data['total_salary'] = this.totalSalary;
    data['last_updated_on'] = this.lastUpdatedOn;
    data['updated_by'] = this.updatedBy;
    data['leaves_allocated'] = this.leavesAllocated;
    data['applicable_from'] = this.applicableFrom;
    data['applicable_till'] = this.applicableTill;
    data['applicable_month'] = this.applicableMonth;
    return data;
  }
}

class PayslipHistory {
  String id;
  String userId;
  String month;
  String year;
  String totalLeaveTaken;
  String leaveBalance;
  String allocatedLeaves;
  String paidLeaves;
  String unpaidLeaves;
  String finalLeaveBalance;
  String status;
  String miscDeduction2;
  String bonus;
  String totalWorkingDays;
  String totalEarnings;
  String totalDeductions;
  String totalTaxes;
  String totalNetSalary;

  PayslipHistory(
      {this.id,
      this.userId,
      this.month,
      this.year,
      this.totalLeaveTaken,
      this.leaveBalance,
      this.allocatedLeaves,
      this.paidLeaves,
      this.unpaidLeaves,
      this.finalLeaveBalance,
      this.status,
      this.miscDeduction2,
      this.bonus,
      this.totalWorkingDays,
      this.totalEarnings,
      this.totalDeductions,
      this.totalTaxes,
      this.totalNetSalary});

  PayslipHistory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_Id'];
    month = json['month'];
    year = json['year'];
    totalLeaveTaken = json['total_leave_taken'];
    leaveBalance = json['leave_balance'];
    allocatedLeaves = json['allocated_leaves'];
    paidLeaves = json['paid_leaves'];
    unpaidLeaves = json['unpaid_leaves'];
    finalLeaveBalance = json['final_leave_balance'];
    status = json['status'];
    miscDeduction2 = json['misc_deduction_2'];
    bonus = json['bonus'];
    totalWorkingDays = json['total_working_days'];
    totalEarnings = json['total_earnings'];
    totalDeductions = json['total_deductions'];
    totalTaxes = json['total_taxes'];
    totalNetSalary = json['total_net_salary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_Id'] = this.userId;
    data['month'] = this.month;
    data['year'] = this.year;
    data['total_leave_taken'] = this.totalLeaveTaken;
    data['leave_balance'] = this.leaveBalance;
    data['allocated_leaves'] = this.allocatedLeaves;
    data['paid_leaves'] = this.paidLeaves;
    data['unpaid_leaves'] = this.unpaidLeaves;
    data['final_leave_balance'] = this.finalLeaveBalance;
    data['status'] = this.status;
    data['misc_deduction_2'] = this.miscDeduction2;
    data['bonus'] = this.bonus;
    data['total_working_days'] = this.totalWorkingDays;
    data['total_earnings'] = this.totalEarnings;
    data['total_deductions'] = this.totalDeductions;
    data['total_taxes'] = this.totalTaxes;
    data['total_net_salary'] = this.totalNetSalary;
    return data;
  }
}
