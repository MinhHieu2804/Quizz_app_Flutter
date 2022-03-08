import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _index = 0;
  var totalScore = 0;
  void _answerQuestion(int score) {
    totalScore += score;
    setState(() {
      _index += 1;
    });
  }

  void _restart() {
    totalScore = 0;
    setState(() {
      _index = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'What\'s your favorite color?',
        'answers': [
          {
            'text': 'Black',
            'score': 5,
          },
          {
            'text': 'Blue',
            'score': 10,
          },
          {
            'text': 'Pink',
            'score': 15,
          },
        ],
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answers': [
          {
            'text': 'Snake',
            'score': 5,
          },
          {
            'text': 'Dog',
            'score': 10,
          },
          {
            'text': 'Cat',
            'score': 15,
          },
        ],
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My bar'),
        ),
        body: _index < questions.length
            ? Column(
                children: [
                  Question((questions[_index]['questionText']) as String),
                  ...(questions[_index]['answers'] as List<Map<String, Object>>)
                      .map((answer) {
                    return Answer(answer['text'] as String,
                        () => _answerQuestion(answer['score'] as int));
                  }).toList()
                ],
              )
            : Center(
                child: Column(children: [
                  Text(
                    'You did it!\n' + 'Your score: ' + totalScore.toString(),
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  FlatButton(
                    onPressed: _restart,
                    child: Text('Restart Quiz!'),
                    color: Colors.blue,
                    textColor: Colors.white,
                  )
                ]),
              ),
      ),
    );
  }
}
