import 'package:adv_basics2/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics2/start_screen.dart';
import 'package:adv_basics2/questions_screen.dart';
import 'package:adv_basics2/results_screen.dart';
//
class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {


  List<String> selectedAnswer = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);

    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';        
      });
    }
  }

  void restartQuiz(){
    setState(() {
      activeScreen = 'questions-screen';
      selectedAnswer = [];
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectedAnswer: chooseAnswer);
    }

    if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(chosenAnswers: selectedAnswer, restartQuiz: restartQuiz);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Color.fromRGBO(80, 14, 194, 1),
                Color.fromRGBO(39, 7, 94, 1),
              ])),
          child: screenWidget,
        ),
      ),
    );
  }
}
