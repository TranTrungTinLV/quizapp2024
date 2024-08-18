import 'package:flutter/material.dart';
import 'package:quiz_check_deep/homepage.dart';
class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key,required this.getAnswer, required this.answerText, });
  final String answerText;
  final Function() getAnswer;
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,children: [
      ElevatedButton(onPressed: getAnswer,style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,padding: EdgeInsets.symmetric(vertical: 10,horizontal: 40)), child: styleText(title: answerText,colors: Colors.black,fontSize: 18,)),
      SizedBox(height: 10,)
    ],);
  }
}
