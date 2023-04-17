import 'package:flutter/material.dart';

class Inputs extends StatefulWidget{
  final controller;
  final String hintText;
  final bool obscureText;

   Inputs({super.key,
    required this.controller,
    required this.hintText,required this.obscureText});

  @override
  State<Inputs> createState() => _InputsState();
}

class _InputsState extends State<Inputs> {
  Function()? onTap;

   bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return  Padding(padding: const EdgeInsets.symmetric(horizontal: 30 ),
        child: TextField(
          controller: widget.controller,
        obscureText: !isVisible,                        //hidding the password
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
              onTap:(){
                setState(() {
                  isVisible = !isVisible;
                });

              },
            child: Icon(isVisible?Icons.visibility:Icons.visibility_off)
          ),
        enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
    ),
    focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey.shade400)
    ),
    fillColor: Colors.grey.shade200,
    filled: true,
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.grey),
    ),
    ),
    );
  }
}
class inputs extends StatelessWidget{
  final controllr;
  final String hintTxt;
  final bool obscureTxt;
  const inputs({super.key,
    required this.controllr,
    required this.hintTxt,required this.obscureTxt});
  @override
  Widget build(BuildContext context) {
    return  Padding(padding: const EdgeInsets.symmetric(horizontal: 30 ),
      child: TextField(
        controller: controllr,
        obscureText: obscureTxt,                        //hidding the password
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400)
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hintTxt,
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
  }

