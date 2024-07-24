import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((ele) {
            return Column(
              children: [
                const SizedBox(
                    height:
                        20), // Add gap before every item except the first one
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundColor:
                          ele["user_answer"] == ele["correct_answer"]
                              ? const Color.fromARGB(255, 84, 153, 226)
                              : Colors.red,
                      child: Text(
                        ((ele["question_index"] as int) + 1).toString(),
                        style: GoogleFonts.lato(
                            fontSize: 14, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            (ele["question"] as String),
                            style: GoogleFonts.lato(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            (ele["user_answer"] as String),
                            style: GoogleFonts.lato(
                                fontSize: 14, color: Colors.purpleAccent),
                          ),
                          Text(
                            (ele["correct_answer"] as String),
                            style: GoogleFonts.lato(
                                fontSize: 14, color: Colors.greenAccent),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
