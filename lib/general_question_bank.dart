import 'questions.dart';

class GeneralQuestionBank {
  int _questionNumber = 0;
  bool _finished = false;
  List<Question> questions = [
    Question('You can lead a cow down stairs but not up stairs.', true),
    Question('You can lead a donkey down stairs but not up stairs.', false),
    Question('You can lead a mouse down stairs but not up stairs.', true),
    Question('You can lead a cow down stairs but not up stairs.', true),
    Question('You can lead a donkey down stairs but not up stairs.', false),
    Question('You can lead a mouse down stairs but not up stairs.', true),
    Question('You can lead a cow down stairs but not up stairs.', true),
    Question('You can lead a donkey down stairs but not up stairs.', false),
    Question('You can lead a mouse down stairs but not up stairs.', true),
  ];

  generateQuestion() {
    return questions[_questionNumber].question;
  }

  getCorrectAnswer() {
    return questions[_questionNumber].answer;
  }

  nextQuestion() {
    if (_questionNumber < questions.length - 1) {
      _questionNumber++;
    }
  }

  isFinished() {
    if (_questionNumber >= questions.length - 1) {
      _finished = true;
    } else {
      _finished = false;
    }
    return _finished;
  }

  resetGame() {
    _questionNumber = 0;
  }
}
