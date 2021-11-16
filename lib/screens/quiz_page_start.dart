import 'package:first_full_app/model/question_model.dart';
import 'package:first_full_app/screens/quiz.dart';
import 'package:flutter/material.dart';

class QuizStart extends StatefulWidget {
  const QuizStart({Key? key}) : super(key: key);

  @override
  _QuizStartState createState() => _QuizStartState();
}

QuestionModel questionModel1= QuestionModel
  (
    "What is the capital of Bangladesh?",
    ["Sylhet","Dhaka","Barisal","Noyakhali"],
    [0,1,0,0]
);
QuestionModel questionModel2= QuestionModel
  (
    "What is the national flower of Bangladesh?",
    ["Water Lily","Rose","Goldmery","Cosmos"],
    [1,0,0,0]
);
QuestionModel questionModel3= QuestionModel
  (
    "What is the national animal of Bangladesh?",
    ["Cat","Pegion","Dog","Tiger"],
    [0,0,0,1]
);

List<QuestionModel> questionModelList=[
  questionModel1,
  questionModel2,
  questionModel3
];
late bool ansVisibility;
int questionNumber=0;
int score=0;
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
            top: 58.0, left: 8,right: 8),
        child: Column(
          children: [
            Row(
              children: [
                Text("Question ${questionNumber+1} out of ${questionModelList.length}",
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
             Text("${questionNumber+1}. ${questionModelList[
               questionNumber].question}",
            style: TextStyle(fontSize: 24),),
             SizedBox(
            height: 30,
          ),
             for(int i=0;i<4;i++)
              InkWell(
                onTap: (){
                  setState(() {
                    ansVisibility=true;
                      if(questionModelList
                      [questionNumber].answerValue[i]==1)
                      {
                          score++;
                          optionColorList[i]=Color(0xff24ad08);
                      }
                      else
                        {
                          optionColorList[i]=Color(0xffef071a);
                        }
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                      border: Border.all()
                    ),
                    child: Center(
                      child: Text(questionModelList[
                        questionNumber].optionList[i],
                      style: TextStyle(fontSize: 20,color: optionColorList[i]),),
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
              if(questionModelList
              [questionNumber].answerValue[j]==1)
            Visibility(
              visible: ansVisibility,
              child: Text("Correct Answer:   ${questionModelList
              [questionNumber].optionList[j]}",
                style: TextStyle(fontSize: 20),),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: (){
                  setState(() {
                    if(questionNumber<2)
                    questionNumber++;
                    else
                     {
                       questionNumber=0;
                       Navigator.push(context,
                           MaterialPageRoute(
                               builder: (context)=>Quiz()));
                     }
                  });
                  initState();
                },
                child: Text("Next"))
          ],
        ),
      ),
    );
  }
}
