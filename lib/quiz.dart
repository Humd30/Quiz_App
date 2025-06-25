import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/models/result_screen.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  List<String> selectedAnswers = [];

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
      
        activeScreen = ResultScreen(chosenAnswers: selectedAnswers,);
      });
    }
  }

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionsScreen(onSelectAnswer: chooseAnswer);
    });
  }

  @override
  Widget build(context) {
     Widget screenWidget = StartScreen(switchScreen);

  if (activeScreen.runtimeType == QuestionsScreen) {
    screenWidget = QuestionsScreen(
      onSelectAnswer: chooseAnswer);
  }

  if (activeScreen.runtimeType == ResultScreen) {
    screenWidget = ResultScreen(chosenAnswers: selectedAnswers,);
  }



    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 9, 83, 11),
                Color.fromARGB(255, 9, 149, 13),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
