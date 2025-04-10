import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String answerText;
  final void Function() onTap;

  const AnswerButton(
      {required this.answerText, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(128, 44, 112, 47),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 40,
        ),
      ),
      onPressed: onTap,
      child: Text(
        answerText,
        textAlign: TextAlign.center,
      ),
    );
  }
}
