import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:mimoapp/data_mau.dart';
import 'package:mimoapp/view/custom/home/item_list_vertical.dart';
import 'package:mimoapp/view/resource/resize.dart';

class ProductTypePage extends StatelessWidget {
  const ProductTypePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      title: Row(
        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white)),
          const Text(
            'Tốt cho sức khỏe',
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
      headerExpandedHeight: 0.35,
      headerWidget: Column(
        children: [
          SizedBox(
            height: Resize.size(context) * 0.1,
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon:
                        const Icon(Icons.arrow_back_ios, color: Colors.white)),
                const Text(
                  'Tốt cho sức khỏe',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35 -
                Resize.size(context) * 0.115,
            width: MediaQuery.of(context).size.width,
            child: Expanded(
              child: Image.network(
                'https://th.bing.com/th/id/OIP.a0B9zXpBdOcSzYm-V3C5WgHaE6?pid=ImgDet&rs=1',
                fit: BoxFit.cover,
                //width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
        ],
      ),
      body: [
        ItemListVertical(data: items[0]['datas']),
      ],
    );
  }
}
