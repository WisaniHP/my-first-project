import 'package:flutter/material.dart';

class ProfileBar  extends StatefulWidget{
  @override
  State<ProfileBar> createState() => _ProfileBarState();
}

class _ProfileBarState extends State<ProfileBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Center(
        child: Text("Profile screen",style: TextStyle(fontSize: 40)),
      ),
    );
  }
}