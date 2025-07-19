import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  static Future<http.Response?> loginUser(String email, String password) async {
    final url = Uri.parse('https://pusula-api-netcore.necmettincimen.xyz/login');
    final headers = {
      'accept': '/',
      'Content-Type': 'application/json',
    };

    final body = jsonEncode({
      'email': email, 
      'password': password,
    });

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (kDebugMode) {
        print("GÖNDERİLEN BODY: $body");
      }
      if (kDebugMode) {
        print("YANIT KODU: ${response.statusCode}");
      }
      if (kDebugMode) {
        print("YANIT BODY: ${response.body}");
      }

      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Hata oluştu: $e');
      }
      return null;
    }
  }
}
