import 'package:first_full_app/screens/quiz_page_start.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
            top: 98.0, left: 8,right: 8),
        child: Center(
          child: Column(
            children: [
              Text("Let's start the quiz",
              style: TextStyle(
                fontSize: 25
              ),),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context)=>
                                QuizStart()));
                  },
                  child: Text("Start"))
            ],
          ),
        ),
      ),
    );
  }
}
