import 'package:flutter/material.dart';

class ScoreIcon {
  List<Icon> scoreKeeper = [];
  addRed() {
    scoreKeeper.add(Icon(
      Icons.close,
      color: Colors.red,
    ));
  }

  addGreen() {
    scoreKeeper.add(Icon(
      Icons.check,
      color: Colors.green,
    ));
  }
}
