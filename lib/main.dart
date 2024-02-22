import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:cricket/Network/api_calling.dart';
import 'package:get/get.dart';
import "package:cricket/Contollerss/controller.dart" ;
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';
import 'Screen/Location_screen.dart';
import 'Screen/weather_screen.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:cricket/onboarding/signup.dart" ;
import "package:cricket/onboarding/sign%20in.dart" ;
import 'package:cricket/Splash_screen/Splash%20screen.dart';





void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();            // Used GetStorage for  saving the data locally.
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      initialRoute: Splash.page,
      routes: {
        SignupPage.page:(context)=>  SignupPage(),
        SigninPage.page:(context)=>  SigninPage(),
        Splash.page:(context)=> Splash(),
        WeatherScreen.page:(context)=>  WeatherScreen(),
        LocationPage.page:(context)=>  LocationPage(),
      },

    );
  }
}


