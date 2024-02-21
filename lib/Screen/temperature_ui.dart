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
    return Scaffold(
      body: Center(
        child: Text("${widget.location} has temperature ${widget.temp ?? 'unavailable'}"),
      ),
    );
  }
}
