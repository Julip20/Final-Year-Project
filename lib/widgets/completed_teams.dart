import 'package:flutter/material.dart';
import 'package:my_app/providers/team.dart';
import 'package:provider/provider.dart';
import 'package:my_app/providers/teams.dart';
import 'package:my_app/widgets/team_widget.dart';

class CompletedTeamWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TeamsProvider>(context);
    final teams = provider.teamsCompleted;

    return teams.isEmpty
        ? Center(
            child: Text(
              'No completed teams.',
              style: TextStyle(fontSize: 20),
            ),
          )
        : ListView.separated(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(16),
            separatorBuilder: (context, index) => Container(height: 8),
            itemCount: teams.length,
            itemBuilder: (context, index) {
              final team = teams[index];

              return TeamWidget(team: team);
            },
          );
  }
}
