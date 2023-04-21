import 'package:flutter/material.dart';

class Bar extends StatefulWidget{
  @override
  State<Bar> createState() => _BarState();
}

class _BarState extends State<Bar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Menu")),
      body: Center(
        child: Text("Menu screen",style: TextStyle(fontSize: 40)),
      ),
    );
  }
}