import 'package:ems/Database/helper.dart';
import 'package:ems/Screens/leave_application_card.dart';
import 'package:flutter/material.dart';

class Leaves extends StatefulWidget {
  const Leaves({Key? key}) : super(key: key);

  @override
  _LeavesState createState() => _LeavesState();
}

class _LeavesState extends State<Leaves> {
  late Future<Map<String, int>> leavesData;

  @override
  void initState() {
    super.initState();
    leavesData = DatabaseHelper.instance.getLeaveCounts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leaves'),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: FutureBuilder<Map<String, int>>(
          future: leavesData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final data = snapshot.data!;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "Leaves",
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
                        child: Row(
                          children: <Widget>[
                            buildLeaveInfo('Sick', data['sick'].toString()),
                            Spacer(),
                            buildLeaveInfo('Casual', data['casual'].toString()),
                            Spacer(),
                            buildLeaveInfo('Earned', data['earned'].toString()),
                            Spacer(),
                            buildLeaveInfo('Comp off', data['compOff'].toString()),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    child: LeaveApplicationCard(), // Assuming this widget is for leave applications
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Widget buildLeaveInfo(String title, String value) {
    return Column(
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(
              fontSize: 15,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(
              fontSize: 15,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.normal),
        ),
      ],
    );
  }
}
