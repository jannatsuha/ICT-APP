import 'package:first_full_app/model/question_model.dart';
import 'package:first_full_app/screens/quiz.dart';
import 'package:first_full_app/screens/score_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuizStart extends StatefulWidget {
  const QuizStart({Key? key}) : super(key: key);

  @override
  _QuizStartState createState() => _QuizStartState();
}

QuestionModel qustionModel1= QuestionModel
  (
    "বাংলাদেশের রাজধানি কোনটা?",
    [ "বগুড়া","ফকিরহাট","বাগেরহাট","ঢাকা"],
    [0,0,0,1]
);

QuestionModel qustionModel2= QuestionModel
  (
    "পদ্মা সেতু কোন দু’টি জেলাকে সংযুক্ত করেছে?",
    [ "বগুড়া ও মুন্সীগঞ্জ","মুন্সীগঞ্জ ও শরীয়তপুর","বাগেরহাট ও ঢাকা","ঢাকা ও সরিয়তপুর"],
    [0,1,0,0]
);

QuestionModel qustionModel3= QuestionModel
  (
    "বাংলাদেশের সর্বাধিক চা বাগান কোন জেলায় অবস্থিতে?",
    [ "মৌলভীবাজার","মুন্সীগঞ্জ","শরীয়তপুর","ঢাকা"],
    [1,0,0,0]
);

QuestionModel qustionModel4= QuestionModel
  (
    "বাংলাদেশের পুলিশ মুক্তিযুদ্ধ জাদুঘর কোথায় অবস্থিত?",
    [ "রাজারবাগ, ঢাকা","গাবতলী, ঢাকা"," মাহবাগ, ঢাকা","জাহঙ্গীর নগর, ঢাকা",],
    [1,0,0,0]
);

QuestionModel qustionModel5= QuestionModel
  (
    "মুক্তিযুদ্ধের আত্মসমর্পণ দলিল কোথায় স্বাক্ষরিত হয়ে?",
    [ "রজারবাগ ময়দানে","রেসকোর্স ময়দানে","জাহঙ্গীর নগর ময়দানে","ঢাকা ময়দান"],
    [0,1,0,0]
);

QuestionModel qustionModel6= QuestionModel
  (
    "আয়তনে বাংলাদেশের সবচেয়ে বড় জেলা কোনটি?",
    [ "সিলেট","মুন্সীগঞ্জ","পার্বত্য রাঙামাটি","বগুড়া"],
    [0,0,1,0]
);

QuestionModel qustionModel7= QuestionModel
  (
    "বাংলাদেশের কোন জেলাটির নামকরণ করা হয়েছে একটি নদীর নাম অনুসারে",
    [ "সিলেট","মুন্সীগঞ্জ","ফেনীি","গোপালগঞ্জ"],
    [0,0,1,0]
);

QuestionModel qustionModel8= QuestionModel
  (
    "রাখাইন উপজাতিদের অধিক বাস কোন জেলায়",
    [ "মুন্সীগঞ্জ জেলায়","নেত্রকোণা জেলায়",
      "কক্সবাজার জেলায়","শেরপুর জেলায়"],
    [0,0,1,0]
);

QuestionModel qustionModel9= QuestionModel
  (
    "আয়তনের দিক থেকে বিশ্বে বাংলাদেশের অবস্থান কত তম",
    [ "৮০","৬০","৫০","৯০"],
    [0,0,0,1]
);
QuestionModel qustionModel10= QuestionModel
  (
    "বাংলাদেশের প্রথম নিরক্ষরতামুক্ত গ্রাম কোনটি",
    [ "মানিকগঞ্জ","গাজীপুর","কচুবাড়ির কৃষ্টপুর, ঠাকুরগাঁও","জামালপুর"],
    [0,0,1,0]
);
List<QuestionModel> questionModelList=[
  qustionModel1,
  qustionModel2,
  qustionModel3,
  qustionModel4,
  qustionModel5,
  qustionModel6,
  qustionModel7,
  qustionModel8,
  qustionModel9,
  qustionModel10
];
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
                    width: 250,
                    decoration: BoxDecoration(
                      color: optionColorList[i],
                      border: Border.all()
                    ),
                    child: Center(
                      child: Text(questionModelList[
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

            Row(
              children: [
                Visibility(
                  visible: prevVisibility,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.teal
                      ),
                      onPressed: (){
                        setState(() {
                          if(questionNumber>0)
                            {
                              questionNumber--;
                            }
                          else
                          {

                          }
                        });
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
                      setState(() {
                        if(questionNumber<9)
                        questionNumber++;
                        else
                         {
                           questionNumber=0;
                           Navigator.push(context,
                               MaterialPageRoute(
                                   builder: (context)=>ScoreView(
                                     totalScore: score,
                                   )));
                         }
                      });
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
      ),
    );
  }
}
