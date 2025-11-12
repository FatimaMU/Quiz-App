import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary/questions_summary.dart';
import 'package:quiz_app/widgets/quiz_button_style.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    required this.restart,
    required this.chosenAnswers,
    super.key,
  });

  final void Function() restart;
  final List<String> chosenAnswers;

  List<Map<String, Object>> get summaryData {
    List<Map<String, Object>> summary = [];
    for (int i = 0; i < questions.length; i++) {
      summary.add({
        'question-index': i,
        'question-text': questions[i].text,
        'correct-answer': questions[i].answers[0],
        'user-answer': chosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    int numberOfCorrectAnswers = summaryData
        .where((element) =>
            element['correct-answer'] ==
            element['user-answer'])
        .length;
    int numberOfQuestions = questions.length;
    return Container(
      padding: EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 30,
        children: [
          Text(
            "You have answered $numberOfCorrectAnswers out of $numberOfQuestions questions correctly!",
            style: GoogleFonts.lato(
              color:
                  const Color.fromARGB(198, 202, 234, 165),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          QuestionsSummary(summaryData),
          QuizButton(
            onTap: restart,
            icon: Icons.refresh,
            text: 'Restart Quiz',
          )
        ],
      ),
    );
  }
}
