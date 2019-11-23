import 'package:flutter/material.dart';

class SearchTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final IconData iconData;
  SearchTextField(
      {Key key,
      @required this.hintText,
      @required this.iconData,
      @required this.controller});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SearchTextField();
  }
}

class _SearchTextField extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 5),
      height:50,
      child: TextField(
        controller: widget.controller,
        style: TextStyle(
            fontSize: 15,
            fontFamily: 'Lato',
            color: Colors.white60,
            fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.white12),
          contentPadding: EdgeInsets.symmetric(vertical: 2),
          prefixIcon: Icon(
            widget.iconData,
            color: Colors.white12,
          ),
          fillColor: Color.fromARGB(30, 255, 255, 255),
          filled: true,
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
        ),
      ),
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 15.0,
            offset: Offset(0.0, 0.7),
          ),
        ],
      ),
    );
  }
}
