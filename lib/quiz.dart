import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/screens/questions_screen.dart';
import 'package:quiz_app/screens/results_screen.dart';
import 'package:quiz_app/screens/start_screen.dart';
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
  List<String> chosenAnswers = [];

  void chooseAnswer(String answer) {
    chosenAnswers.add(answer);
    if (chosenAnswers.length == questions.length) {
      setState(() {
        activeScreenName = 'results-screen';
      });
    }
  }

  void switchScreen() {
    setState(() {
      //activeScreen = QuestionsScreen();
      activeScreenName = 'questions-screen';
    });
  }

  void restartQuiz() {
    setState(() {
      activeScreenName = 'start-screen';
      chosenAnswers = [];
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
      activeScreen = QuestionsScreen(chooseAnswer);
    }
    if (activeScreenName == 'results-screen') {
      activeScreen = ResultsScreen(
        restart: restartQuiz,
        chosenAnswers: chosenAnswers,
      );
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
