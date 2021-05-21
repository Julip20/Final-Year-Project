import 'package:flutter/material.dart';
import 'package:my_app/services/auth.dart';
import 'package:my_app/screens/teams_screen.dart';
import 'package:my_app/screens/players_screen.dart';
import 'package:my_app/models/player.dart';


class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
       length: 2,
          child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text("Welcome to VPl"),
           bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon:Icon(
                  Icons.category
                ),
                text: 'Teams',
              ),
              Tab(
                icon: Icon(
                  Icons.person

                ),
                text: "Players",
              ),
             
            ],
          ),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
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
        body: TabBarView(
          children: <Widget>[
            TeamScreen(),
           
            PlayerScreen(),
            
            
          ],
      
        ),
        
        
      ),
    );
  }
}