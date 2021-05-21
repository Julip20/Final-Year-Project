import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './team.dart';

class Teams with ChangeNotifier{
 List<Team> _items =[
  Team(
  teamName: "Simba",
  manager: "Mourinho", 
  honours: "league x 3",
  imageUrl: "https://futaa.com/images/crops/desktops/20200814EfYEoMyXYAAepUf.jpg"
  ),

  Team(
    teamName: "Yanga",
    manager: "Guadiola",
    honours: "League x 4",
    imageUrl: "http://www.unistoretz.com/magazine/wp-content/uploads/2019/06/Yanga.jpg"
  ),

  
 ];
 
 List<Team> get items{
   return[..._items];
 }


 Team findByName(String teamName){
   return _items.firstWhere((tm) => tm.teamName== teamName);

 }
 void addTeam(
  String teamName, String manager, String honours, String imageUrl)
 {
    final Map<String , dynamic> teamData ={
      "teamName": teamName, 
    "manager":  manager,
    "honours": honours,
    "imageUrl": "http://www.unistoretz.com/magazine/wp-content/uploads/2019/06/Yanga.jpg"
     };
     http.post('https://flutter-update.firebaseio.com/teams.json', 
     body: json.encode(teamData));
  }
 
 
 void updateTeam( String teamName, Team newTeam){
   final tmIndex = _items.indexWhere((tm) => tm.teamName == teamName);
   _items[tmIndex] = newTeam;
   notifyListeners();
   


}

void deleteTeam(String teamName){
  _items.removeWhere((tm) => tm.teamName == teamName);
  notifyListeners();
}
}