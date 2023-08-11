import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mimoapp/model/server_address.dart';

class HomeModel {
  Future<String> getHomeData() async {
    final url = Uri.parse('${serverAddress}get-product');
    final respones = await http.get(url);
    final data = jsonDecode(respones.body);
    if (respones.statusCode == 200) {
      if (kDebugMode) {
        print(data['data']['id']);
        print('ok');
      }
      return "ok";
    } else {
      if (kDebugMode) {
        print('error');
      }
      return "error";
    }
  }
}
