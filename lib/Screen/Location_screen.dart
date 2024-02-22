import 'package:cricket/Contollerss/controller.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import '../Mdel/model.dart';
import '../Network/api_calling.dart';
import 'package:cricket/Network/api_calling.dart';



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

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  Future<void> getLocation() async {
    try {
      await Geolocator.checkPermission();
      await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude.toString();
      longitude = position.longitude.toString();

      WeatherData? weatherData= await bp.testing(latitude, longitude);
      controller.tempp.value = weatherData?.temperature ;
       controller.citynamee.value = weatherData!.cityName  ;
      print("citynamee");
     print(controller.citynamee.value);
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
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Weather')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() => Text(
              'Temperature in ${controller.citynamee.value} is ${controller.tempp.value}',
              style: TextStyle(fontSize: 20),
            )),
          ],
        ),
      ),
    );
  }
}
