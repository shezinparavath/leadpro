import 'package:flutter/material.dart';

class AppStyles {
  static TextStyle bigText(BuildContext context, {Color? color}) {
    return TextStyle(
        fontSize: 16 * MediaQuery.of(context).size.width / 360,
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black87);
  }

  static TextStyle mediumText(BuildContext context, {Color? color}) {
    return TextStyle(
        fontSize: 14 * MediaQuery.of(context).size.width / 360,
        fontWeight: FontWeight.w500,
        color: color ?? Colors.black87);
  }

  static TextStyle smallText(BuildContext context, {Color? color}) {
    return TextStyle(
        fontSize: 12 * MediaQuery.of(context).size.width / 360,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black87);
  }
}
