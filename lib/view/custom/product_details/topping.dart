import 'package:flutter/material.dart';
import 'package:mimoapp/view/resource/resize.dart';
import 'package:mimoapp/view/resource/text_style.dart';

// ignore: must_be_immutable
class Topping extends StatefulWidget {
  int toppingCount = 0;
  String name;
  Topping({super.key, required this.name});

  @override
  State<Topping> createState() => _ToppingState();
}

class _ToppingState extends State<Topping> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: Resize.size(context) * 0.03),
        Text(widget.name, style: TextStyleClass().textStyleMedium(context)),
        const Spacer(),
        InkWell(
          onTap: () {
            setState(() {
              if (widget.toppingCount > 0) widget.toppingCount--;
            });
          },
          borderRadius: BorderRadius.circular(100),
          child: Icon(
            Icons.remove_circle_outline,
            size: Resize.size(context) * 0.08,
            color: Colors.green,
          ),
        ),
        SizedBox(width: Resize.size(context) * 0.03),
        Text(
          '${widget.toppingCount}',
          style: TextStyleClass().textStyleMedium(context),
        ),
        SizedBox(width: Resize.size(context) * 0.03),
        InkWell(
          onTap: () {
            setState(() {
              widget.toppingCount++;
            });
          },
          borderRadius: BorderRadius.circular(100),
          child: Icon(
            Icons.add_circle_outline,
            size: Resize.size(context) * 0.08,
            color: Colors.green,
          ),
        ),
        SizedBox(width: Resize.size(context) * 0.03),
      ],
    );
  }
}
