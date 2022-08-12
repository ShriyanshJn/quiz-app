import 'package:flutter/material.dart';
import './answer.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  // not adding _ as the class is public
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz(
      {@required this.questions,
      @required this.answerQuestion,
      @required this.questionIndex});
  // @required tells dart that all these values are required and even a single
  //      one of 'em can't be emmited

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Text(
        //   questions[_questionIndex],
        // ),
        Question(
          // From question.dart file
          questions[questionIndex]['questionText'],
        ),

        // as List <String> tells dart that ['answers'] is confirmed List of String
        // Converting List of map into List of widget

        // Here, children is a list into which we are putting another list, which gives error
        // To resolve this, we use ... which take a list and pull all the values out of it
        //    and add them to the surrounding list (children,here) as individual values
        //    So that we are not adding list to a list, but value to a list

        // MAPPING LIST TO WIDGET
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text']);
        }).toList() //  We are telling dart that the value we get just convert it to list

        // RaisedButton(
        //   child: Text('Answer 1'),
        //   onPressed: _answerQuestion,
        // ),
        //Answer(_answerQuestion), // From answer.dart file
        // RaisedButton(
        //   child: Text('Answer 2'),
        //   onPressed: () => print('Answer 2 chosen!'),
        // ),
        //Answer(_answerQuestion), // _answerQuestion()- Executing fx
        // RaisedButton(
        //   child: Text('Answer 3'),
        //   onPressed: () {
        //     // ...
        //     print('Answer 3 chosen');
        //   },
        // ),
        //Answer(
        //_answerQuestion), // _answerQuestion- Passing pointer at this fx to Answer widget
        // The fx (address) we are passing around is also known as a "callback"
        //     because the receiving widget calls it in the future
      ],
    );
  }
}
