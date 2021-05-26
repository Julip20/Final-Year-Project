import 'package:flutter/material.dart';
import 'package:my_app/providers/team.dart';
import 'package:my_app/widgets/team_form_widget.dart';
import 'package:my_app/providers/teams.dart';
import 'package:provider/provider.dart';

class AddTeamWidget extends StatefulWidget {
  @override
  _AddTeamWidgetState createState() => _AddTeamWidgetState();
}

class _AddTeamWidgetState extends State<AddTeamWidget> {
  final _formKey = GlobalKey<FormState>();
  
   String name= '';
  String manager='';
  DateTime time = DateTime.now();
  
  
  @override
 Widget build(BuildContext context) => AlertDialog(
    content: Form(
      key: _formKey,

          child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Text(
              "Add Team",
              style: TextStyle(
               fontWeight: FontWeight.bold,
               fontSize: 22,
              ),
            ),
            const SizedBox(height: 8),
            TeamFormWidget(
              onChangedTeamName: (name)=>
              setState(()=> this.name= name),
              onChangedManager:(manager)=>
                setState(()=>this.manager=manager),
                onSavedTeam: addTeam,
              

            ),

        ],
      ),
    ),
  );
  void addTeam(){
    final isValid = _formKey.currentState.validate();
    if(!isValid){
      return null;
    }
    else{
      final team = Team(
        id: DateTime.now().toString(),
        createdTime: time, 
        teamName: name,
        manager: manager,
        

      );
      final provider = Provider.of<TeamsProvider>(context, listen :false);
      provider.addTeam(team);
      Navigator.of(context).pop();

    }
  }
}