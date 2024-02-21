import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:dio/dio.dart';


// class AP {
// dynamic jsonData;
// Future<dynamic> testing() async {
// http.Response response = await http.get(Uri.parse(
// "https://api.openweathermap.org/data/2.5/weather?q=almora&appid=41fae732f3d229cc7b27166f8e0c3bff"));
// jsonData=json.decode(response.body);
// double temperature = jsonData['main']['temp'];
// print(temperature);
// return(temperature);
// }
//
// }


class AP {
  Dio _dio = Dio(); // Create Dio instance

  Future<double?> testing(String location) async {
    try {
      // Make HTTP GET request to the API using Dio
      Response response = await _dio.get(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=41fae732f3d229cc7b27166f8e0c3bff&units=metric",
      );

      // Check if request was successful (status code 200)
      if (response.statusCode == 200) {
        // Parse the JSON response
        dynamic jsonData = response.data;
        double temperature = jsonData['main']['temp'];
        print(temperature);
        return temperature;
      } else {
        // Handle unsuccessful request
        print("Failed to fetch weather data. Status code: ${response.statusCode}");
        return null;
      }
    } catch (error) {
      // Handle errors
      print("Error: $error");
      return null;
    }
  }
}
