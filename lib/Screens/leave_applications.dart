import 'package:ems/Database/helper.dart';
import 'package:flutter/material.dart';

class LeaveApplications extends StatefulWidget {
  const LeaveApplications({super.key});

  @override
  _LeaveApplicationsState createState() => _LeaveApplicationsState();
}

class _LeaveApplicationsState extends State<LeaveApplications> {
  late Future<List<Map<String, dynamic>>> leaveApplications;

  @override
  void initState() {
    super.initState();
    leaveApplications = DatabaseHelper.instance.getAllLeaveApplications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leave applications'), // Example title
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "Applications",
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: FutureBuilder<List<Map<String, dynamic>>>(
                future: leaveApplications,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No leave applications found'));
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final leave = snapshot.data![index];

                        return SizedBox(
                          width: double.infinity,
                          child: Card(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle),
                                    child: const Icon(Icons.person),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        leave['name'] ?? 'N/A',
                                        style: const TextStyle(
                                          color: Color(0xFFF666666),
                                          fontFamily: 'Montserrat',
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "${leave['start_date']} - ${leave['end_date']}",
                                        style: const TextStyle(
                                          color: Colors.red,
                                          fontFamily: 'Montserrat',
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      Text(
                                        leave['applied_leave'] ?? 'N/A',
                                        style: const TextStyle(
                                          color: Color(0xFFF555555),
                                          fontFamily: 'Montserrat',
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    children: <Widget>[
                                      ElevatedButton(
                                        onPressed: () async {
                                          await DatabaseHelper.instance.updateLeaveStatus(
                                            leave['id'],
                                            'approved',
                                          );

                                          // 2. Fetch leave type data from leave table
                                          Map<String, dynamic> leaveTypeData =
                                          await DatabaseHelper.instance.getLeaveType(
                                            leave['applied_leave'].toLowerCase(),
                                          );

                                          if (leaveTypeData.isNotEmpty) {
                                            // 3. Adjust leave type count in leave table
                                            await DatabaseHelper.instance.adjustLeaveTypeCount(
                                              leave['applied_leave'],
                                              leave['number_of_days'],
                                            );

                                            // Display toast or message about leave approval
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              const SnackBar(
                                                content: Text('Leave approved successfully'),
                                              ),
                                            );

                                            setState(() {
                                            });
                                          } else {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              const SnackBar(
                                                content: Text('Error: Leave type data not found'),
                                              ),
                                            );
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.green.withOpacity(0.3),
                                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                                          minimumSize: Size(50, 30),
                                          elevation: 0,
                                        ),
                                        child: const Text(
                                          "Approve",
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontFamily: 'Montserrat',
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          // Handle cancel action
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.red.withOpacity(0.2),
                                          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                                          minimumSize: Size(50, 30),
                                          elevation: 0,
                                        ),
                                        child: const Text(
                                          "Cancel",
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontFamily: 'Montserrat',
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
