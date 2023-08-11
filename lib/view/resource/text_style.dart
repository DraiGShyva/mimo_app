import 'package:flutter/material.dart';
import 'package:mimoapp/view/resource/responsive.dart';

class TextStyleClass {
  final TextOverflow? overflow;
  final FontWeight? fontWeight;
  final Color? color;
  final TextDecoration? decoration;

  TextStyleClass({
    this.overflow = TextOverflow.ellipsis,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
    this.decoration = TextDecoration.none,
  });
  TextStyle textStyleSmall(context) => TextStyle(
        fontSize: Responsive.size(context) * 0.03,
        overflow: overflow,
        fontWeight: fontWeight,
        color: color,
        decoration: decoration,
      );
  TextStyle textStyleMedium(context) => TextStyle(
        fontSize: Responsive.size(context) * 0.04,
        overflow: overflow,
        fontWeight: fontWeight,
        color: color,
        decoration: decoration,
      );
  TextStyle textStyleLarge(context) => TextStyle(
        fontSize: Responsive.size(context) * 0.05,
        overflow: overflow,
        fontWeight: fontWeight,
        color: color,
        decoration: decoration,
      );
}
