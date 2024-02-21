import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:cricket/onboarding/sign in.dart";

import '../Screen/weather_screen.dart';


class SignupPage extends StatefulWidget {
  static  String page = "signup_page" ;
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  dynamic userid ="";

  dynamic psswrd ="";

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final firre = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Sign Up',style: TextStyle(fontWeight: FontWeight.w900),)),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[ SizedBox(height:300,width:double.infinity,child: Image.asset("images/signinimage.png")),
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
                    var loggeduser = await firre.createUserWithEmailAndPassword(email: userid, password: psswrd);
                    print(loggeduser);
                    if(loggeduser!=null){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WeatherScreen()),
                      );}
                  }catch(e)
                  {print(e);
                  Snack();
                  }
                },
                child: Text('Sign Up'),
              ),
              SizedBox(height: 15.0),
              Row(
                children: [
                  Text("Already user?"), GestureDetector(onTap:(){
                    Navigator.pushNamed(context, SigninPage.page);
                  },child: Text("SignIn here",style:
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
        content: Text('Your Email is already register with us'),
      ),
    );
  }
}