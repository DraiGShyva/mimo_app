import 'package:flutter/material.dart';
import 'package:mimoapp/view/resource/resize.dart';
import 'package:mimoapp/view/resource/text_style.dart';

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: Resize.size(context) * 0.15,
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white)),
          Text(
            'Trang thanh toán',
            style:
                TextStyleClass(fontWeight: FontWeight.w500, color: Colors.white)
                    .textStyleLarge(context),
          ),
        ],
      ),
    );
  }
}
