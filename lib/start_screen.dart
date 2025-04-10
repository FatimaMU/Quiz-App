import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_button_style.dart';

class StartScreen extends StatelessWidget {
  final void Function() startQuiz;
  const StartScreen(this.startQuiz, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 200,
            color: const Color.fromARGB(130, 255, 255, 255),
          ),
          SizedBox(height: 80),
          Text(
            "Learn Flutter the fun way!",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 30),
          QuizButton(
            onTap: startQuiz,
            icon: Icons.arrow_right_alt,
            text: 'Start Quiz',
          )
        ],
      ),
    );
  }
}
