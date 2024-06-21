import 'package:flutter/material.dart';
import 'package:leadpro/constant/color.dart';
import 'package:leadpro/constant/styles.dart';
import 'package:leadpro/model/lead_history_model.dart';

class TimeLineEvent extends StatelessWidget {
  const TimeLineEvent(
      {super.key, required this.leadHistoryModel, required this.isLast});
  final LeadHistoryModel leadHistoryModel;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Icon(leadHistoryModel.icon, color: AppColors.blue),
          ],
        ),
        IntrinsicHeight(
          child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Container(
                width: 1,
                margin: const EdgeInsets.only(left: 10),
                color: Colors.grey),
            const SizedBox(width: 20),
            Expanded(
                child: Text(
              leadHistoryModel.content,
              softWrap: true,
              style: AppStyles.mediumText(context),
            ))
          ]),
        )
      ],
    );
  }
}
