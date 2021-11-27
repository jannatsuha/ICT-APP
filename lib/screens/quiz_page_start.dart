import 'package:first_full_app/model/question_model.dart';
import 'package:first_full_app/provider/quiz_provider.dart';
import 'package:first_full_app/screens/quiz.dart';
import 'package:first_full_app/screens/score_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuizStart extends StatefulWidget {
  const QuizStart({Key? key}) : super(key: key);

  @override
  _QuizStartState createState() => _QuizStartState();
}

late bool ansVisibility;
int questionNumber=0;
int score=0;
bool prevVisibility=false;
late List<Color> optionColorList;
class _QuizStartState extends State<QuizStart> {

  @override
  void initState() {

    ansVisibility= false;
    optionColorList= [
      Color(0xff000000),
      Color(0xff000000),
      Color(0xff000000),
      Color(0xff000000)
    ];
    if(questionNumber!=0)
      {
        setState(() {
          prevVisibility=true;
        });
      }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<QuizProvider>(context,listen: false).initializeAllQuestion();
    return Scaffold(
      body: Consumer<QuizProvider>
        (
          builder: (context,quizProvider,child){
          return Padding(
            padding: const EdgeInsets.only(
                top: 58.0, left: 8,right: 8),
            child: Column(
              children: [
                Row(
                  children: [
                    Text("Question ${questionNumber+1} out of ${quizProvider.questionModelList.length}",
                      style: TextStyle(fontSize: 17),),
                    Spacer(),
                    Text("Score: ${score}",
                      style: TextStyle(fontSize: 17),),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Column(
                  children: [
                    Text("${questionNumber+1}. ${quizProvider.questionModelList[
                    questionNumber].question}",
                      style: TextStyle(fontSize: 24),),
                    SizedBox(
                      height: 30,
                    ),
                    for(int i=0;i<4;i++)
                      InkWell(
                        onTap: (){
                          quizProvider.checkAnswer(i);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 50,
                            width: 250,
                            decoration: BoxDecoration(
                                color: optionColorList[i],
                                border: Border.all()
                            ),
                            child: Center(
                              child: Text(quizProvider.questionModelList[
                              questionNumber].optionList[i],
                                style: TextStyle(fontSize: 20,
                                    color:Colors.white,
                                    fontWeight: FontWeight.bold),),
                            ),
                          ),
                        ),
                      ),

                  ],
                ),

                SizedBox(
                  height: 30,
                ),
                for(int j=0;j<4;j++)
                  if(quizProvider.questionModelList
                  [questionNumber].answerValue[j]==1)
                    Visibility(
                      visible: ansVisibility,
                      child: Text("Correct Answer:   ${quizProvider.questionModelList
                      [questionNumber].optionList[j]}",
                        style: TextStyle(fontSize: 20),),
                    ),
                SizedBox(
                  height: 30,
                ),

                Row(
                  children: [
                    Visibility(
                      visible: prevVisibility,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.teal
                          ),
                          onPressed: (){
                            quizProvider.decQuestionNumber();
                            //initState();
                          },
                          child: Container(
                            width: 90,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.arrow_back,size: 18,),
                                SizedBox(width: 5,),
                                Text("Previous",style: TextStyle(
                                    fontSize: 16
                                ),),
                              ],
                            ),
                          )),
                    ),
                    Spacer(),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.teal
                        ),
                        onPressed: (){
                          quizProvider.nextButtonPress(context);
                          initState();
                        },
                        child: Container(
                          width: 90,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Next",style: TextStyle(
                                  fontSize: 16
                              ),),
                              SizedBox(width: 5,),
                              Icon(Icons.arrow_forward,size: 18,)
                            ],
                          ),
                        )),
                  ],
                )
              ],
            ),
          );
      })
    );
  }
}
