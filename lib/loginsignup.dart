

import 'package:flutter/material.dart';
import 'package:cricket/api_calling.dart';
import 'package:get/get.dart';
import "package:cricket/controller.dart" ;
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:cricket/signup.dart" ;
import "package:cricket/sign in.dart" ;
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
    );
  }
}

