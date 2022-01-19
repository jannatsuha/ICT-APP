import 'package:flutter/material.dart';
class FullImageShow extends StatefulWidget {
  List<String> imageLink;
  int index;
   FullImageShow({
     Key? key,
     required this.imageLink,
     required this.index,
   }) : super(key: key);

  @override
  _FullImageShowState createState() => _FullImageShowState();
}

class _FullImageShowState extends State<FullImageShow> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body:  Container(
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                  widget.imageLink[widget.index]
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: (){
                          setState(() {
                            if(widget.index>0)
                              widget.index--;
                          });
                        },
                        child: Icon(Icons.arrow_back_ios,
                        size: 30,color: Colors.white,)
                    ),
                    Spacer(),
                    InkWell(
                        onTap: (){
                          setState(() {
                            if(widget.imageLink.length-1>widget.index)
                              widget.index++;
                          });
                        },
                        child: Icon(Icons.arrow_forward_ios,
                        size: 30,color: Colors.white,)
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
  }
}
