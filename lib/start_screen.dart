import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.quiz_outlined,
            size: 200,
            color: Colors.white,
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            "A Flutter QuizApp Powered by StatefulWidgets!",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white60,
                fontWeight: FontWeight.w700,
                fontSize: 20),
          ),
          const SizedBox(
            height: 100,
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            label: const Text(
              "Start",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 35,
              ),
            ),
            icon: const Icon(
              Icons.play_arrow,
              size: 35,
            ),
          )
        ],
      ),
    );
  }
}
