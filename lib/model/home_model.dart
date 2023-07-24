import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class HomeModel {
  Future<String> getHomeData() async {
    final url = Uri.parse('http://mimo-drink.me/api/get-product');
    final respones = await http.get(url);
    final data = jsonDecode(respones.body);
    if (respones.statusCode == 200) {
      // lấy dữ liệu từ api
      if (kDebugMode) {
        print(data['data']['id']);
        print('ok');
      }

      return "ok";

      ///  return respones.body;
    } else {
      if (kDebugMode) {
        print('error');
      }
      return "error";
    }
  }
}
