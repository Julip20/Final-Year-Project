import 'package:flutter/material.dart';
import 'package:my_app/models/user.dart';
import 'package:my_app/screens/wrapper.dart';
import 'package:my_app/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:my_app/providers/teams.dart';

void main() async 
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
runApp(MyApp());

}

class MyApp extends StatelessWidget {
  static final String title = 'Premier League';

   
                                                                                                                                                                                                
                                                                                                                                      
              
 
  @override
  Widget build(BuildContext context) {
     return MultiProvider(
       providers:[StreamProvider<User1>.value(
       initialData: null,
       value: AuthService().user,
       ),
       ChangeNotifierProvider<TeamsProvider>(create: (context)=>TeamsProvider(),
       ),
       ],
       child: MaterialApp(
          title: title,
           theme: ThemeData(
            

             primarySwatch: Colors.grey,
             accentColor: Colors.deepOrange,
             fontFamily: 'lato',
           ),
         home: Wrapper(),


       ),


     );
  }
}