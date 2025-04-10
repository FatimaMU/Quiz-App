import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.onSelectAnswer, {super.key});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int questionIndex = 0;

  void answerQuestion(String answer) {
    widget.onSelectAnswer(answer);
    setState(() {
      questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[questionIndex];
    return Container(
      padding: EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 5,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            currentQuestion.text,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              color: const Color.fromARGB(198, 202, 234, 165),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          ...currentQuestion.getShuffledAnswers().map((answer) {
            return AnswerButton(
              answerText: answer,
              onTap: () {
                answerQuestion(answer);
              },
            );
          })
        ],
      ),
    );
  }
}
