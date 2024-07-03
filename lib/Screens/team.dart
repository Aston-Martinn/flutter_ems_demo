import 'package:ems/model/team_detail.dart';
import 'package:flutter/material.dart';

class Team extends StatefulWidget {
  const Team({super.key});

  @override
  _TeamState createState() => _TeamState();
}

class _TeamState extends State<Team> {
  final List<TeamDetail> teamDetails = [
    TeamDetail(
      name: "You",
      position: "Team Lead",
      startedFrom: "2019 Jan",
      workingTill: "Current",
    ),
    TeamDetail(
      name: "Member 2",
      position: "UI/UX Designer",
      startedFrom: "2021 Feb",
      workingTill: "Current",
    ),
    TeamDetail(
      name: "Member 3",
      position: "Full-stack Engineer",
      startedFrom: "2022 May",
      workingTill: "Current",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Team'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "Team Hex",
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: teamDetails.length,
                itemBuilder: (context, index) {
                  return TeamInfoCard(teamDetail: teamDetails[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TeamInfoCard extends StatelessWidget {
  final TeamDetail teamDetail;

  const TeamInfoCard({required this.teamDetail, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.person),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    teamDetail.name,
                    style: const TextStyle(
                      color: Color(0xFF666666),
                      fontFamily: 'Montserrat',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    teamDetail.position,
                    style: const TextStyle(
                      color: Color(0xFF555555),
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    "${teamDetail.startedFrom} - ${teamDetail.workingTill}",
                    style: const TextStyle(
                      color: Color(0xFF555555),
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
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