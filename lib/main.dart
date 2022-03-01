import 'package:flutter/material.dart';
import 'package:quizzler_app/general_question_bank.dart';
import 'package:quizzler_app/questions.dart';

import 'score_icons.dart';

void main() => runApp(Quizzler());
GeneralQuestionBank generalQuestionBank = GeneralQuestionBank();
ScoreIcon scoreIcon = ScoreIcon();

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            "Quizller",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  void choosen(bool userA) {
    if (generalQuestionBank.isFinished() == true) {
      return;
    } else if (userA == generalQuestionBank.getCorrectAnswer()) {
      scoreIcon.addGreen();
    } else {
      scoreIcon.addRed();
    }
    generalQuestionBank.nextQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Container(
                color: Colors.grey.shade800,
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                child: Text(
                  generalQuestionBank.generateQuestion(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                setState(() {
                  choosen(true);
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                setState(() {
                  choosen(false);
                });
              },
            ),
          ),
        ),
        //TODO: Add a Row here as your score keeper
        Expanded(
          child: Row(
            children: scoreIcon.scoreKeeper,
          ),
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
