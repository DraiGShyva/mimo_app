import 'package:flutter/material.dart';
import 'package:mimoapp/view/resource/resize.dart';

class ItemList extends StatefulWidget {
  final String? name;
  final List<Map<String, dynamic>>? data;
  const ItemList({
    super.key,
    this.name,
    this.data,
  });

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            // TODO hành động khi ấn vào tiêu đề
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: Resize.size(context) * 0.03,
                  right: Resize.size(context) * 0.03,
                  top: Resize.size(context) * 0.01,
                ),
                child: Text(
                  widget.name ?? '',
                  style: TextStyle(
                      fontSize: Resize.size(context) * 0.05,
                      fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
              ),
            ],
          ),
        ),
        SizedBox(
          height: Resize.size(context) * 0.03,
        ),
        SizedBox(
          height: Resize.size(context) / 1.8,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.data!.length < 9 ? widget.data!.length : 9,
            itemBuilder: (BuildContext context, int index) {
              String image = widget.data?[index]['logo'] ?? '';
              String name = widget.data?[index]['name'] ?? '';
              String price = widget.data?[index]['price'] ?? '';
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    // TODO hành động khi ấn vào item
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 203, 202, 202)),
                      borderRadius: BorderRadius.circular(5),
                      // boxShadow: const [
                      //   BoxShadow(
                      //     blurRadius: 5,
                      //     color: Colors.blue,
                      //   )
                      //],
                    ),
                    width: Resize.size(context) / 2,
                    child: Column(
                      children: [
                        Ink(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5)),
                            // boxShadow: const [
                            //   BoxShadow(
                            //     blurRadius: 5,
                            //     color: Colors.blue,
                            //   )
                            // ],
                            image: DecorationImage(
                              image: NetworkImage(image),
                              fit: BoxFit.cover,
                            ),
                          ),
                          height: Resize.size(context) / 3,
                          width: Resize.size(context) / 2,
                        ),
                        SizedBox(
                          height: Resize.size(context) * 0.01,
                        ),
                        Text(
                          name,
                          style: TextStyle(
                              fontSize: Resize.size(context) * 0.045,
                              fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        const Divider(
                          height: 0.001,
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Icon(
                                Icons.discount_sharp,
                                color: const Color.fromARGB(141, 181, 19, 7),
                                size: Resize.size(context) * 0.05,
                              ),
                              SizedBox(
                                width: Resize.size(context) * 0.01,
                              ),
                              Text(
                                price,
                                style: TextStyle(
                                  fontSize: Resize.size(context) * 0.045,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              const Spacer(),
                              Text(
                                '4.5',
                                style: TextStyle(
                                  fontSize: Resize.size(context) * 0.045,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              SizedBox(
                                width: Resize.size(context) * 0.01,
                              ),
                              const Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: Resize.size(context) * 0.07,
        ),
      ],
    );
  }
}
