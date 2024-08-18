class QuizQuestion {
  const QuizQuestion(this.text, this.answers);
  final String text;
  final List<String> answers;

  List<String> getShuffeAnswer(){
    final shufferedList = List.of(answers); //xao tron danh sach cau tra loi
    shufferedList.shuffle();
    return shufferedList;
  }
}