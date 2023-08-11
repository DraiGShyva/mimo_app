import 'package:flutter/material.dart';
import 'package:mimoapp/model/data/product.dart';
import 'package:mimoapp/view/custom/home/carousel_slider.dart';
import 'package:mimoapp/view/custom/home/header.dart';
import 'package:mimoapp/view/custom/home/item_grid_bottom.dart';
import 'package:mimoapp/view/custom/home/item_grid_top.dart';
import 'package:mimoapp/view/custom/home/item_list_horizontal.dart';
import 'package:mimoapp/view/custom/home/item_list_vertical.dart';

import '../../../data_mau.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    initializeData();
  }

  initializeData() async {
    await getData();
    await getDataType();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderHome(),
            CarouselSliderHome(slides: slide),
            ItemGridViewTop(
              data: buttonItems,
            ),
            ItemListHorizontal(
              name: 'Tất cả các loại đồ ăn',
              data: items,
            ),
            ItemGridViewBottom(
              name: 'Tất cả các loại đồ ăn',
              data: items,
            ),
            ItemListVertical(
              name: 'Tất cả các loại đồ ăn',
              data: items,
            ),
          ],
        ),
      ),
    );
  }
}
