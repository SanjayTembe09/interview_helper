import 'package:flutter/material.dart';
import 'package:interview_helper/screens/interview_qa_gemini.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Assign your API key and prompt here
  final String apiKey = 'Your-API-Key';
  final String prompt = 'Generate 5 challenging questions for a PHP developer with 6 years of experience, focusing on their ability to work with Flutter projects. Questions should cover topics like Flutter architecture, state management, Dart language, and integration with PHP backend.';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Question Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(apiKey: apiKey, prompt: prompt),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String apiKey;
  final String prompt;

  const MyHomePage({required this.apiKey, required this.prompt, super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _generatedQuestions  
 = '';

  Future<void> _generateQuestions() async {
    try {
      final questionGenerator = QuestionGenerator(widget.apiKey);
      final generatedQuestions = await questionGenerator.generateQuestions(widget.prompt);
      setState(() {
        _generatedQuestions = generatedQuestions;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to generate questions. Please check your API key and prompt.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Question Generator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _generateQuestions,
              child: const Text('Generate Questions'),
            ),
            const SizedBox(height: 16.0),
            Text(
              _generatedQuestions,
              style: const TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}