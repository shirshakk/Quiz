import 'package:flutter/material.dart';
import 'package:flutter_quiz/FirstScreen.dart';
import 'package:flutter_quiz/data/dummyquestion.dart';
import 'package:flutter_quiz/question.dart';
import 'package:flutter_quiz/resultScreen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget? ActiveScreen;

  final List<String> selectedAnswer = [];
  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == question.length) {
      setState(() {
        ActiveScreen = Result(
          chosenAnswer: selectedAnswer,
        );
      });
    }
  }

  @override
  void initState() {
    ActiveScreen = FirstScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      ActiveScreen = QuestionScreen(
        onSelectAnswer: chooseAnswer,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(225, 78, 13, 151),
            Color.fromARGB(225, 107, 15, 168),
          ], begin: Alignment.topLeft, end: Alignment.bottomLeft)),
          child: ActiveScreen,
        ),
      ),
    );
  }
}
