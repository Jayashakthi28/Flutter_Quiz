import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/button.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(
      {super.key, required this.answers, required this.changeScreen});
  final List<String> answers;
  final Function(String screen) changeScreen;
  @override
  State<StatefulWidget> createState() {
    return _QuestionScreen();
  }
}

class _QuestionScreen extends State<QuestionScreen> {
  int currIdx = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(30),
        color: Colors.blue,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Text(questions[currIdx].question,
                    style: GoogleFonts.poppins(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      fontStyle: FontStyle.normal,
                      fontSize: 20,
                      decoration: TextDecoration.none,
                    )),
              ),
              ...questions[currIdx].getShuffledAnswers().map((e) => Button(
                  buttonText: e,
                  buttonPress: () {
                    widget.answers.add(e);
                    if (currIdx < questions.length - 1) {
                      setState(() {
                        currIdx++;
                      });
                    } else {
                      widget.changeScreen("result-screen");
                    }
                  }))
            ],
          ),
        ));
  }
}
