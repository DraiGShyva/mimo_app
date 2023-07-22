import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class SignInModel {
  Future<bool> signIn(String phone, String password) async {
    final url = Uri.parse('http://mimo-drink.me:80/api/get-user');
    try {
      final data = {
        'pwd': password,
        'email_or_phone': phone,
      };
      final jsonData = jsonEncode(data);
      // đănng nhâp get
      final response = await http.post(
        url,
        body: jsonData,
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      if (kDebugMode) {
        print('Đăng nhập thất bại: $e');
      }
      //return false;
    }
    return false;
  }
}
