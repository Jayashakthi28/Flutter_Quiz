import 'package:flutter/material.dart';
import 'package:quiz/quiz_app.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  build(context) {
    return const QuizApp();
  }
}
