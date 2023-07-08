import 'package:flutter/material.dart';

import '../../resource/resize.dart';

class ItemListVertical extends StatefulWidget {
  final List<Map<String, dynamic>>? data;

  const ItemListVertical({super.key, this.data});

  @override
  State<ItemListVertical> createState() => _ItemListVerticalState();
}

class _ItemListVerticalState extends State<ItemListVertical> {
  @override
  Widget build(BuildContext context) {
    double itemCount =
        (widget.data!.length < 5 ? widget.data!.length : 5).toDouble();
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
                'Tất cả các loại đồ ăn',
                style: TextStyle(
                    fontSize: Resize.size(context) * 0.05,
                    fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                //textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
        SizedBox(
          height: Resize.size(context) * 0.03,
        ),
        SizedBox(
          height: Resize.size(context) / 2.95 * itemCount,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: itemCount.toInt(),
            itemBuilder: (BuildContext context, int index) {
              String image = widget.data?[index]['logo'] ?? '';
              String name = widget.data?[index]['name'] ?? '';
              String description = widget.data?[index]['description'] ?? '';
              String price = widget.data?[index]['price'] ?? '';
              return InkWell(
                onTap: () {
                  // TODO hành động khi ấn vào item
                },
                child: SizedBox(
                  height: Resize.size(context) / 3,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: Resize.size(context) * 0.03,
                      right: Resize.size(context) * 0.03,
                      top: Resize.size(context) * 0.01,
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
                                  style: TextStyle(
                                      fontSize: Resize.size(context) * 0.045,
                                      fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                Text(
                                  description,
                                  style: TextStyle(
                                      fontSize: Resize.size(context) * 0.035,
                                      fontStyle: FontStyle.italic),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                ),
                                const Spacer(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      price,
                                      style: TextStyle(
                                        fontSize: Resize.size(context) * 0.035,
                                      ),
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
              );
            },
          ),
        )
      ],
    );
  }
}
