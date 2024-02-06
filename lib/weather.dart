import 'package:flutter/material.dart';
import 'package:cricket/api_calling.dart';
import 'package:get/get.dart';
import "package:cricket/controller.dart" ;
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';




class weather extends StatefulWidget {
  const weather({super.key});

  @override
  State<weather> createState() => _weatherState();
}

class _weatherState extends State<weather> {
  Controller controller = Controller();
  AP ap =AP();
  dynamic temp;

  void initState() {
    super.initState();
    fetchTemperature();


  }
  Future<void> fetchTemperature() async {
    try {
      temp= await ap.testing();
      print("temperature  is $temp");
      controller.tempp.value = temp;

    } catch (error) {
      // Handle error if needed
      print('Error: $error');
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:Container(child:
        Center(child:Obx(
                () => controller.tempp.value == null
                ? CircularProgressIndicator()
                : Text("${controller.tempp.value}")
        ),
        ),
        ),
      ),
    );
  }
}



