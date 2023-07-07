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
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: Resize.size(context) * 0.03,
                  right: Resize.size(context) * 0.03,
                  top: Resize.size(context) * 0.01,
                ),
                child: Text(
                  widget.name ?? '',
                  style: TextStyle(fontSize: Resize.size(context) * 0.07),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              Expanded(
                child: Container(),
              ),
              const Icon(
                Icons.arrow_forward_ios,
              ),
            ],
          ),
        ),
        SizedBox(
          height: Resize.size(context) / 2,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.data!.length < 5 ? widget.data!.length : 5,
            itemBuilder: (BuildContext context, int index) {
              String image = widget.data![index]['logo'];
              String name = widget.data![index]['name'];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    // TODO hành động khi ấn vào item
                  },
                  child: SizedBox(
                    width: Resize.size(context) / 2.5,
                    child: Column(
                      children: [
                        Ink(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 5,
                                color: Colors.blue,
                              )
                            ],
                            image: DecorationImage(
                              image: NetworkImage(image),
                              fit: BoxFit.cover,
                            ),
                          ),
                          height: Resize.size(context) / 2.5,
                          width: Resize.size(context) / 2.5,
                        ),
                        Text(
                          name,
                          style:
                              TextStyle(fontSize: Resize.size(context) * 0.045),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
