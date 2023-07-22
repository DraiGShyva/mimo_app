// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:mimoapp/model/data/product.dart';
import 'package:mimoapp/view/custom/add-cart/item-cart.dart';
import 'package:mimoapp/view/custom/app_bar.dart';
import 'package:mimoapp/view/resource/app_color.dart';
import 'package:mimoapp/view/resource/resize.dart';
import 'package:mimoapp/view/resource/text_style.dart';

class AddCartPage extends StatefulWidget {
  const AddCartPage({Key? key}) : super(key: key);

  @override
  State<AddCartPage> createState() => _AddCartPageState();
}

class _AddCartPageState extends State<AddCartPage> {
  double totalPrice = 0; // Tổng tiền
  @override
  void initState() {
    super.initState();
    initializeData();
  }

  initializeData() async {
    await getData();
    setState(() {});
  }

  void calculateTotalPrice() {
    double newTotalPrice = 0;
    for (var item in productData) {
      double price = item['price'];
      int quantity = item['quantity'];
      newTotalPrice += price * quantity;
    }
    setState(() {
      totalPrice = newTotalPrice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          const AppBarCustom(),
          Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height -
                    Resize.size(context) * 0.15,
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: Resize.size(context) * 0.38 * 10,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: productData.length,
                      itemBuilder: (BuildContext context, int index) {
                        var data = productData[index];
                        print(data);
                        return ItemAddCart(data: data);
                      },
                    ),
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  child: Container(
                    padding: EdgeInsets.only(
                      left: Resize.size(context) * 0.03,
                      right: Resize.size(context) * 0.03,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      // color: Color.fromARGB(255, 196, 211, 245),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    height: Resize.size(context) * 0.2,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tổng tiền: 100.000đ',
                          style: TextStyleClass(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white)
                              .textStyleLarge(context),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(
                              Resize.size(context) * 0.05,
                            ),
                            primary: AppColor.colorButton,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Thanh toán',
                            style: TextStyleClass(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white)
                                .textStyleLarge(context),
                          ),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ],
      ),
    );

    //  Column(
    //   children: [
    //     ListView.builder(
    //       itemCount: 2,
    //       itemBuilder: (BuildContext context, int index) {
    //         return Container(
    //           child: Row(
    //             children: [
    //               Container(
    //                 child: Image.asset(
    //                   'assets/images/food.jpg',
    //                   width: 100,
    //                   height: 100,
    //                 ),
    //               ),
    //               Container(
    //                 child: const Column(
    //                   children: [
    //                     Column(
    //                       children: [
    //                         Text('Tên món ăn'),
    //                         Text('Giá'),
    //                         Text('Số lượng'),
    //                       ],
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ],
    //           ),
    //         );
    //       },
    //     ),
    //   ],
    // ),
    // );
  }
}
