import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromARGB(225, 78, 13, 151),
              Color.fromARGB(225, 107, 15, 168),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          ),
          Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 150,
                ),
                Image.asset(
                  'assets/images/quiz-logo.png',
                  width: 300,
                  color: const Color.fromARGB(150, 255, 255, 255),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'Learn Flutter in a fun way !',
                  style: TextStyle(color: Colors.white, fontSize: 28),
                ),
                const SizedBox(
                  height: 50,
                ),
                OutlinedButton.icon(
                  onPressed: startQuiz,
                  icon: const Icon(Icons.arrow_right_alt),
                  label: Text("Start Quiz"),
                  style:
                      OutlinedButton.styleFrom(foregroundColor: Colors.white),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
