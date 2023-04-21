import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_page/Fields/inputs.dart';
import 'package:login_page/Fields/Buttons.dart';
import 'package:login_page/Fields/Tile.dart';
import 'package:login_page/pages/register.dart';
import 'package:login_page/services/auth_service.dart';
import 'forgot_pswd.dart';
//import 'package:login_page/Fields/signUpButton.dart';
import 'package:login_page/pages/home.dart';


class LogInPage extends StatefulWidget{
  LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {


  final usernameController = TextEditingController();

  final passwordController = TextEditingController();
  void signIn()async {
    showDialog(context: context, builder: (context) {
      return const Center(
        child: CircularProgressIndicator(

        ),
      );
    });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: usernameController.text, password: passwordController.text
      );
      // pop loading cycle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == "user-not-found") {
        wrongEmailM();
      }
      else {
        wrongPasswordM();
      }
    }
  }
  void wrongEmailM(){
    showDialog(context: context,
        builder: (context){
          return const AlertDialog(
            backgroundColor: Colors.redAccent,
            title:  Center(
              child:  Text("Incorrect Email",style: TextStyle(color: Colors.white),),

            ),
          );
        });
  }
  void wrongPasswordM(){
    showDialog(context: context,
        builder: (context){
          return const AlertDialog(
            backgroundColor: Colors.redAccent,
            title:  Center(
              child:  Text("Incorrect Password",style: TextStyle(color: Colors.white),),

            ),
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("RateIT"),),
      backgroundColor: Colors.grey[300],
      body:SingleChildScrollView(
        child:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20), // spacing

          //Logo
         const Icon(
        Icons.lock_clock,
        size: 100,
        ),

         const SizedBox(height: 30), // spacing
          //Welcome note
     Text('Welcome back',
     style: TextStyle(color: Colors.blue[300],
     fontSize: 20.0,
         ),), // styling the welcome text

          const SizedBox(height: 25), // spacing
      // Username
          inputs(
              controllr: usernameController,
              hintTxt:'Username',
            obscureTxt: false,
            ),
            const SizedBox(height: 25), // spacing
        //password
          Inputs(
              controller: passwordController,
              hintText:'Password',
              obscureText: true,
            ),
          const SizedBox(height: 5), // spacing the colums

         // forgort password
         //  Padding(
         //      padding: const EdgeInsets.symmetric(horizontal: 30.0),
         //     child: Row(
         //       mainAxisAlignment: MainAxisAlignment.start,
         //       children: [
         //         GestureDetector(
         //           onTap:(){
         //
         //             },
         //           child: Text(
         //             "Forgot Password?",style: TextStyle(color: Colors.blue,fontSize: 14.0),
         //           ),
         //         )
         //       ],
         //     ) ,
         //  ),
          TextButton(
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(
                        builder:  (builder)=>forgotP(onTap: () {debugPrint('submit button tapped');  },)));
              },
              child: RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Forgot Password?",
                        style: TextStyle(color: Colors.blue),
                      )
                    ]
                ),

              )
          ),
          const SizedBox(height: 25), // spacing
          button(
            onTap: signIn ,
          ),
          //signIn button
          const SizedBox(height: 25), // spacing
          //or coutinue with
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child:   Row(
              children: [
                Expanded(child:
                Divider(
                  thickness: 0.5,
                  color: Colors.blue,
                )
                ),


          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text('Continue With',style: TextStyle(color: Colors.blue),),

          ),
                Expanded(child:
                Divider(
                  thickness: 0.5,
                  color: Colors.blue,
                )
                )
              ],
            ) ,
          ),

          const SizedBox(height: 25), // spacing
         // Row(
         //   mainAxisAlignment: MainAxisAlignment.center,
         //   children: [
         //     //For google
         //     SquareTile(
         //       onTap: () => GoogleSignIn().signIn(),
         //       imagePath:"lib/images/google_PNG3.png",),
         //     const SizedBox(width: 10),
         //     //For Apple
         //     SquareTile(
         //         onTap: () {
         //
         //         },
         //         imagePath:"lib/images/png-apple-logo-9711.png"),
         //     const SizedBox(width: 10),
         //
         //       SquareTile(
         //           onTap: (){
         //
         //           },
         //           imagePath:"lib/images/logo-facebookpng-32243.png"),
         //     const SizedBox(width: 10),
         //
         //     SquareTile(
         //       onTap:(){
         //
         //       },
         //
         //       imagePath:"lib/images/logo-twitter-png-5873.png",)
         //   ],
         // ),
FloatingActionButton.extended(

  onPressed: (){
    GoogleSignIn().signIn();
  },
  icon: Image.asset("lib/images/google_PNG3.png",height:32,width: 32),
  label: Text('Sign In With Google'),
  backgroundColor: Colors.white,
  foregroundColor: Colors.blue,

),
          const SizedBox(height: 10),

          FloatingActionButton.extended(
            onPressed: (){

            },
            icon: Image.asset("lib/images/png-apple-logo-9711.png",height:32,width: 32),
            label: Text('Sign In With Apple'),
            backgroundColor: Colors.white,
            foregroundColor: Colors.blue,


          ),
          const SizedBox(width: 100),
          //not a member? register now
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Text('Not a member?'),
          //     const SizedBox(width: 4),
          //     Text('Register Now',
          //     style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),
          //         builder:RegPage(),
          //     ),
          //   ],
          // )
            TextButton(
            onPressed: (){
              Navigator.push(context,
              MaterialPageRoute(
                  builder:  (builder)=>RegPage(onTap: () {debugPrint('submit button tapped');  },)));
            },
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Don't have an account ?",
                      style: TextStyle(color:  Colors.grey.shade600),
                        //style: TextStyle(color: Colors.blue,fontSize: 14.0)
                      ),

                      TextSpan(
                        text: "  Sign Up",
                          style: TextStyle(color: Colors.blue,fontSize: 14.0),
                      )
                    ]
                  ),

                )
            )
            ]
         ) ,
          ),




      ),

      );



  }
}