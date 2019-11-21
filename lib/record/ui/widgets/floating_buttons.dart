import 'package:flutter/material.dart';
import 'package:flutter_app_painless/widgets/floating_action_btn.dart';


class FloatingButtons extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _FloatingButtons();
  }

}

class _FloatingButtons extends State<FloatingButtons>{
  @override
  Widget build(BuildContext context) {
    return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[                  
                  FloatingActionBtn(
                    color:0xFFffffff,
                    bGcolor: 0xFF232523,
                    onPressed: (){},
                    key: null,
                    iconData: Icons.mic,
                    mini: false,
                  ),
                  FloatingActionBtn(
                    color:0xFFffffff,
                    bGcolor: 0xFFEE3A38,
                    onPressed: (){},
                    key: null,
                    iconData: Icons.brightness_1,
                    mini: false,
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: Color(0xFF232523),
                    tooltip: 'Record',
                    child: Icon(
                      Icons.dehaze,
                      color: Colors.white,
                    ),
                  )
                ],
              );
  }

}

 