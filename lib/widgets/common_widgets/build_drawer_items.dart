import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leadpro/constant/color.dart';
import 'package:leadpro/constant/functions.dart';
import 'package:leadpro/constant/routes.dart';
import 'package:leadpro/constant/styles.dart';

class BuildDrawerItems extends StatefulWidget {
  final IconData icon;
  final String title;
  final ValueNotifier<int> notifier;
  final int index;

  const BuildDrawerItems({
    Key? key,
    required this.icon,
    required this.title,
    required this.notifier,
    required this.index,
  }) : super(key: key);

  @override
  State<BuildDrawerItems> createState() => _BuildDrawerItemsState();
}

class _BuildDrawerItemsState extends State<BuildDrawerItems> {
  bool _isSelected = false;
  int? previousIndex;

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
        if (widget.index == 3) {
          previousIndex = widget.notifier.value;
          AppFunctions.warningPopUp(
            context,
            title: "Log Out",
            content: 'Are You Sure You Want To Log Out?',
            onYESPressed: () {
              context.go(AppRoutes.login);
              context.pop();
            },
            onNOPressed: () {
              context.pop();
            },
          );
        } else {
          widget.notifier.value = widget.index;
          switch (widget.index) {
            case 0:
              context.go(AppRoutes.dashboard);
              break;
            case 1:
              context.go(AppRoutes.salesmanBooking);
              break;
            case 2:
              context.go(AppRoutes.followUp);
              break;
            default:
              context.go(AppRoutes.dashboard);
          }
          context.pop();
        }
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: _isSelected && widget.index != 3
            ? BoxDecoration(
                color: const Color(0xFFBABBE4),
                borderRadius: BorderRadius.circular(5))
            : null,
        child: Row(
          children: [
            Icon(
              widget.icon,
              color: _isSelected && widget.index != 3
                  ? AppColors.primaryColor
                  : Colors.black54,
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Text(
                widget.title,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.bigText(
                  context,
                  color: _isSelected && widget.index != 3
                      ? AppColors.primaryColor
                      : Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
