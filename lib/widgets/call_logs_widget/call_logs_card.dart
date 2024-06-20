import 'package:flutter/material.dart';
import 'package:leadpro/constant/styles.dart';
import 'package:leadpro/model/call_logs_model.dart';

class BuildCallLogsCard extends StatelessWidget {
  const BuildCallLogsCard({super.key, required this.callLogsModel});
  final CallLogsCardModel callLogsModel;
  @override
  Widget build(BuildContext context) {
    return Card(
        surfaceTintColor: Colors.blue[900],
        child: Padding(
            padding: const EdgeInsets.all(10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Called By: ${callLogsModel.calledBy}',
                  style: AppStyles.mediumText(context)),
              const SizedBox(height: 5),
              Text('Duration: ${callLogsModel.duration}',
                  style: AppStyles.mediumText(context)),
              const SizedBox(height: 5),
              Text('Called On: ${callLogsModel.calledOn}',
                  style: AppStyles.mediumText(context))
            ])));
  }
}
