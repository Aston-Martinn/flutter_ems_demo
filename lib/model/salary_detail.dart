class SalaryDetail {
  final String month;
  final double salary;
  final double basic;
  final double dailyAllowance;
  final double epf;
  final double medicalAllowance;
  final double tax;
  final double medicalInsurance;

  SalaryDetail({
    required this.month,
    required this.salary,
    required this.basic,
    required this.dailyAllowance,
    required this.epf,
    required this.medicalAllowance,
    required this.tax,
    required this.medicalInsurance,
  });
}
