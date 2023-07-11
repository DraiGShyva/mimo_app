import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class SignUpModel {
  Future<String> signUp(
    String username,
    String password,
    String phone,
  ) async {
    final url = Uri.parse('http://173.255.114.207:80/api/create-user');
    if (kDebugMode) {
      print(username);
    }
    try {
      final data = {
        // 'username': username,
        'pwd': password,
        'email_or_phone': phone,
        'full_name': username,
      };
      final jsonData = jsonEncode(data); // Chuyển đổi dữ liệu sang chuỗi JSON

      final response = await http.post(
        url,
        body: jsonData, // Sử dụng chuỗi JSON làm body cho yêu cầu POST
        headers: {
          'Content-Type': 'application/json'
        }, // Đặt header 'Content-Type' là 'application/json'
      );
      final dataAPI = jsonDecode(response.body);
      if (kDebugMode) {
        print(dataAPI['code']);
      }

      return dataAPI['code'];
    } catch (e) {
      if (kDebugMode) {
        print('Đăng ký tài khoản thất bại: $e');
      }
      return "6";
    }
  }
}
