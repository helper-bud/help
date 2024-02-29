import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String token;

  const ResultScreen({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.brown,
        title: Text("Home Screen", style: TextStyle(color:  Colors.white),),
      ),

      body: Center(
        child: Text("My Token : " + token),
      ),

    );
  }
}
