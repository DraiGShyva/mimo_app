import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mimoapp/model/server_address.dart';

List<dynamic> productData = [];
List<dynamic> productDataType = [];
getData() async {
  // lấy dữ liệu  API để hiển thị lên màn hình thông qua biến productData
  var url = Uri.parse('${serverAddress}get-product');
  var response = await http.get(url);
  var data = jsonDecode(response.body);
  productData = data['data'];
  if (kDebugMode) {
    print(productData.length);
  }
}

getDataType() async {
  var url = Uri.parse('${serverAddress}get-category');
  var response = await http.get(url);
  var data = jsonDecode(response.body);
  productDataType = data['data'];
}




// final url = Uri.parse('${link}get-product');
//   final respones = await http.get(url);
//   // lấy dữ liệu từ api và chuyển sang dạng đối tượng lưu vào biến data sau đó gán cho biến productData
//   final data = json.decode(respones.body);
//   if (respones.statusCode == 200) {
//     // lấy dữ liệu từ api
//     productData.add(data['data']);
//     print('length1 ${productData.length}');
//     print(productData[10]['product_name']);
//   } else {
//     print('error');
//   }