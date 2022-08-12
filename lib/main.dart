// If Function doesn't take any argument, use VoidCallback instead of Function

// LIFTING THE STATE UP--
//    You manage the state on the shared/common denominator of the different widgets that need the state
//    Here, MyApp is the common denominator of Question and Answer widget
//    That's the reason that even if we need to setState in Answer file, then too we used stateless widget
//       As we can manage state in parent MyApp

// in map, key is the index itself

// String username = 'Max'; --> Type string and if null safety is on, it would error if we try to
//                              assign username = null;
// String? username = 'Max'; --> Says that username will probably be a string but can also be a null

//First import package
import 'package:first_app/result.dart';
import 'package:flutter/material.dart';

//Then import own file
import './quiz.dart';
import './result.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  // var questions = const [
  final _questions = const [
    // MAP- Key Value pair
    // Syntax- {}, or Map()
    {
      // 'Key' : 'Value',   // Key name is upto us   // Value can be of any data type
      'questionText': 'What\'s your favorite color?', // String
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ], // List
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9},
      ],
    },
    {
      'questionText': 'Who\'s your favourite instructor?',
      'answers': [
        {'text': 'Max', 'score': 1},
        {'text': 'Sam', 'score': 1},
        {'text': 'Ruby', 'score': 1},
        {'text': 'Angelina', 'score': 1},
      ],
    },
    // 'What\'s your favorite color?',
    // 'What\'s your favorite animal?',
  ]; // Only this list is constant, we can further assign values to var questions
  // questions = []; This doesn't work if questions is a constant

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    {
      setState(() {
        _questionIndex = _questionIndex + 1;
      });
      print(_questionIndex);
      if (_questionIndex < _questions.length) {
        print('We have more questions!');
      } else {
        print('No more questions!');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // const- totally const not just runtime, but also during dev, complilation, etc
    // final - we never intend to change the value once our program runs (runtime const value)
    //         we can just assign the value initially
    //         one question changes to 2nd as we call setState and the widget tree is built again
    //         gets locked during runtime, else unlocked during development, compilation, etc

    // var dummy = const ['Hello'];
    //  dummy.add('Max');  Above const so can't add
    //  Unlike map, add modifies the object
    // print(dummy);
    // dummy = [];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length /*condtion*/
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              ) /*if true*/
            : /*else*/ Result(_totalScore, _resetQuiz),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
