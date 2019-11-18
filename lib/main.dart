import 'package:flutter/material.dart';
import 'package:flutter_app_painless/navigation.dart';
import 'package:flutter_app_painless/record/ui/screens/voice_recognition.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Navigation(),
    );
  }
}




