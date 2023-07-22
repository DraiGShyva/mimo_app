import 'dart:convert';

import 'package:http/http.dart' as http;

class HomeModel {
  Future<String> getHomeData() async {
    final url = Uri.parse('http://mimo-drink.me/api/get-product');
    final respones = await http.get(url);
    final data = jsonDecode(respones.body);
    if (respones.statusCode == 200) {
      // lấy dữ liệu từ api
      print(data['data']['id']);
      print('ok');
      return "ok";

      ///  return respones.body;
    } else {
      print('error');
      return "error";
    }
  }
}
