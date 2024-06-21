import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leadpro/constant/color.dart';
import 'package:leadpro/constant/decoration.dart';
import 'package:leadpro/constant/functions.dart';
import 'package:leadpro/constant/routes.dart';
import 'package:leadpro/main.dart';
import 'package:leadpro/widgets/common_widgets/icon_button.dart';

class FollowUpScreen extends StatelessWidget {
  const FollowUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          20,
          (index) => Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.white,
              boxShadow: AppDecoration.boxShadow(),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                      "Electronic Item Sell Campaign 22-06-2024 09:48 am"),
                  Row(
                    children: [
                      ButtonIcon(
                          clr: AppColors.secondaryColor,
                          icon: Icons.play_circle_outline_rounded,
                          onNextTap: () {
                            AppFunctions.warningPopUp(context,
                                title: 'Are you Sure?',
                                content:
                                    'Are you sure you want to resume this lead?',
                                onYESPressed: () =>
                                    context.go(AppRoutes.resumeLead));
                          }),
                      const SizedBox(
                        width: 5,
                      ),
                      const ButtonIcon(
                        clr: AppColors.blue,
                        icon: Icons.visibility_outlined,
                        onNextTap: openEndDrawer,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
