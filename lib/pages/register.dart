import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_page/Fields/inputs.dart';
import 'package:login_page/Fields/signUpButton.dart';
import 'login.dart';

class RegPage extends StatefulWidget{

  final Function()? onTap;
  RegPage({super.key,required this.onTap});

  @override
  State<RegPage> createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  final firstNameController = TextEditingController();

  final lastNameController = TextEditingController();

  final phoneNumberController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confarmPswController = TextEditingController();

  void signUp()async {
    showDialog(context: context, builder: (context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
    try {
      if(passwordController.text == confarmPswController.text)
      {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text);
      }
      else{
        Text("Password does not match");
      }

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
body: SingleChildScrollView(
    child: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children: [
     const SizedBox(height: 30),

          // Log or tittle
          const Icon(Icons.app_registration_outlined,
                      size: 50,
                    ),

          const SizedBox(height: 20),
          // dividing page
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

              ],
            ) ,
          ),

          const SizedBox(height: 15),
          //welcome note
          Text('Create new account',
            style: TextStyle(color: Colors.blue,
              fontSize: 30.0,
            ),),
          const SizedBox(height: 30),
          //first name
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 30.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     children: [
          //       Text(
          //         "First Name",style: TextStyle(color:  Colors.grey.shade600),
          //       )
          //     ],
          //   ) ,
          // ),
          // const SizedBox(height: 5),
          // inputs(controllr: firstNameController,
          //     hintTxt: '', obscureTxt: false),
          // const SizedBox(height: 20),
          // //Last name
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 30.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     children: [
          //       Text(
          //         "Last Name",style: TextStyle(color:  Colors.grey.shade600),
          //       )
          //     ],
          //   ) ,
          // ),
          // const SizedBox(height: 5),
          // inputs(controllr: lastNameController,
          //     hintTxt: '', obscureTxt: false),
          const SizedBox(height: 20),

          //Email Address
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Email Address",style: TextStyle(color:  Colors.grey.shade600),
                )
              ],
            ) ,
          ),
          const SizedBox(height: 5),
          inputs(controllr: emailController,
              hintTxt: '', obscureTxt: false),
          const SizedBox(height: 20),
          //password
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Password",style: TextStyle(color:  Colors.grey.shade600),
                )
              ],
            ) ,
          ),
          const SizedBox(height: 5),
          Inputs(controller: passwordController,
              hintText: '', obscureText: false),

          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Confirm Password",style: TextStyle(color:  Colors.grey.shade600),
                )
              ],
            ) ,
          ),
          const SizedBox(height: 5),
          Inputs(controller: confarmPswController,
              hintText: '', obscureText: false),
          const SizedBox(height: 30),
          //sign up button
          signUpButton(
            onTap: signUp ,
          ),

          //already have an account
          const SizedBox(height: 10),
          FloatingActionButton.extended(

            onPressed: (){
              GoogleSignIn().signIn();
            },
            icon: Image.asset("lib/images/google_PNG3.png",height:32,width: 32),
            label: Text('Sign Up With Google'),
            backgroundColor: Colors.white,
            foregroundColor: Colors.blue,

          ),
          const SizedBox(height: 10),

          FloatingActionButton.extended(
            onPressed: (){

            },
            icon: Image.asset("lib/images/png-apple-logo-9711.png",height:32,width: 32),
            label: Text('Sign Up With Apple'),
            backgroundColor: Colors.white,
            foregroundColor: Colors.blue,


          ),

          TextButton(
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(
                        builder:  (builder)=>LogInPage()));
              },
              child: RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Already have an account ?",
                        style: TextStyle(color:  Colors.grey.shade600),
                        //style: TextStyle(color: Colors.blue,fontSize: 14.0)
                      ),

                      TextSpan(
                        text: "  Sign in",
                        style: TextStyle(color: Colors.blue,fontSize: 14.0),
                      )
                    ]
                ),

              )
          ),
          const SizedBox(height: 10),
        ],
    )
    )
    )
    );
  }
}