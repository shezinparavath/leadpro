import 'package:flutter/material.dart';

class ItemCountCardModel {
  final String title;
  final Color color;
  final String count;
  final IconData icon;
  const ItemCountCardModel(
      {required this.title,
      required this.color,
      required this.count,
      required this.icon});
}
