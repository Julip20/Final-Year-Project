import 'package:flutter/material.dart';

class TeamScreen extends StatelessWidget {
  @override
  
  Widget build(BuildContext context) {
    
    
    return Scaffold(
      appBar: AppBar(
          title: Text("Add Teams"),
      ),
      body: Form(
        child: ListView(
          children: <Widget>[
            TextFormField(),
          ],
        ), 
      ),
      
    );
  }
}