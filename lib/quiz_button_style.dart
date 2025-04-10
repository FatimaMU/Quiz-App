import 'package:flutter/material.dart';

class QuizButton extends StatelessWidget {
  const QuizButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.icon,
  });

  final void Function() onTap;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: Colors.white),
      ),
      onPressed: onTap,
      label: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      icon: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
