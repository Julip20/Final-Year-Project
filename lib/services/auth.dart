import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_app/models/user.dart';


class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  //Create user Object based on firebase user

  User1 _userFromFirebaseUser(User user){
    return user !=null ? User1(uid: user.uid): null;

  }

  // auth change user Stream

  Stream<User1> get user{
    return _auth.authStateChanges().
    map((User user)=>_userFromFirebaseUser(user));
  }
  
  //sign in anon

  Future signInAnon() async {
    try{
     UserCredential result = await _auth.signInAnonymously();
     User user = result.user;
     


     return _userFromFirebaseUser(user);
    }catch(e){
         print(e.toString());
         return null;

    }
  }

  //sign in with email & password
    Future signInWithEmailAndPassword(String email , String password) async{
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
        return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null; 

    }
  }


  //register with email & password

  Future registerWithEmailAndPassword(String email , String password) async{
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
        return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null; 

    }
  }

  //sign out

  Future signOut() async{
  try{
   return await _auth.signOut();
  }catch(e){
  print(e.toString());
  return null; 
  }
 
  }
}