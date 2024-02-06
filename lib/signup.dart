import 'package:flutter/material.dart';
import 'package:cricket/weather.dart';
import 'package:firebase_auth/firebase_auth.dart';


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
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
                      MaterialPageRoute(builder: (context) => weather()),
                    );}
                }catch(e)
                {print(e);
                Snack();
                }
              },
              child: Text('Sign Up'),
            ),
          ],
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