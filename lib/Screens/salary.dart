import 'package:flutter/material.dart';

class Salary extends StatefulWidget {
  const Salary({super.key});

  @override
  _SalaryState createState() => _SalaryState();
}

class _SalaryState extends State<Salary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Salary'), // Example title
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
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SizedBox(
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
                          const Text(
                            "₹24,000",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color(0xFFF555555),
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
                            child: const Text(
                              "Jan 2024",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Color(0xFFF555555),
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      const Row(
                        children: <Widget>[
                          Text(
                            "Basic: ",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color(0xFFF555555),
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "₹14,000",
                            style: TextStyle(
                              color: Color(0xFFF555555),
                              fontFamily: 'Montserrat',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "Daily allowance: ",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color(0xFFF555555),
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "₹2,000",
                            style: TextStyle(
                              color: Color(0xFFF555555),
                              fontFamily: 'Montserrat',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        children: <Widget>[
                          Text(
                            "EPF: ",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color(0xFFF555555),
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "₹2,000",
                            style: TextStyle(
                              color: Color(0xFFF555555),
                              fontFamily: 'Montserrat',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "Medical allowance: ",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color(0xFFF555555),
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "₹200",
                            style: TextStyle(
                              color: Color(0xFFF555555),
                              fontFamily: 'Montserrat',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        children: <Widget>[
                          Text(
                            "Tax: ",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color(0xFFF555555),
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "₹0",
                            style: TextStyle(
                              color: Color(0xFFF555555),
                              fontFamily: 'Montserrat',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "Medical Insurance: ",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color(0xFFF555555),
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "₹200",
                            style: TextStyle(
                              color: Color(0xFFF555555),
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
            ),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          const Text(
                            "₹24,000",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color(0xFFF555555),
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
                            child: const Text("Feb 2024",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Color(0xFFF555555),
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      const Row(
                        children: <Widget>[
                          Text(
                            "Basic: ",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color(0xFFF555555),
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "₹14,000",
                            style: TextStyle(
                              color: Color(0xFFF555555),
                              fontFamily: 'Montserrat',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "Daily allowance: ",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color(0xFFF555555),
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "₹2,000",
                            style: TextStyle(
                              color: Color(0xFFF555555),
                              fontFamily: 'Montserrat',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        children: <Widget>[
                          Text(
                            "EPF: ",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color(0xFFF555555),
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "₹2,000",
                            style: TextStyle(
                              color: Color(0xFFF555555),
                              fontFamily: 'Montserrat',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "Medical allowance: ",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color(0xFFF555555),
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "₹200",
                            style: TextStyle(
                              color: Color(0xFFF555555),
                              fontFamily: 'Montserrat',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        children: <Widget>[
                          Text(
                            "Tax: ",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color(0xFFF555555),
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "₹0",
                            style: TextStyle(
                              color: Color(0xFFF555555),
                              fontFamily: 'Montserrat',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "Medical Insurance: ",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color(0xFFF555555),
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "₹200",
                            style: TextStyle(
                              color: Color(0xFFF555555),
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
            ),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          const Text(
                            "₹24,000",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color(0xFFF555555),
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
                            child: const Text("Mar 2024",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Color(0xFFF555555),
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      const Row(
                        children: <Widget>[
                          Text(
                            "Basic: ",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color(0xFFF555555),
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "₹14,000",
                            style: TextStyle(
                              color: Color(0xFFF555555),
                              fontFamily: 'Montserrat',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "Daily allowance: ",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color(0xFFF555555),
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "₹2,000",
                            style: TextStyle(
                              color: Color(0xFFF555555),
                              fontFamily: 'Montserrat',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        children: <Widget>[
                          Text(
                            "EPF: ",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color(0xFFF555555),
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "₹2,000",
                            style: TextStyle(
                              color: Color(0xFFF555555),
                              fontFamily: 'Montserrat',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "Medical allowance: ",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color(0xFFF555555),
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "₹200",
                            style: TextStyle(
                              color: Color(0xFFF555555),
                              fontFamily: 'Montserrat',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        children: <Widget>[
                          Text(
                            "Tax: ",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color(0xFFF555555),
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "₹0",
                            style: TextStyle(
                              color: Color(0xFFF555555),
                              fontFamily: 'Montserrat',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "Medical Insurance: ",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color(0xFFF555555),
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "₹200",
                            style: TextStyle(
                              color: Color(0xFFF555555),
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
            ),
          ],
        ),
      ),
    );
  }
}
