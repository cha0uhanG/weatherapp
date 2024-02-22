import 'package:flutter/material.dart';




class UiScreen extends StatefulWidget {
  final String location;
  final double? temp;

  UiScreen({required this.location, required this.temp});

  @override
  State<UiScreen> createState() => _UiScreenState();
}

class _UiScreenState extends State<UiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.grey,
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("${widget.location},",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),) ),
                 SizedBox(height: 20,),
                 Text("${widget.temp ?? 'unavailable'}\u2103",style: TextStyle(fontSize: 70,fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}
