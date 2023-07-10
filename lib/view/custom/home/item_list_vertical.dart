import 'package:flutter/material.dart';
import 'package:mimoapp/model/home_model.dart';

import '../../resource/resize.dart';
import '../../resource/text_style.dart';

class ItemListVertical extends StatelessWidget {
  final List<Map<String, dynamic>>? data;
  final String? name;
  const ItemListVertical({super.key, this.data, this.name});

  @override
  Widget build(BuildContext context) {
    double itemCount = (data!.length < 5 ? data!.length : 5).toDouble();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                HomeModel().getHomeData();
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
          height: Resize.size(context) / 2.7 * itemCount,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: itemCount.toInt(),
            itemBuilder: (BuildContext context, int index) {
              String image = data?[index]['logo'] ?? '';
              String name = data?[index]['name'] ?? '';
              String description = data?[index]['description'] ?? '';
              String price = data?[index]['price'] ?? '';
              return InkWell(
                onTap: () {
                  // TODO hành động khi ấn vào item
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    left: Resize.size(context) * 0.03,
                    right: Resize.size(context) * 0.03,
                    top: Resize.size(context) * 0.03,
                  ),
                  child: Ink(
                    decoration: const BoxDecoration(
                        border: Border(
                      bottom: BorderSide(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    )),
                    height: Resize.size(context) / 3,
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: Resize.size(context) * 0.03,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: Resize.size(context) / 2.5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
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
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
