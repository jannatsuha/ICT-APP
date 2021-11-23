import 'package:flutter/material.dart';
class FullImageShow extends StatefulWidget {
  String imageLink;
   FullImageShow({Key? key,
     required this.imageLink}) : super(key: key);

  @override
  _FullImageShowState createState() => _FullImageShowState();
}

class _FullImageShowState extends State<FullImageShow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Image.asset(widget.imageLink)
      ,
    );
  }
}
