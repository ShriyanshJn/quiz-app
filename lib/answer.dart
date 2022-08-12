// For holding answer widget from main.dart file

// color : Colors.blue, ---> By using . we are accessing static properties of Colors class

import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  // Means value stored in this property has to be a fx/pointer at a fx
  final Function selectHandler;
  // final VoidCallback selectHandler;
  // Storing _answerQuestion pointer at a fx
  final String answerText;

  // Constructor to accept values from main.dart file
  Answer(this.selectHandler,this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        child: Text(answerText),
        onPressed:
            selectHandler, // not using () as we don't want to execute it immediately
      ),
    );
  }
}
