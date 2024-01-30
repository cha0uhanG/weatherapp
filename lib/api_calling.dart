import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';


class AP {
dynamic jsonData;
Future<dynamic> testing() async {
http.Response response = await http.get(Uri.parse(
"https://api.openweathermap.org/data/2.5/weather?q=London&appid=41fae732f3d229cc7b27166f8e0c3bff"));
print(response.body);
jsonData=json.decode(response.body);
double temperature = jsonData['main']['temp'];
print(temperature);
return(temperature);
}

}