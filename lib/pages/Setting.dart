import 'package:flutter/material.dart';

class SettingBar extends StatefulWidget{
  @override
  State<SettingBar> createState() => _SettingBarState();
}

class _SettingBarState extends State<SettingBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Setting")),
      body: Center(
        child: Text("Setting screen",style: TextStyle(fontSize: 40)),
      ),
    );
  }
}