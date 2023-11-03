import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen(
      {super.key, required this.userAnswers, required this.restartQuiz}) {
    calculateCorrectAnswers();
  }
  final List<String> userAnswers;
  final Function() restartQuiz;
  var correctAns = 0;
  final List<Map<String, Object>> correctAnswers = [];
  void calculateCorrectAnswers() {
    correctAnswers.addAll(questions.map((e) {
      if (e.answers[0] == userAnswers[questions.indexOf(e)]) {
        correctAns++;
      }
      return {
        'index': questions.indexOf(e) + 1,
        'question': e.question,
        'answer': e.answers[0],
        'yourAnswer': userAnswers[questions.indexOf(e)]
      };
    }));
  }

  @override
  Widget build(BuildContext context) {
    int answersLen = correctAnswers.length;
    return Container(
      padding: const EdgeInsets.all(30),
      color: Colors.blue,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Result is",
              style: GoogleFonts.poppins(
                color: const Color.fromARGB(255, 255, 255, 255),
                fontStyle: FontStyle.normal,
                fontSize: 20,
                decoration: TextDecoration.none,
              )),
          Text('You got $correctAns of $answersLen correct',
              style: GoogleFonts.poppins(
                color: const Color.fromARGB(255, 255, 255, 255),
                fontStyle: FontStyle.normal,
                fontSize: 20,
                decoration: TextDecoration.none,
              )),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: SizedBox(
              height: 350,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ...correctAnswers.map((e) {
                      return Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(3),
                            height: 40,
                            width: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(40)),
                              color: (e['answer'] == e['yourAnswer'])
                                  ? Colors.green
                                  : Colors.red,
                            ),
                            child: Text('${e["index"]}',
                                style: GoogleFonts.poppins(
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  fontStyle: FontStyle.normal,
                                  fontSize: 20,
                                  decoration: TextDecoration.none,
                                )),
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 5, 0, 5),
                                    child: Text(e['question'] as String,
                                        style: GoogleFonts.poppins(
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontStyle: FontStyle.normal,
                                          fontSize: 18,
                                          decoration: TextDecoration.none,
                                        )),
                                  ),
                                  Text(
                                      "Your answer : ${e['yourAnswer'] as String}",
                                      style: GoogleFonts.poppins(
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255),
                                        fontStyle: FontStyle.normal,
                                        fontSize: 12,
                                        decoration: TextDecoration.none,
                                      )),
                                  Text(
                                      "Correct Answer : ${e['answer'] as String}",
                                      style: GoogleFonts.poppins(
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255),
                                        fontStyle: FontStyle.normal,
                                        fontSize: 12,
                                        decoration: TextDecoration.none,
                                      ))
                                ],
                              ),
                            ),
                          )
                        ],
                      );
                    })
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              onPressed: restartQuiz,
              child: Text(
                "Restart Quiz",
                style: GoogleFonts.poppins(
                  color: Colors.blue,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
