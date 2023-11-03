import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key, required this.changeScreen});
  final Function(String screenName) changeScreen;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.blue),
      child: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 200,
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: ElevatedButton(
                onPressed: () {
                  changeScreen("question-screen");
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                child: Text("Start Quiz",
                    style: GoogleFonts.poppins(
                      color: Colors.blue,
                    ))),
          ),
        ]),
      ),
    );
  }
}
