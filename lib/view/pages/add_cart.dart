import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mimoapp/model/data/product.dart';
import 'package:mimoapp/view/custom/add-cart/custom_bottom_navigation_bar.dart';
import 'package:mimoapp/view/custom/add-cart/item_cart.dart';
import 'package:mimoapp/view/custom/app_bar.dart';
import 'package:mimoapp/view/resource/resize.dart';

import '../../data_mau.dart';

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
    for (var item in items) {
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
    return Scaffold(
      body: Column(
        children: [
          const AppBarCustom(),
          Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height -
                    Resize.size(context) * 0.15,
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: Resize.size(context) * 0.365 * items.length +
                        Resize.size(context) * 0.2,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        var data = items[index];
                        if (kDebugMode) {
                          print(data);
                        }
                        return ItemAddCart(data: data);
                      },
                    ),
                  ),
                ),
              ),
              const Positioned(
                bottom: 0,
                child: CustomBottomNavigationBar(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
