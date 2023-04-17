import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService{
  signInWithGoogle() async{
     // begin interactive signIn
    final GoogleSignInAccount? gUser = await GoogleSignIn(scopes:<String>["email"]).signIn();

    //obtain auth details
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    // create new credentials
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}