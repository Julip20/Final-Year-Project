import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:my_app/providers/team.dart';
import 'package:my_app/providers/teams.dart';
import 'package:my_app/utils.dart';
import 'package:my_app/screens/edit_team_screen.dart';


class TeamWidget extends StatelessWidget {
  final Team team;

  const TeamWidget(
    {
      @required this.team,
      Key key

    }
  ): super(key: key);
  @override
    Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Slidable(
          actionPane: SlidableDrawerActionPane(),
          key: Key(team.teamName),
          actions: [
            IconSlideAction(
              color: Colors.green,
              onTap: () {},
              caption: 'Edit',
              icon: Icons.edit,
            )
          ],
          secondaryActions: [
            IconSlideAction(
              color: Colors.red,
              caption: 'Delete',
              onTap: () {},
              icon: Icons.delete,
            )
          ],
          child: buildTodo(context),
        ),
      );

  Widget buildTodo(BuildContext context) => Container(
        color: Colors.white,
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Checkbox(
              activeColor: Theme.of(context).primaryColor,
              checkColor: Colors.white,
              value: team.isDone,
              onChanged: (_) {},
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    team.teamName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                      fontSize: 22,
                    ),
                  ),
                  if (team.manager.isNotEmpty)
                    Container(
                      margin: EdgeInsets.only(top: 4),
                      child: Text(
                        team.manager,
                        style: TextStyle(fontSize: 20, height: 1.5),
                      ),
                    )
                ],
              ),
            ),
          ],
        ),
      );
      void deleteTeam(BuildContext context, Team team){
        final provider = Provider.of<TeamsProvider>(context, listen: false);
        provider.removeTeam(team);

        Utils.showSnackBar(context, 'Deleted the team');

      }

     void editTeam(BuildContext context, Team team) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => EditTeamPage(team: team),
        ),
      ); 
}