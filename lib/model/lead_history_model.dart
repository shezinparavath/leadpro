import 'package:flutter/material.dart';

class LeadHistoryModel {
  final IconData icon;
  final String content;
  const LeadHistoryModel({required this.icon, required this.content});
}

const List<LeadHistoryModel> leadHistoryList = [
  LeadHistoryModel(
      icon: Icons.phone,
      content: 'A new call started by Admin on 01-05-2024 11:12 am'),
  LeadHistoryModel(
      icon: Icons.phone,
      content: 'A new call started by Admin on 08-05-2024 12:47 pm'),
  LeadHistoryModel(
      icon: Icons.note_outlined,
      content: 'A new notes added by Admin on 15-05-2024 5:00 pm'),
  LeadHistoryModel(
      icon: Icons.phone,
      content: 'A new call started by Admin on 23-05-2024 10:12 am'),
  LeadHistoryModel(
      icon: Icons.phone,
      content: 'A new call started by Admin on 25-05-2024 3:12 pm')
];
