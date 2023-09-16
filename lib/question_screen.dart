import 'package:flutter/material.dart';
import 'models/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(this.quizDone, {super.key});
  final void Function(List<String> finalA) quizDone;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int index = 0;
  var currentQ = questions[0];
  List<String> chosenA = [];

  void tap(String answer) {
    setState(() {
      chosenA.add(answer);
      if (index + 1 < questions.length) {
        index++;
      } else {
        widget.quizDone(chosenA);
        index = 0;
        chosenA = [];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    currentQ = questions[index];
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            currentQ.text,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 20,
          ),
          ...Alist(currentQ, tap).maker(),
        ],
      ),
    );
  }
}

class Alist {
  Alist(this.cq, this.tap);
  Questions cq;

  final void Function(String awnser) tap;

  List<BButton> maker() {
    int i = 0;
    List<BButton> a = [];
    while (i < cq.answers.length) {
      a.add(
        BButton(cq.answers[i], tap),
      );
      i++;
    }
    a.shuffle();
    return a;
  }
}

class BButton extends StatelessWidget {
  const BButton(this.answer, this.tap, {super.key});
  final String answer;
  final void Function(String) tap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 4),
      child: ElevatedButton(
        onPressed: () {
          tap(answer);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black38,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Text(
            answer,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
