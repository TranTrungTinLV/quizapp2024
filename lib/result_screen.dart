import 'package:flutter/material.dart';
import 'package:quiz_check_deep/data/quizData.dart';
import 'package:quiz_check_deep/homepage.dart';
import 'package:quiz_check_deep/question_sumary.dart';
import 'package:quiz_check_deep/quiz.dart';
// import 'question_sumary.dart';
class ResultScreen extends StatelessWidget {
  // static String id = 'result-screen';
  const ResultScreen({super.key, required this.getNumberchosenAnswer, required this.onRestart});
 final List<String> getNumberchosenAnswer;
  final void Function() onRestart;

 List<Map<String,Object>> getSumaryData(){
   final List<Map<String,Object>> sumary = [];

   for(var i = 0; i<getNumberchosenAnswer.length; i++){
     sumary.add({
       'question_index': i,
       'question': questions[i].text,
       'correct_question': questions[i].answers[0],
       'user_answer': getNumberchosenAnswer[i]
     }); //add object
   }
   return sumary;
 }

  @override
  Widget build(BuildContext context) {
   final sumaryData = getSumaryData();
   final  numberTotalQuestion = questions.length; //tổng số câu hỏi
   final numberCorretQuestion = sumaryData.where((data) {

     return data['user_answer'] == data['correct_question'];
   }).length; //tổng câu
    return Column(
        // mainAxisSize: MainAxisSize.min,
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You answer $numberCorretQuestion out of $numberTotalQuestion questions currently!',
            textAlign: TextAlign.center,

            style: TextStyle(fontSize: 25.0,color: Colors.white),
          ),
          SizedBox(height: 30,),
          Container(
            // color: Colors.red,
            // padding: EdgeInsets.all(10),
            height: 400,
            padding: EdgeInsets.symmetric(horizontal: 30),
            // margin: EdgeInsets.symmetric(vertical: 10),
            child: Center(child: QuestionSumary(sumaryData, txt: false,)),),
          SizedBox(height: 30,),
          ElevatedButton.icon(onPressed: onRestart, icon: Icon(Icons.restart_alt,color: Colors.white,), label: styleText(title: 'Restart'), style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),)
        ],
      );

  }
}
