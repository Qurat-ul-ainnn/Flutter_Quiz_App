import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int finalScore;
  final Function() resetHandler;
  Result(this.finalScore, this.resetHandler);
  String get resultPhrase {
    String resultText;
    if (finalScore <= 10) {
      resultText = 'You' 're a beginner!';
    }
    if (finalScore <= 20) {
      resultText = 'You' 're into coding!';
    } else if (finalScore <= 30) {
      resultText = 'Pretty likeable!';
    } else if (finalScore <= 40) {
      resultText = 'You are ... strange?!';
    } else {
      resultText = 'You are such a programmer!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: <Widget>[
        Text(
          resultPhrase,
          style: TextStyle(
            fontSize: 38,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        TextButton(
          onPressed: resetHandler,
          child: Text('Restart Quiz!'),
          style: TextButton.styleFrom(foregroundColor: Colors.blue),
        ),
      ]),
    );
  }
}
