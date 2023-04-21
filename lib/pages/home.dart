import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_page/pages/bar.dart';


class HomePage extends StatefulWidget{
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut(){
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: Bar(),
      appBar: AppBar(
        title: Text("RateIT"),
   actions: [
     IconButton(onPressed: signUserOut, icon: Icon(Icons.logout))
   ],
      ),
      body: Center(
      child: Text("You LOGGED IN AS " +" " + user.email!,style: TextStyle(fontSize: 20)),
    ));
  }
}
