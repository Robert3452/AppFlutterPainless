import 'package:flutter/material.dart';
import 'package:flutter_app_painless/record/ui/screens/nav.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        home: Nav(),
      );
  }
}
