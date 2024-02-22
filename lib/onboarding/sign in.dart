import 'package:cricket/onboarding/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../Screen/Location_screen.dart';
import '../Screen/weather_screen.dart';


class SigninPage extends StatefulWidget {
  static  String page = "signin_page" ;
  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  dynamic userid ="";

  dynamic psswrd ="";

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final firre = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Sign In',style: TextStyle(fontWeight: FontWeight.w900),)),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height:300,width:double.infinity,child: Image.asset("images/signinimage.png")),
              TextField(controller: emailController,
                onChanged:(valuee){userid=valuee;} ,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              TextField(controller: passwordController,
                onChanged:(value){psswrd=value;
                },
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {print(psswrd);
                print(userid);
                try{
                  var loggeduser = await firre.signInWithEmailAndPassword(email: userid, password:psswrd);
                  print(loggeduser);
                  if(loggeduser!=null){
                    Get.offAllNamed('/location');}
                }catch(e)
                {print(e);
                Snack();
                }
                },
                child: Text('Sign In',style:
                    TextStyle(fontWeight: FontWeight.w400,color: Colors.purple)),
              ),
              SizedBox(height: 15.0),
              Row(
                children: [
                  Text("New user?"), GestureDetector(onTap:(){
                    Get.toNamed( '/signup');
                  },child: Text("Reigister here",style:
                    TextStyle(fontWeight: FontWeight.w400,color: Colors.purple),))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  void Snack(){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Your email or password is wrong'),
      ),
    );
  }
}