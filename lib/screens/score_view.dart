import 'package:first_full_app/screens/my_home_page.dart';
import 'package:flutter/material.dart';
class ScoreView extends StatefulWidget {
  int totalScore;
   ScoreView({Key? key,required this.totalScore}) : super(key: key);

  @override
  _ScoreViewState createState() => _ScoreViewState();
}

class _ScoreViewState extends State<ScoreView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Total Score:",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20
            ),),
            Text(widget.totalScore.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.teal,
                  fontSize: 20
              ),),

          ],
        ),

      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(48.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.teal
          ),
            onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context)=>MyHomePage()));
            },
            child: Text("Go To Home Screen"
            )),
      ),
    );
  }
}
