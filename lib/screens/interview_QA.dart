import 'package:flutter/material.dart';

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
      home: 
 const MyHomePage(title: 'Flutter Quiz App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> 
 {
  List<String> phpQuestions = [];
  List<String> answers = [];
  bool showQuestions = false;

  void generateQuestions() {
    // Replace this with your logic to fetch or generate questions
    phpQuestions = [
      "What is the difference between 'echo' and 'print' in PHP?",
      "Explain the concept of variable scope in PHP.",
      "How do you create a function in PHP?",
      "What is the purpose of the 'foreach' loop in PHP?",
      "How do you handle errors and exceptions in PHP?"
    ];
    answers = List.filled(phpQuestions.length, '');
    setState(() {
      showQuestions = true;
    });
  }

  void submitAnswer(int index, String answer) {
    setState(() {
      answers[index] = answer;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: 
 Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: 
 generateQuestions,
              child: const Text('Generate Questions'),
            ),
            if (showQuestions)
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: phpQuestions.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start, 

                        children: [
                          Text(phpQuestions[index]), 

                          TextField(
                            onChanged: (value) {
                              answers[index] = value;
                            },
                            decoration: const InputDecoration(
                              hintText: 'Enter your answer',
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              submitAnswer(index, answers[index]);
                            },
                            child: const Text('Submit'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}