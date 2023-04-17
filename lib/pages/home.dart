import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_page/pages/NavBar.dart';


class HomePage extends StatelessWidget{
  HomePage({super.key});
  final user = FirebaseAuth.instance.currentUser!;
  void signUserOut(){
    FirebaseAuth.instance.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text("RateIT"),
      ),
      body: Center(),
    );
  }
  
}