import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/questions_summary/question_number.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.element, {super.key});

  final Map<String, Object> element;

  @override
  Widget build(BuildContext context) {
    bool isCorrect = element['correct-answer'] == element['user-answer'];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionNumber(
              isCorrect: isCorrect,
              number: (element['question-index'] as int) + 1),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  element['question-text'] as String,
                  style: GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(242, 230, 204, 8)),
                ),
                SizedBox(height: 5),
                Text(
                  element['correct-answer'] as String,
                  style: TextStyle(
                    color: Color.fromARGB(255, 44, 112, 47),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  element['user-answer'] as String,
                  style:
                      TextStyle(color: const Color.fromARGB(255, 126, 34, 27)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
