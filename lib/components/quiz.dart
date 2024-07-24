import 'package:flutter/material.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/pages/question_screen.dart';
import 'package:quiz_app/pages/result_screen.dart';
import 'package:quiz_app/pages/start_screen.dart';

enum ScreenType { startScreen, questionScreen, resultScreen }

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  ScreenType? activeScreen;
  void switchScreen() {
    setState(() {
      activeScreen = ScreenType.questionScreen;
    });
  }

  void returnToStart() {
    setState(() {
      activeScreen = ScreenType.startScreen;
      selectedAnswers = [];
    });
  }

  void chooseAnswers(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = ScreenType.resultScreen;
      });
    }
  }

  @override
  void initState() {
    activeScreen = ScreenType.startScreen;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget screen = StartScreen(switchScreen);
    if (activeScreen == ScreenType.questionScreen) {
      screen = QuestionScreen(onSelectAnswer: chooseAnswers);
    }
    if (activeScreen == ScreenType.resultScreen) {
      screen = ResultScreen(returnToStart, selectedAnswers);
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 53, 11, 126),
                Color.fromARGB(255, 79, 36, 154),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screen,
        ),
      ),
    );
  }
}
