import 'package:cricket/Screen/temperature_ui.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Network/api_calling.dart';
import '../features/alert_messages.dart';
import '../onboarding/sign in.dart'; // Add this import for making HTTP requests


class WeatherScreen extends StatefulWidget {
  static const page = "weather2";

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Checker'),
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
                image: AssetImage('images/weather.jpeg'),
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
                      border: OutlineInputBorder(),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UiScreen(location: location, temp: temperature),
                          ),
                        );
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
