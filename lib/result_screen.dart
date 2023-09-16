import 'package:flutter/material.dart';
import 'models/questions.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen(this.page, this.finalA, {super.key});
  final void Function() page;
  final List<String> finalA;
  final List nCorrect = [];

  int numC(List<String> finalA) {
    int x = 0;
    for (int i = 0; i < finalA.length; i++) {
      if (qOrigin[0].answers[0] == finalA[i]) {
        x++;
      }
    }
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height / 6),
          Text(
            "Score = ${numC(finalA)} from ${qOrigin.length}",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 30,
              color: Colors.yellowAccent,
              fontWeight: FontWeight.w900,
            ),
          ),
          const Divider(
            color: Colors.yellowAccent,
            height: 50,
            thickness: 2,
          ),
          Resultbar(finalA),
          const Divider(
            color: Colors.yellowAccent,
            height: 50,
            thickness: 2,
          ),
          TextButton(
            onPressed: page,
            child: const Text(
              "Restart",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

class Resultbar extends StatelessWidget {
  Resultbar(this.finalA, {Key? key}) : super(key: key);

  final List<String> finalA;
  final List<Widget> a = [];

  void maker() {
    a.clear();
    int i = 0;

    int istrue = 0;
    while (i < qOrigin.length) {
      istrue = 0;
      if (qOrigin[0].answers[0] == finalA[i]) {
        istrue = 1;
      }
      a.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: CircleAvatar(
                  backgroundColor: Colors.black38,
                  child: Text(
                    "${i + 1}",
                    style: TextStyle(
                        color: istrue == 1 ? Colors.green : Colors.red,
                        fontWeight: FontWeight.w900,
                        fontSize: 25),
                  ),
                ),
              ),
              Expanded(
                flex: 10,
                child: Column(
                  children: [
                    Text(
                      qOrigin[i].text,
                      style: const TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    Text(
                      qOrigin[i].answers[0],
                      style:
                          const TextStyle(color: Colors.yellow, fontSize: 20),
                    ),
                    Text(
                      finalA[i],
                      style: TextStyle(
                          color: istrue == 1 ? Colors.green : Colors.red,
                          fontSize: 20),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
      i++;
    }
  }

  @override
  Widget build(BuildContext context) {
    maker();
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: SingleChildScrollView(
        child: Column(
          children: a,
        ),
      ),
    );
  }
}
