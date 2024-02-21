

import 'package:flutter/material.dart';
import 'package:cricket/Network/api_calling.dart';
import 'package:get/get.dart';
import "package:cricket/Contollerss/controller.dart" ;
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:cricket/onboarding/signup.dart" ;
import "package:cricket/onboarding/sign%20in.dart" ;
import "package:cricket/main.dart" ;




import 'package:flutter/material.dart';

class EntryPage extends StatelessWidget {

  static  String page = "entry_page" ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(height: 150,width: double.infinity,
              child: Image.asset("images/signinimage.png"),),
              ElevatedButton(
                onPressed: () {
                  // Navigate to sign in page
                  Navigator.pushNamed(context,SigninPage.page );
                },
                child: Text('Sign In'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigate to sign up page
                  Navigator.pushNamed(context,SignupPage.page );
                },
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

