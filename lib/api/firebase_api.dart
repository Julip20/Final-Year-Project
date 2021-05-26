import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_app/providers/team.dart';
import 'package:my_app/utils.dart';

class FirebaseApi{
  
  static Future<String> createTeam(Team team) async {
    final docTeam = FirebaseFirestore.instance.collection('todo').doc(team.id);

    
    team.id = docTeam.id;
    await docTeam.set(team.toJson());

    return docTeam.id;
  }

  static Stream<List<Team>> readTeams() => FirebaseFirestore.instance
      .collection('team')
        .orderBy(TeamField.createdTime, descending: true)
      
      .snapshots()
      .transform(Utils.transformer(Team.fromJson));

  static Future updateTeam(Team team) async {
    final docTeam = FirebaseFirestore.instance.collection('team').doc(team.teamName);

    await docTeam.update(team.toJson());
  }

  static Future deleteTeam(Team team) async {
    final docTeam = FirebaseFirestore.instance.collection('team').doc(team.teamName);

    await docTeam.delete();
  }


}