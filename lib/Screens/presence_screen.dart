import 'package:flutter/material.dart';
import 'package:ems/model/presence_detail.dart';

class Presence extends StatefulWidget {
  const Presence({Key? key}) : super(key: key);

  @override
  _PresenceState createState() => _PresenceState();
}

class _PresenceState extends State<Presence> {
  final List<PresenceDetail> presenceDetails = [
    PresenceDetail(
      date: "Today",
      day: "Wed",
      month: "Jul",
      year: "2024",
      checkIn: "9:00 AM",
      checkOut: "Yet to",
      status: "Present",
    ),
    PresenceDetail(
      date: "2",
      day: "Tue",
      month: "Jul",
      year: "2024",
      checkIn: "9:00 AM",
      checkOut: "6:30 PM",
      status: "Present",
    ),
    PresenceDetail(
      date: "1",
      day: "Mon",
      month: "Jul",
      year: "2024",
      checkIn: "9:00 AM",
      checkOut: "6:00 PM",
      status: "Present",
    ),
    PresenceDetail(
      date: "30",
      day: "Fri",
      month: "June",
      year: "2024",
      checkIn: "-",
      checkOut: "-",
      status: "Sick leave",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Presence'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "My attendance",
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: presenceDetails.length,
                itemBuilder: (context, index) {
                  return PresenceInfoCard(presenceDetail: presenceDetails[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PresenceInfoCard extends StatelessWidget {
  final PresenceDetail presenceDetail;

  const PresenceInfoCard({required this.presenceDetail, Key? key}) : super(key: key);

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
                  const Icon(
                    Icons.calendar_today,
                    size: 20,
                    color: Color(0xFF555555),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '${presenceDetail.date} ${presenceDetail.month} ${presenceDetail.year}',
                    style: const TextStyle(
                      color: Color(0xFF666666),
                      fontFamily: 'Montserrat',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
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
                      presenceDetail.day,
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
              const SizedBox(height: 16), // Adjust spacing as needed
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'Check In',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Color(0xFF555555),
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        presenceDetail.checkIn,
                        style: const TextStyle(
                          fontFamily: 'Montserrat',
                          color: Color(0xFF666666),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'Check Out',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Color(0xFF555555),
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        presenceDetail.checkOut,
                        style: const TextStyle(
                          fontFamily: 'Montserrat',
                          color: Color(0xFF666666),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'Status',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Color(0xFF555555),
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        presenceDetail.status,
                        style: const TextStyle(
                          fontFamily: 'Montserrat',
                          color: Color(0xFF666666),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
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