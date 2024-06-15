import 'package:flutter/material.dart';
import 'package:leadpro/constant/color.dart';
import 'package:leadpro/constant/styles.dart';

class BuildDrawerItems extends StatefulWidget {
  final IconData icon;
  final String title;
  final ValueNotifier<int> notifier;
  final int index;
  const BuildDrawerItems(
      {super.key,
      required this.icon,
      required this.title,
      required this.notifier,
      required this.index});

  @override
  State<BuildDrawerItems> createState() => _BuildDrawerItemsState();
}

class _BuildDrawerItemsState extends State<BuildDrawerItems> {
  bool _isSelected = false;

  @override
  void initState() {
    super.initState();
    widget.notifier.addListener(_handleNotification);
    _isSelected = (widget.notifier.value == widget.index);
  }

  @override
  void dispose() {
    widget.notifier.removeListener(_handleNotification);
    super.dispose();
  }

  void _handleNotification() {
    setState(() {
      _isSelected = (widget.notifier.value == widget.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.notifier.value = widget.index;
      },
      child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          padding: const EdgeInsets.all(10),
          decoration: _isSelected
              ? BoxDecoration(
                  color: const Color(0xFFC3C5FF),
                  borderRadius: BorderRadius.circular(5))
              : null,
          child: Row(children: [
            Icon(widget.icon,
                color: _isSelected ? AppColors.primaryColor : Colors.black87),
            Text(widget.title,
                style: AppStyles.bigText(context,
                    color:
                        _isSelected ? AppColors.primaryColor : Colors.black87))
          ])),
    );
  }
}
