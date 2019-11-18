import 'package:flutter/material.dart';

class FloatingActionBtn extends StatefulWidget{
  final VoidCallback onPressed;
  var color;
  final IconData iconData;
  bool mini;

  FloatingActionBtn({
    Key key,
    @required this.onPressed,
    @required this.iconData,
    @required this.color,
    this.mini,    
    
  });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FloatingActionBtn();
  }

}
class _FloatingActionBtn extends State<FloatingActionBtn>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FloatingActionButton(
      child: Icon(widget.iconData),
      mini: widget.mini,
      backgroundColor: Color(widget.color),
      onPressed: widget.onPressed,
      heroTag: null,
    );
  }

}