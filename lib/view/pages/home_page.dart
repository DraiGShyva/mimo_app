import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mimoapp/view/custom/home/item_list.dart';
import 'package:mimoapp/view/resource/resize.dart';

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
              'https://img.freepik.com/free-photo/delicious-vietnamese-food-including-pho-ga-noodles-spring-rolls-white-wall_181624-34158.jpg?w=1380&t=st=1688615197~exp=1688615797~hmac=d661e390e5d7b6cdcdab04646c71bb707489e930d1e1a3b7471fbdce6a678739',
          'name': 'Món 1 -----------------------------------------------------'
        },
        {
          'logo':
              'https://img.freepik.com/free-photo/delicious-vietnamese-food-including-pho-ga-noodles-spring-rolls-white-wall_181624-34158.jpg?w=1380&t=st=1688615197~exp=1688615797~hmac=d661e390e5d7b6cdcdab04646c71bb707489e930d1e1a3b7471fbdce6a678739',
          'name': 'Món 2 -----------------------------------------------------'
        },
        {
          'logo':
              'https://img.freepik.com/free-photo/delicious-vietnamese-food-including-pho-ga-noodles-spring-rolls-white-wall_181624-34158.jpg?w=1380&t=st=1688615197~exp=1688615797~hmac=d661e390e5d7b6cdcdab04646c71bb707489e930d1e1a3b7471fbdce6a678739',
          'name': 'Món 3 -----------------------------------------------------'
        },
        {
          'logo':
              'https://img.freepik.com/free-photo/delicious-vietnamese-food-including-pho-ga-noodles-spring-rolls-white-wall_181624-34158.jpg?w=1380&t=st=1688615197~exp=1688615797~hmac=d661e390e5d7b6cdcdab04646c71bb707489e930d1e1a3b7471fbdce6a678739',
          'name': 'Món 4 -----------------------------------------------------'
        },
        {
          'logo':
              'https://img.freepik.com/free-photo/delicious-vietnamese-food-including-pho-ga-noodles-spring-rolls-white-wall_181624-34158.jpg?w=1380&t=st=1688615197~exp=1688615797~hmac=d661e390e5d7b6cdcdab04646c71bb707489e930d1e1a3b7471fbdce6a678739',
          'name': 'Món 5 -----------------------------------------------------'
        },
      ],
    },
    {
      'name': 'Các món ưa thích: ',
      'datas': [
        {
          'logo':
              'https://img.freepik.com/free-photo/delicious-vietnamese-food-including-pho-ga-noodles-spring-rolls-white-wall_181624-34158.jpg?w=1380&t=st=1688615197~exp=1688615797~hmac=d661e390e5d7b6cdcdab04646c71bb707489e930d1e1a3b7471fbdce6a678739',
          'name': 'Món 1 -----------------------------------------------------'
        },
        {
          'logo':
              'https://img.freepik.com/free-photo/delicious-vietnamese-food-including-pho-ga-noodles-spring-rolls-white-wall_181624-34158.jpg?w=1380&t=st=1688615197~exp=1688615797~hmac=d661e390e5d7b6cdcdab04646c71bb707489e930d1e1a3b7471fbdce6a678739',
          'name': 'Món 2 -----------------------------------------------------'
        },
        {
          'logo':
              'https://img.freepik.com/free-photo/delicious-vietnamese-food-including-pho-ga-noodles-spring-rolls-white-wall_181624-34158.jpg?w=1380&t=st=1688615197~exp=1688615797~hmac=d661e390e5d7b6cdcdab04646c71bb707489e930d1e1a3b7471fbdce6a678739',
          'name': 'Món 3 -----------------------------------------------------'
        },
        {
          'logo':
              'https://img.freepik.com/free-photo/delicious-vietnamese-food-including-pho-ga-noodles-spring-rolls-white-wall_181624-34158.jpg?w=1380&t=st=1688615197~exp=1688615797~hmac=d661e390e5d7b6cdcdab04646c71bb707489e930d1e1a3b7471fbdce6a678739',
          'name': 'Món 4 -----------------------------------------------------'
        },
        {
          'logo':
              'https://img.freepik.com/free-photo/delicious-vietnamese-food-including-pho-ga-noodles-spring-rolls-white-wall_181624-34158.jpg?w=1380&t=st=1688615197~exp=1688615797~hmac=d661e390e5d7b6cdcdab04646c71bb707489e930d1e1a3b7471fbdce6a678739',
          'name': 'Món 5 -----------------------------------------------------'
        },
      ],
    },
  ];

  List<String> slide = [
    'assets/images/home_image/banner.png',
    'assets/images/home_image/banner.png',
    'assets/images/home_image/banner.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: Resize.size(context) / 2,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 140, 200, 249),
                    Colors.white,
                    Color.fromARGB(255, 140, 200, 249),
                  ],
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 5,
                    spreadRadius: 5,
                  ),
                ],
              ),
              padding:
                  EdgeInsets.symmetric(horizontal: Resize.size(context) * 0.02),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Tìm kiếm...',
                  border: const OutlineInputBorder(),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.qr_code),
                        onPressed: () {
                          // Xử lý khi nhấn nút quét mã QR
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.camera_alt),
                        onPressed: () {
                          // Xử lý khi nhấn nút chụp ảnh
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            CarouselSlider.builder(
              itemCount: slide.length,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    slide[index],
                    fit: BoxFit.contain,
                  ),
                );
              },
              options: CarouselOptions(
                height: Resize.size(context) / 2,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn, // tốc độ chạy
                pauseAutoPlayOnTouch: true, // khi chạm vào thì dừng
                aspectRatio: 1.0,
                enlargeCenterPage: true, // phóng to ảnh giữa
                viewportFraction:
                    1.0, // chiều rộng của ảnh trong slide (1 là full)
              ),
            ),
            SizedBox(
              height: Resize.size(context) / 1.65 * items.length,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  dynamic datas = items[index]['datas'];
                  String name = items[index]['name'];
                  return ItemList(
                    name: name,
                    data: datas,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
