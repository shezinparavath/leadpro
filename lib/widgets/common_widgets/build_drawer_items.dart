import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leadpro/constant/color.dart';
import 'package:leadpro/constant/routes.dart';
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
        switch (widget.index) {
          case 0:
            context.go(AppRoutes.dashboard);
          case 1:
            context.go(AppRoutes.salesmanBooking);
          case 2:
            context.go(AppRoutes.followUp);
          default:
            context.go(AppRoutes.dashboard);
        }
        context.pop();
      },
      child: Container(
          padding: const EdgeInsets.all(10),
          decoration: _isSelected
              ? BoxDecoration(
                  color: const Color(0xFFBABBE4),
                  borderRadius: BorderRadius.circular(5))
              : null,
          child: Row(children: [
            Icon(widget.icon,
                color: _isSelected ? AppColors.primaryColor : Colors.black54),
            const SizedBox(width: 5),
            Text(widget.title,
                style: AppStyles.bigText(context,
                    color: _isSelected ? AppColors.primaryColor : Colors.black))
          ])),
    );
  }
}
