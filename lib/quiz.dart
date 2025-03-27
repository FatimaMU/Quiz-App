import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  //Widget? activeScreen;
  String activeScreenName = 'start-screen';

  void switchScreen() {
    setState(() {
      //activeScreen = QuestionsScreen();
      activeScreenName = 'questions-screen';
    });
  }

  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = StartScreen(switchScreen);
    if (activeScreenName == 'questions-screen') {
      activeScreen = QuestionsScreen();
    }
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color.fromARGB(255, 44, 112, 47),
              const Color.fromRGBO(76, 175, 80, 1),
              const Color.fromARGB(200, 139, 195, 74),
            ],
          ),
        ),
        child: activeScreen,
        // activeScreenName == 'start-screen'
        //     ? StartScreen(switchScreen)
        //     : QuestionsScreen(),
      ),
    );
  }
}
