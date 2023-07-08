import 'package:flutter/material.dart';
import 'package:mimoapp/view/resource/resize.dart';

class TextStyleClass {
  final TextOverflow? overflow;
  final FontWeight? fontWeight;
  final Color? color;

  TextStyleClass({
    this.overflow = TextOverflow.ellipsis,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
  });
  TextStyle textStyleSmall(context) => TextStyle(
        fontSize: Resize.size(context) * 0.03,
        overflow: overflow,
        fontWeight: fontWeight,
        color: color,
      );
  TextStyle textStyleMedium(context) => TextStyle(
        fontSize: Resize.size(context) * 0.04,
        overflow: overflow,
        fontWeight: fontWeight,
        color: color,
      );
  TextStyle textStyleLarge(context) => TextStyle(
        fontSize: Resize.size(context) * 0.05,
        overflow: overflow,
        fontWeight: fontWeight,
        color: color,
      );
}
