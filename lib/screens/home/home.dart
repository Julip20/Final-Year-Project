import 'package:flutter/material.dart';
import 'package:my_app/providers/team.dart';
import 'package:my_app/services/auth.dart';
import 'package:my_app/widgets/add_team_widget.dart';
import 'package:my_app/widgets/completed_teams.dart';
import 'package:my_app/widgets/team_list_widget.dart';
import 'package:my_app/api/firebase_api.dart';
import 'package:provider/provider.dart';
import 'package:my_app/providers/teams.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;

 
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
  
     final tabs =[
  TeamListWidget(),
  CompletedTeamWidget(),
  ];


    return Scaffold(
   appBar: AppBar(
     title: Text("TZ League"),

      actions: <Widget>[
            TextButton.icon(
              icon: Icon(Icons.person),
              label: Text("logout"),
              onPressed: () async{
                await _auth.signOut();
              },

            
            
            )
          ],


   ),
   bottomNavigationBar: BottomNavigationBar(
     backgroundColor: Theme.of(context).primaryColor,
     unselectedItemColor: Colors.white.withOpacity(0.7),
     selectedItemColor: Colors.white,
     currentIndex: selectedIndex,
     onTap: (index)=>setState((){
       selectedIndex =index;
     }),
     items: [
       BottomNavigationBarItem(
         icon: Icon(Icons.speaker_group_rounded),
         label:'Add Team',
      ),
      BottomNavigationBarItem(
         icon: Icon(Icons.person_add),
         label:'List of Teams',
      ),
     
    

     ],
   ),
   body: StreamBuilder<List<Team>>(
        stream: FirebaseApi.readTeams(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return Text('Something Went Wrong Try later');
              } else {
                final teams = snapshot.data;

                final provider = Provider.of<TeamsProvider>(context);
                provider.setTeams(teams);

                return tabs[selectedIndex];
              }
          }
        },
      ),





   floatingActionButton: FloatingActionButton(
     shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
     ),
     backgroundColor: Colors.black,
     onPressed: ()=>showDialog(
      context: context,
      builder:(context)=> AddTeamWidget(),
      barrierDismissible: false,
      ),

     child: Icon(Icons.add),
   ),

    );
  }
}