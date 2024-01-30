import 'package:flutter/material.dart';
import 'package:cricket/api_calling.dart';


// this is a small app just to test the API


void main() => runApp(weather());

class weather extends StatefulWidget {
  const weather({super.key});

  @override
  State<weather> createState() => _weatherState();
}

class _weatherState extends State<weather> {
  AP ap =AP();
  dynamic temp;
  dynamic tempp;
  void initState() {
    super.initState();
    temp=ap.testing();
  }
  Future<void> _fetchTemperature() async {
    try {
      final temp = await ap.testing();
      setState(() {
        tempp = temp;
      });
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
        Center(child:tempp == null
            ? CircularProgressIndicator()
            : Text(tempp)
        ),
        ),
      ),
    );
  }
}



