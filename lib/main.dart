import 'package:flutter/material.dart';
import 'package:quiz_check_deep/quiz.dart';

import 'homepage.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Quiz();
  }
}
