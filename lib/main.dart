import 'package:flutter/material.dart';
import 'package:Curus/MyJson.dart';
import 'package:Curus/MyHome.dart';
import 'package:Curus/SpeechScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Curus Health',
      initialRoute:"home",
      routes:{
        "home":(context)=>MyHome(),
        "myjson":(context)=>MyJson(),
        "myspeechscreen":(context)=>SpeechScreen(),
      },
    );
  }
}