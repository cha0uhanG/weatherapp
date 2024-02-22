import 'package:cricket/Contollerss/controller.dart';
import 'package:cricket/Screen/weather_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import '../Mdel/model.dart';
import '../Network/api_calling.dart';
import 'package:cricket/Network/api_calling.dart';
import '../onboarding/sign in.dart';
import 'package:get_storage/get_storage.dart';

import '../Getstorage/prefernce.dart';



class LocationPage extends StatefulWidget {
  static const page = "LocationPage";
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  String latitude = 'Fetching...';
  String longitude = 'Fetching...';
  BP bp = BP();
  Controller controller = Get.put(Controller());

  void signOut() {
    FirebaseAuth.instance.signOut();
    Navigator.pushNamed(context, SigninPage.page);
  }

  @override
  void initState() {
    controller.tempp.value=MyPref().temp.val;
    controller.citynamee.value=MyPref().stateName.val;
    controller.humid.value=MyPref().humidity.val;
    super.initState();
    getLocation();

  }

  Future<void> getLocation() async {
    try {
      await Geolocator.checkPermission();
      await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high); // exxtracting location
      latitude = position.latitude.toString();
      longitude = position.longitude.toString();

      WeatherData? weatherData= await bp.testing(latitude, longitude);
      controller.tempp.value = weatherData?.temperature ;
       controller.citynamee.value = weatherData!.cityName  ;
       controller.humid.value=weatherData?.Humidity;


      // Save weather data to Hive
      MyPref().temp.val = controller.tempp.value;
      MyPref().stateName.val=controller.citynamee.value;
      MyPref().humidity.val=controller.humid.value;
      print("saved value is ${ MyPref().temp.val}");

    } catch (e) {
      print('Error: $e');
      setState(() {
        latitude = 'Error fetching location';
        longitude = 'Error fetching location';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.grey,
      appBar: AppBar(backgroundColor:  Colors.grey[800],
        title: Center(child: Text('Weather',style: TextStyle(color:Colors.white ),)),
        actions: [
          IconButton(
            onPressed: signOut,
            icon: Icon(Icons.logout,color: Colors.white,),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.center,
            children: [SizedBox(height: 100,),
              Obx(() => Text(
                '  ${controller.citynamee.value}, ',
                style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),
              ),
              ),
          SizedBox(height:20),
          Obx(() =>  Text(
                '  ${controller.tempp.value}\u2103  ',
                style: TextStyle(fontSize: 70,fontWeight: FontWeight.bold),
              ),),
            SizedBox(height: 10,),
              Obx(() => Text(
                ' Humidity is ${controller.humid.value}, ',
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
              ),
              ),
            SizedBox(height: 150,),
              Text(" Check Wheather for any City",style: TextStyle(
                fontSize: 18, // Adjust the font size as needed
                fontWeight: FontWeight.bold, // Adjust the font weight as needed
              ),),
              SizedBox(height: 5,),
              Container(width: 120, height: 30,
                decoration: BoxDecoration(color: Colors.grey[800],borderRadius: BorderRadius.circular(8),
                ),
                child: TextButton(
                  onPressed: () {
                    Get.toNamed( '/weather');
                  },
                  child: Text(
                    "Click",
                    style: TextStyle(
                      color: Colors.white, // Change the text color as needed
                      fontSize: 12, // Adjust the font size as needed
                      fontWeight: FontWeight.bold, // Adjust the font weight as needed
                    ),
                  ),
                ),
              ),
          
              SizedBox(height: 5,)
            ],
          ),
        ),
      ),
    );
  }
}

