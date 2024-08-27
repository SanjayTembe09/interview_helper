import 'package:flutter/material.dart';
import 'package:interview_helper/screens/interview_ai_questions.dart'; // Import the InterviewHelpApp class

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
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
}