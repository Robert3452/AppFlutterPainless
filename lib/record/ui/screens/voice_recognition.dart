import 'package:flutter/material.dart';

import 'package:flutter_app_painless/widgets/floating_action_btn.dart';

class VoiceRecognition extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _VoiceRecognition();
  }
}

class _VoiceRecognition extends State<VoiceRecognition> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FloatingActionBtn(
                color: 0xFF000000,
                iconData: Icons.cancel,
                onPressed: () {},
                mini: true,
                bGcolor:0xFFFF5722 ,
              ),
              FloatingActionBtn(
                bGcolor: 0xFF03A9F4,
                iconData: Icons.mic,
                onPressed: () {},
                mini: false,
                color: 0xFF000000,
              ),
              FloatingActionBtn(
                bGcolor: 0xFFE91E63,
                iconData: Icons.stop,
                onPressed: () {},
                mini: true,
                color: 0xFF000000,

              ),
            ],
          ),
        ],
      ),
    );
  }
}
