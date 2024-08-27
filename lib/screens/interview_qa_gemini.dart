import 'dart:convert';
import 'package:http/http.dart' as http;

const apiKey = 'AIzaSyAHTTi69vOizmgDPSLF5dUYQ9Xwnvu151U'; // Replace with your actual API key

Future<String> generateQuestions(String prompt) async {
  final url = Uri.parse('https://api.openai.com/v1/completions');
  final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $apiKey',
  };
  final body = jsonEncode({
    'model': 'text-davinci-003', 
 // Adjust model as needed
    'prompt': prompt,
    'temperature': 0.7, // Adjust temperature for question diversity
    'max_tokens': 200, // Adjust max_tokens for question length
    'n': 5, // Generate 5 questions
  });

  final response = await http.post(url, headers: headers, body: body);
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body); 

    final questions = data['choices']
        .map((choice) => choice['text'].toString())
        .toList();
    return questions.join('\n');
  } else {
    throw Exception('Failed to generate questions');
  }
}