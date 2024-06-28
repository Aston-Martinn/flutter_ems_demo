import 'package:ems/Database/helper.dart';
import 'package:ems/Screens/leave_applications.dart';
import 'package:ems/Screens/leaves.dart';
import 'package:ems/Screens/profile.dart';
import 'package:ems/Screens/registration_screen.dart';
import 'package:ems/Screens/salary.dart';
import 'package:ems/Screens/signin_screen.dart';
import 'package:ems/Screens/team.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool isLoading = true;
  int isRegistered = 0;
  int isLoggedIn = 0;

  late Future<Map<String, dynamic>?> lastLeaveApplication;
  late Future<String> name;

  @override
  void initState() {
    super.initState();
    fetchUserDetails();
    refreshData();
    name = DatabaseHelper.instance.getName();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (ModalRoute.of(context)!.isCurrent) {
      // Refresh data when returning to Dashboard page
      refreshData();
    }
  }

  Future<void> refreshData() async {
    setState(() {
      lastLeaveApplication = lastLeaveApplication =
          DatabaseHelper.instance.getLastAppliedLeaveApplication();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> fetchUserDetails() async {
    int userId = 1;

    Map<String, dynamic>? userDetails =
        await DatabaseHelper.instance.getUserDetails(userId);

    if (userDetails != null) {
      setState(() {
        isRegistered = userDetails['is_registered'];
        isLoggedIn = userDetails['is_logged_in'];
        isLoading = false;
      });

      if (isRegistered == 0 && isLoggedIn == 0) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Registration()),
        );
      } else if (isLoggedIn == 0 && isRegistered == 1) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Signin()),
        );
      }
    } else {
      setState(() {
        isLoading = false;
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Registration()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFFFF9966),
            Color(0xFFFF9966),
            Color(0xFFFF9966)
          ]),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: FutureBuilder<String>(
                      future: DatabaseHelper.instance.getName(),
                      builder: (BuildContext context,
                          AsyncSnapshot<String> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return const Text('Error loading name');
                        } else {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                "Hello",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                snapshot.data ?? "",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.normal,
                                ),
                              )
                            ],
                          );
                        }
                      },
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.account_circle,
                        color: Colors.white, size: 50),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfilePage()),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.topLeft,
                          child: Row(
                            children: <Widget>[
                              const Text(
                                "Overview",
                                style: TextStyle(
                                  color: Color(0xFFF888888),
                                  fontFamily: 'Montserrat',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Spacer(),
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFF7F7F7),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 14, vertical: 5),
                                child: Text(
                                  DateFormat('dd MMM yyyy')
                                      .format(DateTime.now()),
                                  style: const TextStyle(
                                    color: Color(0xFFF888888),
                                    fontFamily: 'Montserrat',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Leaves()),
                                  );
                                },
                                child: Card(
                                  color: const Color(0xFFF7F7F7),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: const BoxDecoration(
                                              color: Colors.blue,
                                              shape: BoxShape.circle),
                                          child: const Icon(
                                            Icons.star,
                                            color: Colors.white,
                                            size: 25,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "Leave",
                                              style: TextStyle(
                                                color: Color(0xFFF555555),
                                                fontFamily: 'Montserrat',
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 1,
                                            ),
                                            Text(
                                              "My leaves",
                                              style: TextStyle(
                                                color: Color(0xFFF888888),
                                                fontFamily: 'Montserrat',
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Salary()),
                                  );
                                },
                                child: Card(
                                  color: const Color(0xFFF7F7F7),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: const BoxDecoration(
                                              color: Colors.amberAccent,
                                              shape: BoxShape.circle),
                                          child: const Icon(
                                            Icons.leaderboard,
                                            color: Colors.white,
                                            size: 25,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "Salary",
                                              style: TextStyle(
                                                color: Color(0xFFF555555),
                                                fontFamily: 'Montserrat',
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "My salary",
                                              style: TextStyle(
                                                color: Color(0xFFF888888),
                                                fontFamily: 'Montserrat',
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Expanded(
                              child: Card(
                                color: const Color(0xFFF7F7F7),
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: const BoxDecoration(
                                            color: Colors.green,
                                            shape: BoxShape.circle),
                                        child: const Icon(
                                          Icons.calendar_month,
                                          color: Colors.white,
                                          size: 25,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Presence",
                                            style: TextStyle(
                                              color: Color(0xFFF555555),
                                              fontFamily: 'Montserrat',
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "View",
                                            style: TextStyle(
                                              color: Color(0xFFF555555),
                                              fontFamily: 'Montserrat',
                                              fontSize: 15,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Team()),
                                  );
                                },
                                child: Card(
                                  color: const Color(0xFFF7F7F7),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: const BoxDecoration(
                                              color: Colors.cyanAccent,
                                              shape: BoxShape.circle),
                                          child: const Icon(
                                            Icons.person,
                                            color: Colors.white,
                                            size: 25,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "Team",
                                              style: TextStyle(
                                                color: Color(0xFFF555555),
                                                fontFamily: 'Montserrat',
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "My team",
                                              style: TextStyle(
                                                color: Color(0xFFF555555),
                                                fontFamily: 'Montserrat',
                                                fontSize: 15,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                const Text(
                                  "Recent Leave Application",
                                  style: TextStyle(
                                    color: Color(0xFFF555555),
                                    fontFamily: 'Montserrat',
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                const Spacer(),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LeaveApplications()),
                                    );
                                  },
                                  child: const Text(
                                    "See all",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontFamily: 'Montserrat',
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 1,
                            ),
                            FutureBuilder<Map<String, dynamic>?>(
                              future: lastLeaveApplication,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                } else if (snapshot.hasError) {
                                  return Center(
                                      child: Text('Error: ${snapshot.error}'));
                                } else if (snapshot.hasData) {
                                  final data = snapshot.data!;
                                  return SizedBox(
                                    width: double.infinity,
                                    child: Card(
                                      elevation: 0,
                                      color: Color(0xFFFF7F7F7),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(7.0),
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
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  data['name']!,
                                                  style: const TextStyle(
                                                    color: Color(0xFFF666666),
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  data['start_date'] != null &&
                                                          data['end_date'] !=
                                                              null
                                                      ? '${data['start_date']} - ${data['end_date']}'
                                                      : 'Date Range Unavailable',
                                                  style: const TextStyle(
                                                    color: Colors.red,
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                                Text(
                                                  data['applied_leave']!,
                                                  style: const TextStyle(
                                                    color: Color(0xFFF555555),
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const Spacer(),
                                            Column(
                                              children: <Widget>[
                                                ElevatedButton(
                                                  onPressed: () async {
                                                    await DatabaseHelper
                                                        .instance
                                                        .updateLeaveStatus(
                                                      data['id'],
                                                      'approved',
                                                    );

                                                    // 2. Fetch leave type data from leave table
                                                    Map<String, dynamic>
                                                        leaveTypeData =
                                                        await DatabaseHelper
                                                            .instance
                                                            .getLeaveType(
                                                      data['applied_leave']
                                                          .toLowerCase(),
                                                    );

                                                    if (leaveTypeData
                                                        .isNotEmpty) {
                                                      // 3. Adjust leave type count in leave table
                                                      await DatabaseHelper
                                                          .instance
                                                          .adjustLeaveTypeCount(
                                                        data['applied_leave'],
                                                        data['number_of_days'],
                                                      );

                                                      // Display toast or message about leave approval
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        const SnackBar(
                                                          content: Text(
                                                              'Leave approved successfully'),
                                                        ),
                                                      );

                                                      setState(() {
                                                        lastLeaveApplication =
                                                            DatabaseHelper
                                                                .instance
                                                                .getLastAppliedLeaveApplication();
                                                      });
                                                    } else {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        const SnackBar(
                                                          content: Text(
                                                              'Error: Leave type data not found'),
                                                        ),
                                                      );
                                                    }
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              Colors
                                                                  .green
                                                                  .withOpacity(
                                                                      0.3),
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      20,
                                                                  vertical: 0),
                                                          minimumSize:
                                                              Size(50, 30),
                                                          elevation: 0),
                                                  child: const Text(
                                                    "Approve",
                                                    style: TextStyle(
                                                      color: Colors.green,
                                                      fontFamily: 'Montserrat',
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                  ),
                                                ),
                                                ElevatedButton(
                                                  onPressed: () {},
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              Colors
                                                                  .red
                                                                  .withOpacity(
                                                                      0.2),
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      25,
                                                                  vertical: 0),
                                                          minimumSize:
                                                              Size(50, 30),
                                                          elevation: 0),
                                                  child: const Text(
                                                    "Cancel",
                                                    style: TextStyle(
                                                      color: Colors.red,
                                                      fontFamily: 'Montserrat',
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
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
                                } else {
                                  return SizedBox(
                                    width: double.infinity,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      elevation: 0,
                                      color: Color(0xFFFF7F7F7),
                                      child: const Padding(
                                        padding: EdgeInsets.all(30.0),
                                        child: Text(
                                          'No data available',
                                          style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.normal,
                                              color: Color(0xFFF555555),
                                              fontSize: 14),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                const Text(
                                  "Recent Salary",
                                  style: TextStyle(
                                    color: Color(0xFFF555555),
                                    fontFamily: 'Montserrat',
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                const Spacer(),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Salary()),
                                    );
                                  },
                                  child: const Text(
                                    "See all",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontFamily: 'Montserrat',
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 1,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Card(
                                elevation: 0,
                                color: Color(0xFFFF7F7F7),
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
                                      const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Advaith Bhat B",
                                            style: TextStyle(
                                              color: Color(0xFFF666666),
                                              fontFamily: 'Montserrat',
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "24,000 Cr",
                                            style: TextStyle(
                                              color: Colors.green,
                                              fontFamily: 'Montserrat',
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          Text(
                                            "HDFC Bank",
                                            style: TextStyle(
                                              color: Color(0xFFF555555),
                                              fontFamily: 'Montserrat',
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      Column(
                                        children: <Widget>[
                                          ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Colors.green.withOpacity(0.3),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 15,
                                                      vertical: 0),
                                              minimumSize: const Size(30, 40),
                                              elevation: 0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(
                                                    10), // Adjust the border radius here
                                              ),
                                            ),
                                            child: const Text(
                                              "View details",
                                              style: TextStyle(
                                                color: Colors.green,
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
                            )
                          ],
                        )
                      ],
                    ),
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
