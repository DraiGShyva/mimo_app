import 'dart:convert';
import 'package:http/http.dart' as http;

List<dynamic> productData = [];
List<dynamic> productDataType = [];
getData() async {
  // lấy dữ liệu  API để hiển thị lên màn hình thông qua biến productData
  var url = Uri.parse('http://173.255.114.207/api/get-product');
  var response = await http.get(url);
  var data = jsonDecode(response.body);
  productData = data['data'];
  print(productData.length);
}

getDataType() async {
  var url = Uri.parse('http://173.255.114.207/api/get-category');
  var response = await http.get(url);
  var data = jsonDecode(response.body);
  productDataType = data['data'];
}




// final url = Uri.parse('http://173.255.114.207/api/get-product');
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