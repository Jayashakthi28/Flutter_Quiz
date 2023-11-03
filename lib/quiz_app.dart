import 'package:flutter/material.dart';
import 'package:quiz/quiz_screen.dart';
import 'package:quiz/questions_screen.dart';
import 'package:quiz/result_screen.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});
  @override
  State<StatefulWidget> createState() {
    return _QuizApp();
  }
}

class _QuizApp extends State<QuizApp> {
  String currScreen = "quiz-screen";
  List<String> answers = [];
  void changeScreen(String screenName) {
    setState(() {
      currScreen = screenName;
    });
  }

  void reStartQuiz() {
    setState(() {
      answers = [];
      currScreen = "question-screen";
    });
  }

  @override
  Widget build(BuildContext context) {
    return currScreen == "quiz-screen"
        ? QuizScreen(changeScreen: changeScreen)
        : currScreen == "question-screen"
            ? QuestionScreen(
                answers: answers,
                changeScreen: changeScreen,
              )
            : ResultScreen(userAnswers: answers,restartQuiz: reStartQuiz,);
  }
}
