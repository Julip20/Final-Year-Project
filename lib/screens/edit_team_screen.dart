import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_app/providers/team.dart';
import 'package:my_app/providers/teams.dart';
import 'package:my_app/widgets/team_form_widget.dart';

class EditTeamPage extends StatefulWidget {
  final Team team;

  const EditTeamPage({Key key, @required this.team}) : super(key: key);

  @override
  _EditTodoPageState createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTeamPage> {
  final _formKey = GlobalKey<FormState>();

  String teamName;
  String manager;

  @override
  void initState() {
    super.initState();

    teamName = widget.team.teamName;
    manager = widget.team.manager;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Edit Team'),
          actions: [
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                final provider =
                    Provider.of<TeamsProvider>(context, listen: false);
                provider.removeTeam(widget.team);

                Navigator.of(context).pop();
              },
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: TeamFormWidget(
            name: teamName,
            manager: manager,
            onChangedTeamName:(name) => setState(() => this.teamName =name),
            onChangedManager: (manager)=>setState(()=> this.manager =manager),
            onSavedTeam: saveTeam,

            ),
          ),
        ),
      );

  void saveTeam() {
    final isValid = _formKey.currentState.validate();

    if (!isValid) {
      return;
    } else {
      final provider = Provider.of<TeamsProvider>(context, listen: false);

      provider.updateTeam(widget.team, teamName, manager);

      Navigator.of(context).pop();
    }
  }
}