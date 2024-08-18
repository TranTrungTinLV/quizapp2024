import 'package:flutter/material.dart';
import 'package:quiz_check_deep/homepage.dart';
import 'package:quiz_check_deep/questions.dart';
import 'package:quiz_check_deep/result_screen.dart';

import 'data/quizData.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];

  var activeScreen = 'home-page';

  void switchScreen(){
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void restartQuiz() {
    setState(() {
      selectedAnswer = [];
      activeScreen = 'questions-screen';
    });
  }

  void choosenAnswer(String answer){
      selectedAnswer.add(answer);
      if(selectedAnswer.length == questions.length){
      setState(() {
        activeScreen = 'result-screen';
      });
      }
  }
  @override
  Widget build(BuildContext context) {
    Widget screenWidget = HomePage(switchScreen);
    if(activeScreen == 'question-screen'){
      screenWidget = Questions( choosenanswer: choosenAnswer,);
    }
    if(activeScreen == 'result-screen'){
      screenWidget = ResultScreen(getNumberchosenAnswer: selectedAnswer, onRestart: restartQuiz,);
    }



    return  MaterialApp(
        home:  Scaffold(
          backgroundColor: Colors.purple,
          body:screenWidget,
        ),

    );
  }
}
