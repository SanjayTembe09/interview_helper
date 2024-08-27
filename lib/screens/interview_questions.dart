import 'package:flutter/material.dart';

class InterviewApp extends StatefulWidget {
  const InterviewApp({super.key});

  @override
  State<InterviewApp> createState() => _InterviewAppState();
}

class _InterviewAppState extends State<InterviewApp> {
  final TextEditingController _programmingLanguageController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();
  final TextEditingController 
 _answerController = TextEditingController();

  List<String> questions = [];

  @override
  void initState() {
    super.initState();
    // Generate questions based on initial values (e.g., default language and experience)
    questions = generateQuestions("PHP", 5); // Replace with your desired initial values
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interview App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField( 

              controller: 
 _programmingLanguageController,
              decoration: const InputDecoration(
                labelText: 'Programming Language',
              ),
            ),
            TextField(
              controller: _experienceController,
              decoration: const InputDecoration(
                labelText: 'Years of Experience',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Generate questions based on new input
                questions = generateQuestions(_programmingLanguageController.text, int.parse(_experienceController.text));
                setState(() {});
              },
              child: const Text('Generate Questions'),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: questions.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Question ${index 
 + 1}: ${questions[index]}'),
                    TextField(
                      controller: _answerController,
                      decoration: const InputDecoration(
                        hintText: 'Enter your answer',
                      ),
                    ),
                    // Add a button or other mechanism to submit the answer
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  List<String> generateQuestions(String programmingLanguage, int experience) {
  List<String> questions = [];

  if (programmingLanguage == "PHP") {
    // PHP questions
    questions.addAll([
      "Explain the Singleton, Factory, and Observer patterns and how you've applied them in PHP projects.",
      "Discuss the benefits of dependency injection and how you've implemented it in your PHP applications.",
      "Compare and contrast Laravel, Symfony, and CodeIgniter, highlighting their key features and use cases.",
      // ... other PHP questions
    ]);
  } else if (programmingLanguage == "JavaScript") {
    // JavaScript questions
    questions.addAll([
      "Explain the concepts of callbacks, promises, and async/await. Discuss their advantages and use cases.",
      "Compare and contrast React, Angular, and Vue.js, highlighting their key features and use cases.",
      "Discuss techniques for ensuring cross-browser compatibility in your JavaScript applications.",
      // ... other JavaScript questions
    ]);
  } else if (programmingLanguage == "MySQL") {
    // MySQL questions
    questions.addAll([
      "Explain the different normal forms (1NF, 2NF, 3NF, BCNF) and how to apply them to database design.",
      "Discuss techniques for optimizing SQL queries, such as creating indexes, using EXPLAIN, and avoiding full table scans.",
      "Explain the concept of replication and how to set it up in MySQL.",
      // ... other MySQL questions
    ]);
  }

  // Add more questions based on experience level
  if (experience >= 5) {
    questions.addAll([
      "Discuss how you've used cloud platforms (e.g., AWS, GCP, Azure) to deploy and manage PHP applications.",
      "Explain how you've implemented asynchronous programming in PHP, using tools like ReactPHP or Amp.",
      "Discuss advanced performance tuning techniques for MySQL databases.",
      // ... other advanced questions
    ]);
  }

  // Shuffle the questions for randomness
  questions.shuffle();

  return questions;
}
}