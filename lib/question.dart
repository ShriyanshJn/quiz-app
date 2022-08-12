// Splitting main.dart (app) into smaller custom widgets
//      - Easy performance, re-build and manageability
// () --> Positional argument
// ({}) --> Named argument

// class EdgeInsets
// Normally we create constructor - EdgeInsets() --> Only one
// But we can create constructors - EdgeInsets.all(), EdgeInsets.only(), etc --> Multiple

import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;
  // final tells dart that this data will never change after it's initialization in the constructor

  // Creating Question constructor
  Question(this.questionText);
  // Now the first argument passed to the Question will be stored in the questionText property

  @override
  Widget build(BuildContext context) {
    // Container -- Large blank space
    return Container(
      // Container is made up of (Margin(Border(Padding(child=Content))))

      // width is space for container
      width: double.infinity,
      // margin is spacing around the container
      // all - spacing in all directions
      // only -- spacing in particular direction
      margin: EdgeInsets.all(10),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
