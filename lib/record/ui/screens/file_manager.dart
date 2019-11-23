import 'package:flutter/material.dart';
import 'package:flutter_app_painless/record/ui/widgets/background_files.dart';
import 'package:flutter_app_painless/record/ui/widgets/file_cards.dart';
// import 'package:flutter_app_painless/record/ui/widgets/search_text_field.dart';

class FileManager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          bottomOpacity: 1,
          title: Text(
            'Grabaciones',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.white54,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              // height: screenHeight,
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
            FileCards(),
            BackgroundFiles(),
          ],
        ));
  }
}

//
