import 'package:flutter/material.dart';
import 'package:quiz_check_deep/answer_button.dart';
import 'package:quiz_check_deep/homepage.dart';
import 'package:quiz_check_deep/data/quizData.dart';


class Questions extends StatefulWidget {
  const Questions({super.key, required this.choosenanswer });
  final Function(String answer) choosenanswer;
  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  var currentIndexQuestion = 0;

  void answerQuestion(String selectedAnswer){
    widget.choosenanswer(selectedAnswer);
    setState(() {
        currentIndexQuestion++;
    });

  }
  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentIndexQuestion];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
              // mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            styleText(title: currentQuestion.text,textSTyle: TextAlign.center,fontSize: 20,),
            SizedBox(height: 30,),
            ...currentQuestion.getShuffeAnswer().map((item){
              print(item);
             return AnswerButton(getAnswer: () {answerQuestion(item);}, answerText: item,);
            }),
          ]
        ),
      ),
    );
  }
}
