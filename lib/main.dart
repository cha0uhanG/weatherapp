import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:cricket/api_calling.dart';
import 'package:get/get.dart';
import "package:cricket/controller.dart" ;
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:cricket/signup.dart" ;
import "package:cricket/sign in.dart" ;
import 'package:cricket/loginsignup.dart';
import 'package:cricket/weather.dart';
import 'package:cricket/Splash screen.dart';





void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Splash.page,
      routes: {
           EntryPage.page:(context)=>  EntryPage(),
        SignupPage.page:(context)=>  SignupPage(),
        SigninPage.page:(context)=>  SigninPage(),
        weather.page:(context)=>  weather(),
        Splash.page:(context)=> Splash()
      },

    );
  }
}


