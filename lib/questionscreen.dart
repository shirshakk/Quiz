import 'package:flutter/material.dart';
import 'package:quiz/questionpaper.dart';
import 'package:quiz/resultscreen.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  void _ResultPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ResultScreen(
                questions: questionpaper,
                userAnswers: answer,
              )),
    );
  }

  // Content
  List<String> answer = [];
  int questionnumber = 0;
  void _onTab(String Answer) {
    setState(() {
      if (questionnumber < questionpaper.length - 1) {
        questionnumber++;
        answer.add(Answer);
        print(answer.length);
      } else {
        return _ResultPage(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var currentquestion = questionpaper[questionnumber];
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 218, 114, 237),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Text(
                currentquestion.text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              width: 350,
              height: 40,
              child: ElevatedButton(
                  onPressed: () {
                    _onTab(currentquestion.Answer[0]);
                  },
                  // style: ElevatedButton.styleFrom(
                  //     shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(40))),
                  child: Text(
                    currentquestion.Answer[0],
                    style: const TextStyle(fontSize: 20),
                  )),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              width: 350,
              height: 60,
              child: ElevatedButton(
                  onPressed: () {
                    _onTab(currentquestion.Answer[1]);
                  },
                  // style: ElevatedButton.styleFrom(
                  //     shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(40))),
                  child: Text(
                    currentquestion.Answer[1],
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              width: 350,
              height: 60,
              child: ElevatedButton(
                  onPressed: () {
                    _onTab(currentquestion.Answer[2]);
                  },
                  // style: ElevatedButton.styleFrom(
                  //     shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(40))),
                  child: Text(
                    currentquestion.Answer[2],
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              width: 350,
              height: 60,
              child: ElevatedButton(
                  onPressed: () {
                    _onTab(currentquestion.Answer[3]);
                  },
                  // style: ElevatedButton.styleFrom(
                  //     shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(40))),
                  child: Text(
                    currentquestion.Answer[3],
                    style: TextStyle(fontSize: 20),
                  )),
            ),
          ],
        )),
      ),
    );
  }
}
