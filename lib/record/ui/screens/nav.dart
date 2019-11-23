import 'package:flutter/material.dart';
import 'package:flutter_app_painless/record/ui/widgets/floating_buttons.dart';

class Nav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        // // height: screenHeight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0XFF000000), Colors.black],
            begin: FractionalOffset(0.2, 0.0),
            end: FractionalOffset(1.0, 0.6),
            stops: [0.0, 0.6],
            tileMode: TileMode.clamp,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
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
              Container(
                // height: screenHeight * .70,
                margin: EdgeInsets.only(top: screenHeight * 0.11),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "00:00:00",
                      style: TextStyle(
                        fontSize: 48,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Grabando",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white38,
                      ),
                    ),
                  ],
                ),
              ),
              Container(                
                margin: EdgeInsets.only(
                  top: screenHeight * 0.59,
                ),
                child: FloatingButtons(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
