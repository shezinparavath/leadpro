import 'package:flutter/material.dart';
import 'package:leadpro/constant/styles.dart';

class BuildBasicDetailsItems extends StatelessWidget {
  const BuildBasicDetailsItems(
      {super.key, required this.title, required this.content});
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(text: '$title\n', style: AppStyles.mediumText(context)),
        TextSpan(text: content, style: AppStyles.smallText(context)),
      ]),
    );
  }
}
