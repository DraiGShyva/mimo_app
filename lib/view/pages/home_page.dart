import 'package:flutter/material.dart';
import 'package:mimoapp/model/data/product.dart';
import 'package:mimoapp/view/custom/home/carousel_slider.dart';
import 'package:mimoapp/view/custom/home/header.dart';
import 'package:mimoapp/view/custom/home/item_grid_bottom.dart';
import 'package:mimoapp/view/custom/home/item_grid_top.dart';
import 'package:mimoapp/view/custom/home/item_list_horizontal.dart';
import 'package:mimoapp/view/custom/home/item_list_vertical.dart';
import 'package:mimoapp/view/resource/resize.dart';

import '../../data_mau.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// class _HomePageState extends State<HomePage> {
//   void initState() {
//     super.initState();
//     initializeData();
//   }

//   initializeData() async {
//     await getData();
//     print("length ${productData.length}");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const HeaderHome(),
//             CarouselSliderHome(slides: slide),
//             ItemGridViewTop(
//               data: buttonItems,
//             ),
//             SizedBox(
//               height: Resize.size(context) / 1.5 * items.length,
//               child: ListView.builder(
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemCount: items.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   dynamic datas = items[index]['datas'];
//                   String name = items[index]['name'];
//                   return ItemListHorizontal(
//                     name: name,
//                     data: datas,
//                   );
//                 },
//               ),
//             ),
//             ItemGridViewBottom(
//                 name: 'Tất cả các loại đồ ăn', data: items[0]['datas']),
//             ItemListVertical(name: 'Tất cả các loại đồ ăn', data: productData),
//           ],
//         ),
//       ),
//     );
//   }
// }

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
      // appBar: AppBar(actions: [
      //   IconButton(
      //     onPressed: () => setState(() {}),
      //     icon: const Icon(Icons.replay_outlined),
      //   )
      // ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderHome(),
            CarouselSliderHome(slides: slide),
            ItemGridViewTop(
              data: productDataType,
            ),
            ItemListHorizontal(
              name: 'Tất cả các loại đồ ăn',
              data: productData,
            ),
            ItemGridViewBottom(
                name: 'Tất cả các loại đồ ăn', data: productData),
            ItemListVertical(
              name: 'Tất cả các loại đồ ăn',
              data: productData,
            ),
          ],
        ),
      ),
    );
  }
}
