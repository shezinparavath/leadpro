import 'package:flutter/material.dart';

class AppDecoration {
  static ButtonStyle buttonStyle(Color color) {
    return ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)));
  }

  static List<BoxShadow> boxShadow(
          {double opacity = 0.1,
          Offset offset = const Offset(0, 6),
          double spreadRadius = 0,
          double blurRadius = 4}) =>
      [
        BoxShadow(
            color: Colors.black.withOpacity(opacity),
            offset: offset,
            spreadRadius: spreadRadius,
            blurRadius: blurRadius)
      ];
}
