import 'package:flutter/material.dart';
import 'package:flutter_app_painless/record/ui/widgets/search_text_field.dart';

class BackgroundFiles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0XFF000000), Colors.black],
          begin: FractionalOffset(0.2, 0.0),
          end: FractionalOffset(0.4, 0.6),
          stops: [0.0, 0.6],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Column(
        children: <Widget>[
          SearchTextField(
            hintText: 'Buscar',
            iconData: Icons.search,
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Divider(
              color: Colors.white70,
              height: 10,
              thickness: 0,
            ),
          ),
        ],
      ),
    );
  }
}
