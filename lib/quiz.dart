import 'package:flutter/material.dart';

import 'question_screen.dart';
import 'result_screen.dart';
import 'start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  String page = 'start';
  List<String> finalA = [];

  void swichScreen1() {
    setState(() {
      page = 'quiz';
    });
  }

  void swichScreen2(List<String> flist) {
    setState(() {
      finalA = flist;
      page = 'result';
    });
  }

  void swichScreen3() {
    setState(() {
      page = 'start';
    });
  }

  @override
  Widget build(BuildContext context) {
    if (page == 'start') {
      activeScreen = StartScreen(swichScreen1);
    } else if (page == 'quiz') {
      setState(() {
        activeScreen = QuestionScreen(swichScreen2);
      });
    } else {
      setState(() {
        activeScreen = ResultScreen(swichScreen3, finalA);
      });
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.black, Colors.blue.shade900],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
