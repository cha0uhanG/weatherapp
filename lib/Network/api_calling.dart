import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:dio/dio.dart';

import '../Mdel/model.dart';


// API callin using latitude and longitude.




class BP {
  Dio _dio = Dio();

  Future<WeatherData?> testing(String lat, String lon) async {
    try {
      // Make HTTP GET request to the API using Dio
      Response response = await _dio.get(
        "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=41fae732f3d229cc7b27166f8e0c3bff&units=metric",
      );

      // Check if request was successful (status code 200)
      if (response.statusCode == 200) {
        // Parse the JSON response
        dynamic jsonData = response.data;
        double temperature = jsonData['main']['temp'];
        String cityName = jsonData['name'];
        int humidity= jsonData['main']['humidity'];
        print(cityName);
        print("temperature");
        print(temperature);
        return WeatherData(
          temperature: temperature,
          cityName: cityName,
          Humidity:humidity
        );
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





// API callin using location name.

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
      print("Error: $error");
      return null;
    }
  }
}
