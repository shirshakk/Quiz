import 'package:flutter/material.dart';
import 'package:quiz/firstpage.dart';
import 'package:quiz/questionmodel.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen(
      {super.key, required this.userAnswers, required this.questions});
  final List<Questionmodel> questions;
  final List<String> userAnswers;
  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  void _onTab(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FirstPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 218, 114, 237),
      body: Container(
        padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Result',
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 50,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.questions.length,
                  itemBuilder: (context, index) {
                    if (index < widget.questions.length &&
                        index < widget.userAnswers.length) {
                      final question = widget.questions[index];
                      final userAnswer = widget.userAnswers[index];

                      return ListTile(
                        title: Text(
                          question.text,
                          style: const TextStyle(fontSize: 30),
                        ),
                        subtitle: Text(
                          'User Answer: $userAnswer',
                          style: const TextStyle(
                              fontSize: 20,
                              // fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      );
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 90),
                child: ElevatedButton(
                    onPressed: () {
                      _onTab(context);
                    },
                    child: const Text(
                      'Restart',
                      style: TextStyle(fontSize: 25),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
