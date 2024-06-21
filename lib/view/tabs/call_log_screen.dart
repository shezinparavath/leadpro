import 'package:flutter/material.dart';
import 'package:leadpro/constant/functions.dart';
import 'package:leadpro/constant/styles.dart';
import 'package:leadpro/model/call_logs_model.dart';
import 'package:leadpro/provider/common_provider.dart';
import 'package:leadpro/widgets/call_logs_widget/call_logs_card.dart';
import 'package:leadpro/widgets/common_widgets/drop_down_widget.dart';
import 'package:provider/provider.dart';

class CallLogScreen extends StatelessWidget {
  const CallLogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        const BuildDropDown(hintText: 'Select User...'),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  AppFunctions.pickDate(
                      context,
                      Provider.of<CommonProvider>(context, listen: false),
                      true);
                },
                child: Consumer<CommonProvider>(
                  builder: (context, commonProvider, child) => Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFBDBDBD)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                commonProvider.getfromDate(),
                                softWrap: true,
                                style: AppStyles.smallText(context),
                              ),
                            ),
                            Icon(Icons.date_range_outlined,
                                size: MediaQuery.of(context).size.width * .05,
                                color: const Color(0xFFBDBDBD))
                          ])),
                ),
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  AppFunctions.pickDate(
                      context,
                      Provider.of<CommonProvider>(context, listen: false),
                      false);
                },
                child: Consumer<CommonProvider>(
                  builder: (context, commonProvider, child) => Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                commonProvider.gettoDate(),
                                softWrap: true,
                                style: AppStyles.smallText(context),
                              ),
                            ),
                            Icon(Icons.date_range_outlined,
                                size: MediaQuery.of(context).size.width * .05,
                                color: const Color(0xFFBDBDBD))
                          ])),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Expanded(
          child: ListView.builder(
              itemCount: callLogList.length,
              itemBuilder: (context, index) =>
                  BuildCallLogsCard(callLogsModel: callLogList[index])),
        )
      ],
    );
  }
}
