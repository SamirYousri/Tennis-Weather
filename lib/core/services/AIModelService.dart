// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:http/http.dart' as http;

class AIModelService {
  final String baseUrl = 'http://127.0.0.1:5001';

  Future<bool> fetchAdvice(
      double averageTemp, double maxTemp, double minTemp) async {
    final url = Uri.parse('$baseUrl/predict');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'average_temp': averageTemp,
        'max_temp': maxTemp,
        'min_temp': minTemp,
      }),
    );

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return result['advice'] == 1;
    } else {
      throw Exception('Failed to fetch advice from AI model');
    }
  }
}
