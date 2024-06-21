import 'package:flutter/material.dart';
import 'package:leadpro/constant/decoration.dart';

class ButtonIcon extends StatelessWidget {
  final IconData icon;
  final Color clr;
  final VoidCallback? onNextTap;

  const ButtonIcon({
    super.key,
    required this.icon,
    this.onNextTap,
    required this.clr,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
      onTap: onNextTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Container(
            height: 40,
            decoration: BoxDecoration(
              boxShadow: AppDecoration.boxShadow(),
              borderRadius: BorderRadius.circular(
                4,
              ),
              color: clr,
            ),
            child: Icon(icon, color: Colors.white)),
      ),
    ));
  }
}
