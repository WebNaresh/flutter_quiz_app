import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/components/question_summary.dart';
import 'package:quiz_app/data/question.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.returnToStart, this.chosenAnswers, {super.key});
  final void Function() returnToStart;
  final List<String> chosenAnswers;

  List<Map<String, Object>> get summaryData {
    List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          "question_index": i,
          "question": questions[i].text,
          "correct_answer": questions[i].answers[0],
          "user_answer": chosenAnswers[i],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestion = questions.length;
    final numCorrectQuestion = summaryData
        .where((ele) => ele["user_answer"] == ele["correct_answer"])
        .length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "You answered $numCorrectQuestion out of $numTotalQuestion questions correctly!",
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 214, 165, 222),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            const SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              child: QuestionSummary(summaryData),
            ),
            const SizedBox(
              height: 24,
            ),
            TextButton.icon(
              onPressed: returnToStart,
              label: Text(
                "Restart Quiz",
                style: GoogleFonts.lato(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              icon: const Icon(
                Icons.restart_alt,
                size: 28,
                color: Colors.white,
              ),
              // style: TextButton.styleFrom(),
            )
          ],
        ),
      ),
    );
  }
}
