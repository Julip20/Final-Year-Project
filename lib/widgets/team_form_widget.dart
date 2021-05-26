import 'package:flutter/material.dart';

class TeamFormWidget extends StatelessWidget {
  
  final String name;
  final String manager;

  final ValueChanged<String> onChangedTeamName;
  final ValueChanged<String> onChangedManager;

  final VoidCallback onSavedTeam;

  TeamFormWidget({
  Key key,
  this.name='',
  this.manager='',
  @required this.onChangedTeamName,
  @required this.onChangedManager,
  @required this.onSavedTeam


}): super (key: key);
  
  @override
  Widget build(BuildContext context)=> SingleChildScrollView(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildTeamName(),
        SizedBox(height: 8),
        buildManager(),
        SizedBox(height: 32),
        buildButton(),
      ],
    ),
  );
  Widget buildTeamName() => TextFormField(
               maxLines: 1,
             initialValue: name,
             onChanged: onChangedTeamName,
             validator: (name){
               if(name.isEmpty){
                 return 'The name cannot be Empty';
               }
               return null;
             },
            
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Team Name',
            ),
               
  );

  Widget buildManager() => TextFormField(
    maxLines: 3,
      
      initialValue: manager,
      onChanged: onChangedManager,
      decoration: InputDecoration(
      border: UnderlineInputBorder(),
      labelText: 'Manager',
    ),

  );
  
  Widget buildButton() => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black),
          ),
          onPressed: onSavedTeam,
          child: Text('Save'),
        ),
      );

    
  
}