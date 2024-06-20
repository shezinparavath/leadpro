import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leadpro/constant/color.dart';
import 'package:leadpro/constant/functions.dart';
import 'package:leadpro/constant/routes.dart';
import 'package:leadpro/constant/styles.dart';

class ResumeLead extends StatelessWidget {
  const ResumeLead({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: IconButton(
            onPressed: () {
              AppFunctions.warningPopUp(context,
                  title: 'Are you sure?',
                  content: 'Are you sure you want to save and exit this lead?',
                  onYESPressed: () => context.go(AppRoutes.dashboard));
            },
            icon: const Icon(Icons.arrow_back, color: Colors.white)),
      ),
      body: ListView(children: [
        Text('Website Development Campaign\n(MEP_8778643)',
            style: AppStyles.bigText(context)),
        const Divider(indent: 20, endIndent: 20),
        const SizedBox(height: 30),
        ElevatedButton(
            onPressed: () {},
            child: Row(children: [
              const Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
              ),
              const SizedBox(width: 5),
              Text('Previous Lead',
                  style: AppStyles.smallText(context, color: Colors.white)),
            ])),
        ElevatedButton(
            onPressed: () {},
            child: Row(children: [
              Text('Next Lead',
                  style: AppStyles.smallText(context, color: Colors.white)),
              const SizedBox(width: 5),
              const Icon(
                Icons.arrow_forward_rounded,
                color: Colors.white,
              )
            ])),
      ]),
    );
  }
}
