import 'package:cricket/Screen/weather_ui.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Network/api_calling.dart';
import '../features/alert_messages.dart';
import '../onboarding/sign in.dart'; // Add this import for making HTTP requests


class WeatherScreen extends StatefulWidget {
  static const page = "weather";

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  TextEditingController _locationController = TextEditingController();
  final AP ap = AP();

  // Method to sign out
  void _signOut() {
    FirebaseAuth.instance.signOut();
    Navigator.pushNamed(context, SigninPage.page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.grey,
      appBar: AppBar(backgroundColor:  Colors.grey[800],
        title: Center(child: Text('Weather Checker',style: TextStyle(color:Colors.white ))),
        actions: [
          IconButton(
            onPressed: _signOut,
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/cloudd.jpeg'),
                fit: BoxFit.cover, // This ensures that the image covers the entire container
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 230),
                  TextField(
                    controller: _locationController,
                    decoration: InputDecoration(
                      labelText: 'Enter Location',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 3.0), // Adjust color and width as needed
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      String location = _locationController.text;
                      if (location.isEmpty) {

                        ScaffoldMessenger.of(context).showSnackBar(
                          message(),
                        );
                      } else {
                        // Proceed with fetching weather data
                        dynamic? temperature = await ap.testing(location);
                        print("The temperature in $location is $temperature");
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => UiScreen(location: location, temp: temperature),
                        //   ),
                        // );
                        Get.to(UiScreen(location: location, temp: temperature));
                      }
                    },
                    child: Text('Get Weather'),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
