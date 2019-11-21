import 'package:flutter/material.dart';

class FloatingActionBtn extends StatefulWidget{
  final VoidCallback onPressed;
  var bGcolor;
  var color;
  final IconData iconData;
  bool mini;

  FloatingActionBtn({
    Key key,
    @required this.onPressed,
    @required this.iconData,
    @required this.color,
    @required this.bGcolor,
    this.mini,    
    
  });

  @override
  State<StatefulWidget> createState() {
    return _FloatingActionBtn();
  }

}
class _FloatingActionBtn extends State<FloatingActionBtn>{
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(widget.iconData,color: Color(widget.color),),
      mini: widget.mini,
      backgroundColor: Color(widget.bGcolor),
      onPressed: widget.onPressed,
      heroTag: null,
    );
  }

}