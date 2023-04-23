import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier({super.key, required this.isCorrect, required this.questionNumber});

  final bool isCorrect;
  final int questionNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrect 
          ? const Color.fromARGB(255, 91, 112, 207) 
          : const Color.fromARGB(255, 139, 46, 206),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        "$questionNumber",
        style: GoogleFonts.lato(
          color: const Color.fromARGB(255, 186, 160, 204),
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
