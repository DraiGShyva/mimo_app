import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class SignUpModel {
  Future<bool> signUp(String username, String phone, String password) async {
    final url = Uri.parse('http://34.29.205.142:80/api/create-user');
    if (kDebugMode) {
      print(username);
    }
    try {
      final data = {
        'username': username,
        'pwd': password,
        'telephone': phone,
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

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print('Đăng ký tài khoản thành công');
        }
        return true;
      } else {
        if (kDebugMode) {
          print(response.body);
        }
        return false;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Đăng ký tài khoản thất bại: $e');
      }
      return false;
    }
  }
}