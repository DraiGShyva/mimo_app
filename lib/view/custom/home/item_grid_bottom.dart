import 'package:flutter/material.dart';
import 'package:mimoapp/view/resource/resize.dart';
import 'package:mimoapp/view/resource/text_style.dart';

class ItemGridViewBottom extends StatelessWidget {
  final List<Map<String, dynamic>>? data;
  final String? name;
  const ItemGridViewBottom({super.key, this.data, this.name});

  @override
  Widget build(BuildContext context) {
    double itemCount = (data!.length < 15 ? data!.length : 15).toDouble();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                // TODO hành động khi ấn vào tiêu đề
              },
              child: Text(
                name ?? '',
                style: TextStyleClass().textStyleLarge(context),
                maxLines: 1,
              ),
            ),
          ],
        ),
        SizedBox(
          height: Resize.size(context),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Số cột trong GridView
              mainAxisSpacing:
                  10, // Khoảng cách giữa các phần tử theo chiều ngang
              crossAxisSpacing:
                  10, // Khoảng cách giữa các phần tử theo chiều dọc
              childAspectRatio: 0.35, //Tỉ lệ chiều rộng / chiều cao
            ),
            scrollDirection: Axis.horizontal,
            itemCount: itemCount.toInt(),
            itemBuilder: (BuildContext context, int index) {
              String image = data?[index]['logo'] ?? '';
              String name = data?[index]['name'] ?? '';
              String description = data?[index]['description'] ?? '';
              String price = data?[index]['price'] ?? '';
              return Padding(
                padding: EdgeInsets.only(
                  left: Resize.size(context) * 0.03,
                  right: Resize.size(context) * 0.015,
                  top: Resize.size(context) * 0.03,
                ),
                child: InkWell(
                  onTap: () {
                    // TODO hành động khi ấn vào item
                  },
                  borderRadius: BorderRadius.circular(7),
                  child: Ink(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color: Colors.grey, width: 0.5),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(
                        Resize.size(context) * 0.02,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: Resize.size(context) * 0.03,
                                right: Resize.size(context) * 0.03,
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    name,
                                    textAlign: TextAlign.center,
                                    style: TextStyleClass()
                                        .textStyleMedium(context),
                                    maxLines: 1,
                                  ),
                                  Text(
                                    description,
                                    style: TextStyleClass()
                                        .textStyleSmall(context),
                                    maxLines: 3,
                                  ),
                                  const Spacer(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        price,
                                        style: TextStyleClass(
                                                fontWeight: FontWeight.bold)
                                            .textStyleMedium(context),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: Resize.size(context) / 4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: Resize.size(context) * 0.05,
        ),
      ],
    );
  }
}
