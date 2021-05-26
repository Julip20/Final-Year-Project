import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_app/providers/team.dart';
import 'package:my_app/api/firebase_api.dart';


class TeamsProvider extends ChangeNotifier{

  List<Team> _teams=[];
  List<Team> get teams => _teams.where((team) => team.isDone== false).toList();

List<Team> get teamsCompleted => 
_teams.where((team)=> team.isDone == true).toList();

void setTeams(List<Team> teams)=>
  WidgetsBinding.instance.addPostFrameCallback((_) {
   _teams =teams;
   notifyListeners();
   });


void addTeam(Team team) => FirebaseApi.createTeam(team);

void removeTeam(Team team) => FirebaseApi.deleteTeam(team);


bool toggleTeamStatus(Team team){
  team.isDone = !team.isDone;
   notifyListeners();
   FirebaseApi.updateTeam(team);
  return team.isDone;
}
void updateTeam(Team team, String teamName, String manager)
{
 team.teamName =teamName;
 team.manager= manager;

FirebaseApi.updateTeam(team);
}  

} 