import 'package:flutter/material.dart';
import 'package:leadpro/constant/styles.dart';

class BuildTextfield extends StatelessWidget {
  final String label;
  final String hintText;

  const BuildTextfield(
      {super.key, required this.label, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(label, style: AppStyles.smallText(context)),
      TextFormField(
        decoration: InputDecoration(
          hintStyle:
              AppStyles.smallText(context, color: const Color(0xFFBDBDBD)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Color(0xFFBDBDBD))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Color(0xFFBDBDBD))),
          hintText: hintText,
        ),
      )
    ]);
  }
}
