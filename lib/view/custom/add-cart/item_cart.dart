import 'package:flutter/material.dart';
import 'package:mimoapp/view/resource/resize.dart';
import 'package:mimoapp/view/resource/text_style.dart';

class ItemAddCart extends StatefulWidget {
  final dynamic data;
  final Function? addCart;
  final Function? removeCart;

  const ItemAddCart({super.key, this.data, this.addCart, this.removeCart});

  @override
  State<ItemAddCart> createState() => _ItemAddCartState();
}

class _ItemAddCartState extends State<ItemAddCart> {
  int quality = 1;

  @override
  Widget build(BuildContext context) {
    String image = widget.data['product_images'] ?? '';

    String name = widget.data['product_name'] ?? '';
    String size = widget.data['product_size'] ?? '';
    String price = widget.data['price'] ?? '';

    return Padding(
      padding: EdgeInsets.only(
          top: Resize.size(context) * 0.03,
          left: Resize.size(context) * 0.03,
          right: Resize.size(context) * 0.03),
      child: Container(
        padding: EdgeInsets.all(Resize.size(context) * 0.03),
        height: Resize.size(context) / 3,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 211, 207, 207),
              blurRadius: 5,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: Resize.size(context) * 0.03),
              child: Ink(
                width: Resize.size(context) * 0.303,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyleClass(fontWeight: FontWeight.bold)
                        .textStyleMedium(context),
                  ),
                  SizedBox(height: Resize.size(context) * 0.01),
                  const Text('Size thường'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        price,
                        style: TextStyleClass(fontWeight: FontWeight.bold)
                            .textStyleMedium(context),
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  if (quality > 1) {
                                    quality--;
                                  }
                                });
                                //removeCart!();
                              },
                              icon: const Icon(
                                  Icons.remove_circle_outline_sharp)),
                          Text(quality.toString()),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  quality++;
                                });
                                // addCart!();
                              },
                              icon: const Icon(Icons.add_circle_outline_sharp)),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
