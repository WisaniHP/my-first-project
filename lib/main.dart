import 'package:flutter/material.dart';
import 'package:login_page/pages/auth.dart';
import 'package:login_page/pages/home.dart';
import 'pages/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:google_sign_in/google_sign_in.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const RateIT());
}

class RateIT extends StatelessWidget {
  const RateIT({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
        title: "RateIT",
        home: Scaffold(                                                      //Adding App bar on top of the application
       // appBar: AppBar(title:Text("RateIT"),),
      body:AuthP(),
    ));
  }
}
