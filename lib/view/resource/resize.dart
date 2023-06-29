import 'package:flutter/material.dart';

class Resize {
  static size(context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double widgetSize = screenSize.width < screenSize.height
        ? screenSize.width
        : screenSize.height;
    return widgetSize;
  }
}
