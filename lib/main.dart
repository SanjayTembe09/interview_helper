//import 'package:flutter/material.dart';
import 'package:interview_helper/screens/interview_qa_gemini.dart';
//import 'package:interview_helper/screens/interview_ai_questions.dart'; // Import the InterviewHelpApp class

void main() async {
  const prompt =
      'Generate 5 challenging questions for a PHP developer with 6 years of experience, focusing on their ability to work with Flutter projects. Questions should cover topics like Flutter architecture, state management, Dart language, and integration with PHP backend.';

  final questions = await generateQuestions(prompt);
  print(questions);
}

/*class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext 
 context) {
    return MaterialApp(
      title: 'Flutter Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:c 
 const InterviewHelpApp(title: 'Flutter Quiz App'),
    );
  }
}*/