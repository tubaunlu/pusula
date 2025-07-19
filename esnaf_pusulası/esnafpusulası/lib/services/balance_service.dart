import 'package:flutter_application_5/services/auth_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BalanceService {


  Future<bool> updateBalance(String customerNumber, int balance) async {
    final String url = (AuthService.baseUrl+'/bakiye');
    final Map<String, dynamic> data = {
      'musterinum': customerNumber,
      'bakiye': balance,
    };

    try {
      final http.Response response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'accept': '/',
        },
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        // Request was successful
        print('Balance updated successfully!');
        return true;
      } else {
        // Request failed with an error status code
        print('Failed to update balance. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return false;
      }
    } catch (e) {
      // An error occurred during the network request
      print('Error updating balance: $e');
      return false;
    }
  }
}