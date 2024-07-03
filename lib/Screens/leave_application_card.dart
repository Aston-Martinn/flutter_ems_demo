import 'package:ems/Database/helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LeaveApplicationCard extends StatefulWidget {
  const LeaveApplicationCard({super.key});

  @override
  _LeaveApplicationCardState createState() => _LeaveApplicationCardState();
}

class _LeaveApplicationCardState extends State<LeaveApplicationCard> {
  @override
  void initState() {
    super.initState();
  }

  DateTime? startDate;
  DateTime? endDate;
  String? leaveType;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: leaveType,
                    hint: const Text('Select leaves to apply'),
                    style: const TextStyle(
                        color: Color(0XFFF555555),
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.normal),
                    items: ['Sick', 'Casual', 'Earned', 'Compensatory']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        leaveType = newValue;
                      });
                    },
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    final DateTime? pickedStartDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                      helpText: 'Select start date',
                    );
                    if (pickedStartDate != null) {
                      setState(() {
                        startDate = pickedStartDate;
                      });
                      final DateTime? pickedEndDate = await showDatePicker(
                        context: context,
                        initialDate: pickedStartDate,
                        firstDate: pickedStartDate,
                        lastDate: DateTime(2100),
                        helpText: "Select end date"
                      );
                      if (pickedEndDate != null) {
                        setState(() {
                          endDate = pickedEndDate;
                        });
                      }
                    }
                  },
                  icon: const Icon(Icons.calendar_today),
                ),
              ],
            ),
            const SizedBox(height: 12.0),
            if (startDate != null && endDate != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Number of leave days: ${calculateLeaveDays(startDate!, endDate!)}',
                    style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Montserrat'),
                  ),
                  SizedBox(height: 12.0),
                  TextButton(
                    onPressed: () async {
                      if (leaveType != null) {
                        // Format start and end dates
                        String formattedStartDate =
                        DateFormat('dd MMM').format(startDate!);
                        print(formattedStartDate);
                        String formattedEndDate =
                        DateFormat('dd MMM yyyy').format(endDate!);
                        print(formattedEndDate);

                        // Prepare the data to insert into the database
                        Map<String, dynamic> leaveApplicationData = {
                          'name': 'Advaith Bhat B',
                          'applied_leave': leaveType!,
                          'status': 'applied',
                          'number_of_days': calculateLeaveDays(startDate!, endDate!),
                          'start_date': formattedStartDate,
                          'end_date': formattedEndDate,
                        };

                        int id = await DatabaseHelper.instance.insertLeaveApplication(leaveApplicationData);

                        // Show a confirmation message
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Leave applied successfully!'),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please select leave type.'),
                          ),
                        );
                      }
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue.withOpacity(0.3),
                    ),
                    child: const Text(
                      'Apply Leave',
                      style: TextStyle(
                          color: Colors.blue,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  int calculateLeaveDays(DateTime start, DateTime end) {
    int days = 0;
    for (DateTime date = start;
        date.isBefore(end) || date.isAtSameMomentAs(end);
        date = date.add(const Duration(days: 1))) {
      if (date.weekday != DateTime.saturday &&
          date.weekday != DateTime.sunday) {
        days++;
      }
    }
    return days;
  }
}
