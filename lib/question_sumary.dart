import 'package:flutter/material.dart';

class QuestionSumary extends StatelessWidget {
   QuestionSumary(this.summaryData,{super.key, required this.txt});

  final List<Map<String,Object>> summaryData;
  final bool txt;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: summaryData.map((data) {
          final isCorrect = data['user_answer'] == data['correct_question'];
          final textColor = isCorrect ? Colors.green : Colors.red;

            return Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
      
              children: [
                  Container(
                    height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: textColor
                      ),
                      child: Text(((data['question_index'] as int) + 1).toString(),style: TextStyle(fontSize: 20),textAlign: TextAlign.center,)),
                SizedBox(width: 10,),//key
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(data['question'] as String,style: TextStyle(fontSize: 20,color: Colors.white),),
                        Text(data['user_answer'] as String,style: TextStyle(fontSize: 20,color: Colors.purpleAccent),),
                        Text(data['correct_question'] as String,style: TextStyle(fontSize: 20,color: Colors.green),),
                        SizedBox(height: 10,)
                      ],
                    ),
                  )
              ],
        );
        },).toList(),
      ),
    );
  }
}
