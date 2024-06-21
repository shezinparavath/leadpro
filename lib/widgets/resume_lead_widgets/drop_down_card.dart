import 'package:flutter/material.dart';
import 'package:leadpro/constant/styles.dart';

class BuildDropDownCard extends StatefulWidget {
  const BuildDropDownCard({super.key, required this.title, this.content});
  final String title;
  final Widget? content;

  @override
  State<BuildDropDownCard> createState() => _BuildDropDownCardState();
}

class _BuildDropDownCardState extends State<BuildDropDownCard> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            _isSelected = !_isSelected;
          });
        },
        child: Card(
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.title, style: AppStyles.bigText(context)),
                        Icon(_isSelected
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down),
                      ],
                    ),
                    if (_isSelected && widget.content != null) ...{
                      const SizedBox(height: 20),
                      widget.content!
                    }
                  ]),
            )));
  }
}
