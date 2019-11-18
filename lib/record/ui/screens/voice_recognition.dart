import 'package:flutter/material.dart';

import 'package:flutter_app_painless/widgets/floating_action_btn.dart';
import 'package:speech_recognition/speech_recognition.dart';

class VoiceRecognition extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _VoiceRecognition();
  }
}

class _VoiceRecognition extends State<VoiceRecognition> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FloatingActionBtn(
                color: 0xFFFF5722,
                iconData: Icons.cancel,
                onPressed: () {},
                mini: true,
              ),
              FloatingActionBtn(
                color: 0xFF03A9F4,
                iconData: Icons.mic,
                onPressed: () {},
                mini: false,
              ),
              FloatingActionBtn(
                color: 0xFFE91E63,
                iconData: Icons.stop,
                onPressed: () {},
                mini: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
