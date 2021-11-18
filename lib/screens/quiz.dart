import 'package:first_full_app/helper/custom_appbar.dart';
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
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CustomAppBar(titile:
          'Quiz Page',)
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            top: 8.0, left: 8,right: 8),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Let's start the quiz",
              style: TextStyle(
                fontSize: 25
              ),),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.teal
                ),
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
