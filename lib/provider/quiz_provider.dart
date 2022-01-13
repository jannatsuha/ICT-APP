import 'package:first_full_app/model/question_model.dart';
import 'package:first_full_app/repo/quiz_repo.dart';
import 'package:first_full_app/screens/quiz_page_start.dart';
import 'package:first_full_app/screens/score_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class QuizProvider with ChangeNotifier {
  QuizRepo quizRepo =QuizRepo();
  List<QuestionModel> _questionModelList= [];
  List<QuestionModel> get questionModelList => _questionModelList;

  initializeAllQuestion(){
    if(_questionModelList.length == 0){
      _questionModelList.clear();
      _questionModelList= quizRepo.getQuestionModelList;
      notifyListeners();
    }
  }

  checkAnswer(int index){
    ansVisibility=true;
    if(questionModelList
    [questionNumber].answerValue[index]==1)
    {
      score++;
      optionColorList[index]=Color(0xff24ad08);
    }
    else
    {
      optionColorList[index]=Color(0xffef071a);
    }
    notifyListeners();
  }

  decQuestionNumber(){
    if(questionNumber>0)
    {
      questionNumber--;
    }
    else
    {

    }
    notifyListeners();

  }

  initScore(){
    score=0;
    notifyListeners();
  }
  nextButtonPress(context){
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
    notifyListeners();
  }

}