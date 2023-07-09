import 'package:flutter/material.dart';
import 'package:mimoapp/view/custom/home/carousel_slider.dart';
import 'package:mimoapp/view/custom/home/header.dart';
import 'package:mimoapp/view/custom/home/item_grid_bottom.dart';
import 'package:mimoapp/view/custom/home/item_grid_top.dart';
import 'package:mimoapp/view/custom/home/item_list_horizontal.dart';
import 'package:mimoapp/view/resource/resize.dart';

import '../custom/home/item_list_vertical.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> items = [
    {
      'name': 'Các món gần đây: ',
      'datas': [
        {
          'logo':
              'https://img.freepik.com/free-photo/pork-bones-tom-yum-thai-food-tom-yum-pork-ribs-decorated-with-ingredients_1150-23353.jpg?w=900&t=st=1688730049~exp=1688730649~hmac=4b5cc2ea6e7224d5b3901ba70bea141dfe9c333b16d2972e3b68622d48580663',
          'name': 'Gà ủ muối',
          'price': '125.000đ',
          'description': 'Gà ủ muối ngon nhất từ trước đến nay',
        },
        {
          'logo':
              'https://img.freepik.com/free-photo/american-shrimp-fried-rice-served-with-chili-fish-sauce-thai-food_1150-26585.jpg?w=900&t=st=1688730176~exp=1688730776~hmac=42c2b65ec72f96f4dcf28dd46e5319fb46fec4957f15fece185bdc30d57e15c1',
          'name': 'Cơm chiên dương châu',
          'price': '25.000đ',
          'description': 'Cơm chiên dương châu ngon nhất từ trước đến nay',
        },
        {
          'logo':
              'https://img.freepik.com/free-photo/composition-with-delicious-thai-tea-beverage_23-2148994337.jpg?w=900&t=st=1688730218~exp=1688730818~hmac=337f40cf616c7da80305000454c12dab96df9e7fceb0971a3da76ef526314e92',
          'name': 'Trà sữa trân châu đường đen',
          'price': '25.000đ',
          'description':
              'Trà sữa trân châu đường đen ngon nhất từ trước đến nay',
        },
        {
          'logo':
              'https://i.bloganchoi.com/bloganchoi.com/wp-content/uploads/2022/09/duong-chi-cam-lo-4-696x544.jpg?fit=700%2C20000&quality=95&ssl=1',
          'name': 'Dương chi Cam Lộ',
          'price': '25.000đ',
          'description': 'Dương chi Cam Lộ ngon nhất từ trước đến nay',
        },
        {
          'logo':
              'https://img.freepik.com/premium-photo/sun-is-shining-brightly-green-grass-fresh-sweet-strawberry-grass_549566-353.jpg?w=900',
          'name': 'SunRise dâu tây',
          'price': '100.000đ',
          'description': 'SunRaise dâu tây ngon nhất từ trước đến nay',
        },
      ],
    },
    {
      'name': 'Các món yêu thích: ',
      'datas': [
        {
          'logo':
              'https://img.freepik.com/free-photo/pork-bones-tom-yum-thai-food-tom-yum-pork-ribs-decorated-with-ingredients_1150-23353.jpg?w=900&t=st=1688730049~exp=1688730649~hmac=4b5cc2ea6e7224d5b3901ba70bea141dfe9c333b16d2972e3b68622d48580663',
          'name': 'Gà ủ muối',
          'price': '125.000đ',
          'description': 'Gà ủ muối ngon nhất từ trước đến nay',
        },
        {
          'logo':
              'https://img.freepik.com/free-photo/american-shrimp-fried-rice-served-with-chili-fish-sauce-thai-food_1150-26585.jpg?w=900&t=st=1688730176~exp=1688730776~hmac=42c2b65ec72f96f4dcf28dd46e5319fb46fec4957f15fece185bdc30d57e15c1',
          'name': 'Cơm chiên dương châu',
          'price': '25.000đ',
          'description': 'Cơm chiên dương châu ngon nhất từ trước đến nay',
        },
        {
          'logo':
              'https://img.freepik.com/free-photo/composition-with-delicious-thai-tea-beverage_23-2148994337.jpg?w=900&t=st=1688730218~exp=1688730818~hmac=337f40cf616c7da80305000454c12dab96df9e7fceb0971a3da76ef526314e92',
          'name': 'Trà sữa trân châu đường đen',
          'price': '25.000đ',
          'description':
              'Trà sữa trân châu đường đen ngon nhất từ trước đến nay',
        },
        {
          'logo':
              'https://i.bloganchoi.com/bloganchoi.com/wp-content/uploads/2022/09/duong-chi-cam-lo-4-696x544.jpg?fit=700%2C20000&quality=95&ssl=1',
          'name': 'Dương chi Cam Lộ',
          'price': '25.000đ',
          'description': 'Dương chi Cam Lộ ngon nhất từ trước đến nay',
        },
        {
          'logo':
              'https://img.freepik.com/premium-photo/sun-is-shining-brightly-green-grass-fresh-sweet-strawberry-grass_549566-353.jpg?w=900',
          'name': 'SunRise dâu tây',
          'price': '100.000đ',
          'description': 'SunRaise dâu tây ngon nhất từ trước đến nay',
        },
      ],
    },
  ];

  List<String> slide = [
    'assets/images/home_image/banner.png',
    'assets/images/home_image/banner.png',
    'assets/images/home_image/banner.png',
  ];

  List<Map<String, dynamic>> buttonItems = [
    {
      'logo': 'assets/images/home_image/model-trangchu.png',
      'name': 'Drink',
      'description': 'Thức uống',
    },
    {
      'logo': 'assets/images/home_image/model-trangchu.png',
      'name': 'Drink',
      'description': 'Thức uống',
    },
    {
      'logo': 'assets/images/home_image/model-trangchu.png',
      'name': 'Drink',
      'description': 'Thức uống',
    },
    {
      'logo': 'assets/images/home_image/model-trangchu.png',
      'name': 'Drink',
      'description': 'Thức uống',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderHome(),
            CarouselSliderHome(slides: slide),
            ItemGridViewTop(
              data: buttonItems,
            ),
            SizedBox(
              height: Resize.size(context) / 1.5 * items.length,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  dynamic datas = items[index]['datas'];
                  String name = items[index]['name'];
                  return ItemListHorizontal(
                    name: name,
                    data: datas,
                  );
                },
              ),
            ),
            ItemGridViewBottom(
                name: 'Tất cả các loại đồ ăn', data: items[0]['datas']),
            ItemListVertical(
                name: 'Tất cả các loại đồ ăn', data: items[0]['datas']),
          ],
        ),
      ),
    );
  }
}
