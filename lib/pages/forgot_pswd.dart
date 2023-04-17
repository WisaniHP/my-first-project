import 'package:flutter/material.dart';
import 'package:login_page/Fields/sendButton.dart';
import 'package:login_page/Fields/inputs.dart';


class forgotP extends StatelessWidget{
  final Function()? onTap;
  void summited(){}
  forgotP({super.key,required this.onTap});
  final emailAddress = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("RateIT"),),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              //Icon
              const Icon(Icons.app_registration,size: 50),


              SizedBox(height: 50),

              inputs(
                controllr: emailAddress,
                hintTxt:'Email Address',
                obscureTxt: false,
              ),
              SizedBox(height: 25),
              SendButton(
                onTap: summited ,
              ),
           //Text
              SizedBox(height: 25),
              TextButton(
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder:  (builder)=>SendButton(onTap: () {  },)));
                  },
                  child: RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Didn't get an Email ?",
                            style: TextStyle(color:  Colors.grey.shade600),
                            //style: TextStyle(color: Colors.blue,fontSize: 14.0)
                          ),

                          TextSpan(
                            text: " Resend",
                            style: TextStyle(color: Colors.blue,fontSize: 14.0),
                          )
                        ]
                    ),

                  )
              )
            ],
            
          )
        ),
      ),
    );
  }

}