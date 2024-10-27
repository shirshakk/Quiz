import 'package:flutter/material.dart';
import 'package:flutter_quiz/data/dummyquestion.dart';
import 'package:flutter_quiz/questionsummary.dart';

class Result extends StatelessWidget {
  const Result({super.key, required this.chosenAnswer});
  final List<String> chosenAnswer;
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        'Question_index': i + 1,
        'Question': question[i].text,
        'Correct_Answer': question[i].answer[0],
        'User_Answer': chosenAnswer[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final totalNumberOfQuestion = question.length;
    final CorrectedNumberOfQuestion = summaryData.where((data) {
      return data['User_Answer'] == data['Correct_Answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answer $CorrectedNumberOfQuestion out of $totalNumberOfQuestion question correctly !",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            questionSummary(summaryData: getSummaryData()),
            const SizedBox(
              height: 30,
            ),
            TextButton(onPressed: () {}, child: const Text("Restart Quiz !"))
          ],
        ),
      ),
    );
  }
}
