// ignore_for_file: file_names, depend_on_referenced_packages

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class AIModelService {
  final String baseUrl =
      'http://192.168.1.6:5001'; // تأكد من تغيير عنوان الـ IP إلى ما يناسبك

  Future<int?> fetchAIAdvice(List<int> features) async {
    final url = Uri.parse('$baseUrl/predict');

    // إنشاء بيانات الطلب
    Map<String, dynamic> body = {'features': features};

    // إرسال الطلب
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(body),
    );

    // التعامل مع الاستجابة
    if (response.statusCode == 200) {
      final prediction = json.decode(response.body)['prediction'];
      if (kDebugMode) {
        print('Prediction: $prediction');
      }
      return prediction[0];
    } else {
      if (kDebugMode) {
        print('Failed to get prediction');
      }
      return null;
    }
  }
}
