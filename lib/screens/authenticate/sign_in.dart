import 'package:flutter/material.dart';
import 'package:my_app/services/auth.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
 SignIn({this.toggleView});
  
  @override

  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email ="";
  String password = "";
  String error = "";
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
         
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign in to Tz Premier League'),
        actions: <Widget>[
          TextButton.icon(
          onPressed: (){
            widget.toggleView();

          }, 
          icon: Icon(Icons.person),
          label: Text('Register'),
          ),
        ],

         ),
      body: Container(
     padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
     child: Form(
       key: _formKey,
       child: Column(
         children: <Widget>[
           SizedBox(height: 20.0),
           TextFormField(
             decoration: InputDecoration(
               hintText: "Email",
               fillColor: Colors.white,
               filled: true,
               enabledBorder: OutlineInputBorder(
                 borderSide:  BorderSide(color: Colors.white, width: 2.0),
               ),
                 focusedBorder: OutlineInputBorder(
                 borderSide:  BorderSide(color: Colors.pink, width: 2.0),
               ),
             ),
              validator: (val)=>val.isEmpty?'Enter an email' :null,
            onChanged: (val){
              setState(() =>email =val);

            },
           ),
           SizedBox(height: 20.0),
           TextFormField(
             decoration: InputDecoration(
               hintText: "Password",
               fillColor: Colors.white,
               filled: true,
               enabledBorder: OutlineInputBorder(
                 borderSide:  BorderSide(color: Colors.white, width: 2.0),
               ),
                 focusedBorder: OutlineInputBorder(
                 borderSide:  BorderSide(color: Colors.pink, width: 2.0),
               ),
             ),
              obscureText: true,
              validator: (val)=>val.length < 6?'Enter a Password 6+ chars long' : null,
              onChanged: (val){
                setState(() =>password =val);

             },
           ),
           SizedBox(height: 20.0),
           ElevatedButton(
            
             child: Text(
               'Sign in',
               style: TextStyle(color: Colors.black),
             ),
             onPressed: () async{
             if(_formKey.currentState.validate()){
                  dynamic result = await _auth.signInWithEmailAndPassword(email, password);

                   if(result == null){
                     setState(() =>error= 'Could not sign in' );
                    }
                } 

             },
           ),
            SizedBox(
            height: 12.0,
        ),
        Text(
          error,
          style: TextStyle(color: Colors.red,fontSize: 14.0),
        ),
 

         ],
       ),
     ),
      
      ),
    );
  }
}