import 'package:flutter/material.dart';
import 'package:mimoapp/view/resource/text_style.dart';

import '../../resource/resize.dart';

class ItemGridViewTop extends StatelessWidget {
  final List<Map<String, dynamic>>? data;
  const ItemGridViewTop({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Resize.size(context) / 2,
      padding: EdgeInsets.only(
        top: Resize.size(context) * 0.03,
        bottom: Resize.size(context) * 0.03,
      ),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Số cột trong GridView
            // mainAxisSpacing:
            //     10, // Khoảng cách giữa các phần tử theo chiều ngang
            crossAxisSpacing: 10, // Khoảng cách giữa các phần tử theo chiều dọc
            childAspectRatio: 0.43, //Tỉ lệ chiều rộng / chiều cao
          ),
          scrollDirection: Axis.horizontal,
          itemCount: data?.length,
          itemBuilder: (BuildContext context, int index) {
            String image = data?[index]['logo'] ?? '';
            String name = data?[index]['name'] ?? '';
            String description = data?[index]['description'] ?? '';
            return Padding(
              padding: EdgeInsets.only(
                left: Resize.size(context) * 0.03,
                right: Resize.size(context) * 0.03,
              ),
              child: InkWell(
                onTap: () {
                  // TODO: Xử lý khi nhấn vào item
                },
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  children: [
                    Positioned.fill(
                        child: Image.asset(
                            'assets/images/home_image/box2-homepage.png')),
                    Positioned(
                      left: Resize.size(context) * 0.08,
                      top: 0,
                      right: 0,
                      bottom: 0,
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                name,
                                style:
                                    TextStyleClass().textStyleMedium(context),
                              ),
                              SizedBox(height: Resize.size(context) * 0.01),
                              Text(description,
                                  style:
                                      TextStyleClass().textStyleSmall(context)),
                              SizedBox(height: Resize.size(context) * 0.03),
                            ],
                          ),
                          Expanded(
                            child: Image.asset(image),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
