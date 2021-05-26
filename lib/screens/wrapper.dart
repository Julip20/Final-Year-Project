import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app/models/user.dart';
import 'package:provider/provider.dart';
import 'package:my_app/screens/authenticate/authenticate.dart';
import 'package:my_app/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

   

    final user = Provider.of<User1>(context);
    print(user);
    
    //return either home or authenticate widget
    if(user== null){
      
      return Authenticate();

    }else{
      return Home();
    }

  }
}