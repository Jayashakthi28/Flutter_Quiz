class QuizQuestion {
  const QuizQuestion(this.question, this.answers);
  final String question;
  final List<String> answers;
  List<String> getShuffledAnswers() {
    List<String> currList = [...answers];
    currList.shuffle();
    return currList;
  }
}
