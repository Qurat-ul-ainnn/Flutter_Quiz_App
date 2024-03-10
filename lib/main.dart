import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  final List<Map<String, Object>> _questions = [
    {
      'questionText': 'What is your favorite web development stack?',
      'answers': [
        {'text': 'MERN', 'score': 10},
        {'text': 'MEAN', 'score': 8},
        {'text': 'LAMP', 'score': 6},
        {'text': 'Django', 'score': 9},
      ],
    },
    {
      'questionText': 'Which cloud platform do you prefer for hosting?',
      'answers': [
        {'text': 'AWS', 'score': 10},
        {'text': 'Azure', 'score': 8},
        {'text': 'Google Cloud', 'score': 7},
        {'text': 'Heroku', 'score': 9},
      ],
    },
    {
      'questionText':
          'What is your favorite design pattern in software development?',
      'answers': [
        {'text': 'Singleton', 'score': 9},
        {'text': 'Observer', 'score': 8},
        {'text': 'Factory Method', 'score': 7},
        {'text': 'Decorator', 'score': 10},
      ],
    },
    {
      'questionText': 'Which database do you use most frequently?',
      'answers': [
        {'text': 'MongoDB', 'score': 9},
        {'text': 'MySQL', 'score': 8},
        {'text': 'PostgreSQL', 'score': 7},
        {'text': 'SQLite', 'score': 10},
      ],
    },
    {
      'questionText':
          'What is your preferred mobile app development framework?',
      'answers': [
        {'text': 'Flutter', 'score': 10},
        {'text': 'React Native', 'score': 8},
        {'text': 'Xamarin', 'score': 7},
        {'text': 'NativeScript', 'score': 9},
      ],
    },
    {
      'questionText': 'What programming language would you like to learn next?',
      'answers': [
        {'text': 'Go', 'score': 9},
        {'text': 'Kotlin', 'score': 8},
        {'text': 'Swift', 'score': 7},
        {'text': 'Rust', 'score': 10},
      ],
    },
    {
      'questionText': 'Which tech conference would you love to attend?',
      'answers': [
        {'text': 'Google I/O', 'score': 10},
        {'text': 'WWDC', 'score': 8},
        {'text': 'AWS re:Invent', 'score': 7},
        {'text': 'Microsoft Build', 'score': 9},
      ],
    },
    {
      'questionText': 'What is your favorite tech podcast?',
      'answers': [
        {'text': 'Syntax', 'score': 10},
        {'text': 'Software Engineering Daily', 'score': 8},
        {'text': 'CodeNewbie', 'score': 7},
        {'text': 'The Changelog', 'score': 9},
      ],
    },
  ];

  var _totalScore = 0;
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
    if (_questions.length > _questionIndex) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('My App'),
        backgroundColor: Colors.blue,
      ),
      body: _questionIndex < _questions.length
          ? Quiz(
              answerQuestion: _answerQuestion,
              questionIndex: _questionIndex,
              questions: _questions)
          : Result(_totalScore, _resetQuiz),
    ));
  }
}
