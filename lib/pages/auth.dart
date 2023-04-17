import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_page/pages/home.dart';
import 'package:login_page/pages/login.dart';

class AuthP extends StatelessWidget{
  const AuthP({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
        // user looged in
          if(snapshot.hasData){
            return HomePage();
          }
          else{
            return LogInPage();
          }
        },
      ),
    );
  }

}