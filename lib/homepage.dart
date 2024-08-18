import 'dart:ffi';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static String id = 'home-page';
  const HomePage(this.startQuiz,{super.key});
  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return
      Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                child: Opacity(opacity: 0.6,child: Image.asset('assets/images/quiz-logo.png')),
                width: 300,
                // height: 300,
                padding: EdgeInsets.only(bottom: 20.0),
              ),
              SizedBox(height: 80.0,),
              styleText(title: 'Learn Flutter The Fun Way'),
              TextButton.icon(onPressed: startQuiz, icon: Icon(Icons.arrow_right_alt, color: Colors.white,),label: Text('Start Quiz',style: TextStyle(fontSize: 20.0,color: Colors.white),))
            ],
          ),
      );
  }
}

class styleText extends StatelessWidget {
  styleText({
    super.key,
    required this.title,
    this.colors = Colors.white,
    this.fontSize = 25.0,
    this.textSTyle
  });
  String title;
  Color? colors;
  double? fontSize;
  TextAlign? textSTyle;
  @override
  Widget build(BuildContext context) {
    return Text(title, textAlign:  textSTyle,style: TextStyle(fontSize: fontSize,color: colors),);
  }
}
