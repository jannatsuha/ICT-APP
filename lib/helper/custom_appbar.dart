import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  String titile;

   CustomAppBar({Key? key,
    required this.titile}) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.teal,
      title: Text(widget.titile),
    );
  }
}
