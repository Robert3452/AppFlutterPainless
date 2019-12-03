import 'package:flutter/material.dart';
import 'package:flutter_app_painless/record/bloc/bloc.dart';
import 'package:flutter_app_painless/record/ui/widgets/floating_buttons.dart';
import 'package:flutter_app_painless/record/ui/widgets/screen_recorder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app_painless/record/bloc/http_logic.dart';

class Nav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0XFF000000), Colors.black],
                begin: FractionalOffset(0.2, 0.0),
                end: FractionalOffset(1.0, 0.6),
                stops: [0.0, 0.6],
                tileMode: TileMode.clamp,
              ),
            ),
          ),
          BlocProvider(
            builder: (_) => RecorderBloc(
              logic: SimpleHttpLogic(),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: screenHeight * 0.045),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.settings),
                        onPressed: () {},
                        color: Colors.grey,
                        iconSize: 20,
                      ),
                    ],
                  ),
                ),
                ScreenRecorder(),
                Container(
                  margin: EdgeInsets.only(
                    top: screenHeight * 0.60,
                  ),
                  child: FloatingButtons(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
