import 'package:ems/model/salary_detail.dart';
import 'package:flutter/material.dart';

class Salary extends StatefulWidget {
  const Salary({super.key});

  @override
  _SalaryState createState() => _SalaryState();
}

class _SalaryState extends State<Salary> {
  final List<SalaryDetail> salaryDetails = [
    SalaryDetail(
      month: 'Jan 2024',
      salary: 24000,
      basic: 14000,
      dailyAllowance: 2000,
      epf: 2000,
      medicalAllowance: 200,
      tax: 0,
      medicalInsurance: 200,
    ),
    SalaryDetail(
      month: 'Feb 2024',
      salary: 24000,
      basic: 14000,
      dailyAllowance: 2000,
      epf: 2000,
      medicalAllowance: 200,
      tax: 0,
      medicalInsurance: 200,
    ),
    SalaryDetail(
      month: 'Mar 2024',
      salary: 24000,
      basic: 14000,
      dailyAllowance: 2000,
      epf: 2000,
      medicalAllowance: 200,
      tax: 0,
      medicalInsurance: 200,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Salary'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "Salary",
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: salaryDetails.length,
                itemBuilder: (context, index) {
                  return SalaryInfoCard(detail: salaryDetails[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SalaryInfoCard extends StatelessWidget {
  final SalaryDetail detail;

  const SalaryInfoCard({required this.detail, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    "₹${detail.salary}",
                    style: const TextStyle(
                      fontFamily: 'Montserrat',
                      color: Color(0xFF555555),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5, horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      detail.month,
                      style: const TextStyle(
                        fontFamily: 'Montserrat',
                        color: Color(0xFF555555),
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                children: <Widget>[
                  const Text(
                    "Basic: ",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Color(0xFF555555),
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "₹${detail.basic}",
                    style: const TextStyle(
                      color: Color(0xFF555555),
                      fontFamily: 'Montserrat',
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    "Daily allowance: ",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Color(0xFF555555),
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "₹${detail.dailyAllowance}",
                    style: const TextStyle(
                      color: Color(0xFF555555),
                      fontFamily: 'Montserrat',
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: <Widget>[
                  const Text(
                    "EPF: ",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Color(0xFF555555),
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "₹${detail.epf}",
                    style: const TextStyle(
                      color: Color(0xFF555555),
                      fontFamily: 'Montserrat',
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    "Medical allowance: ",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Color(0xFF555555),
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "₹${detail.medicalAllowance}",
                    style: const TextStyle(
                      color: Color(0xFF555555),
                      fontFamily: 'Montserrat',
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: <Widget>[
                  const Text(
                    "Tax: ",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Color(0xFF555555),
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "₹${detail.tax}",
                    style: const TextStyle(
                      color: Color(0xFF555555),
                      fontFamily: 'Montserrat',
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    "Medical Insurance: ",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Color(0xFF555555),
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "₹${detail.medicalInsurance}",
                    style: const TextStyle(
                      color: Color(0xFF555555),
                      fontFamily: 'Montserrat',
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}