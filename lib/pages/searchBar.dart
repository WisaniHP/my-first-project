import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget{
  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("search")),
      body: Center(
        child: Text("Search screen",style: TextStyle(fontSize: 40)),
      ),
    );
  }
}