import 'package:flutter/material.dart';
import 'package:login_page/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';


class NavBar extends StatelessWidget{
  final user = FirebaseAuth.instance.currentUser!;
  void signUserOut(){
    FirebaseAuth.instance.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
  child: ListView(
    children: [
      UserAccountsDrawerHeader(
        accountName: Text(""),
        accountEmail:Text("LOGGED IN As "+"  "+user.email!),
      currentAccountPicture: CircleAvatar(
        child:  CircleAvatar(
          //child: Image.network(""),
        ),
      ),
      ),
      ListTile(
        leading: Icon(Icons.search),
        title: Text("Search"),
        onTap: ()=>null,

      ),
      ListTile(
        leading: Icon(Icons.settings),
        title: Text("Settings"),
        onTap: ()=>null,

      ),
      ListTile(
        leading: IconButton(onPressed: signUserOut, icon: Icon(Icons.logout)),
        title: Text("Logout"),
        //onTap: ()=>null,
      ),


    ],
  ),

    );
  }

}
