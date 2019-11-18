import 'package:flutter/material.dart';

import 'package:flutter_app_painless/record/ui/screens/recorder.dart';
import 'package:flutter_app_painless/record/ui/screens/voice_recognition.dart';

class Navigation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Navigation();
  }
}

class _Navigation extends State<Navigation> {
  int indexTap = 0;
  final List<Widget> widgetChildren = [
    VoiceRecognition(),
    Recorder(),
  ];
  void onTapTapped(int index) {
    setState(() {
      indexTap = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetChildren[indexTap],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
          primaryColor: Colors.purple,
        ),
        child: BottomNavigationBar(
          onTap: onTapTapped,
          currentIndex: indexTap,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.mic),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.headset_mic),
              title: Text(''),
            ),
          ],
        ),
      ),
    );
  }
}
