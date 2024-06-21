import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leadpro/constant/color.dart';
import 'package:leadpro/constant/decoration.dart';
import 'package:leadpro/constant/functions.dart';
import 'package:leadpro/constant/styles.dart';
import 'package:leadpro/model/lead_notes_model.dart';
import 'package:leadpro/provider/common_provider.dart';
import 'package:leadpro/widgets/common_widgets/drop_down_widget.dart';
import 'package:leadpro/widgets/lead_notes_widgets/lead_notes_card.dart';
import 'package:provider/provider.dart';

class LeadNoteScreen extends StatelessWidget {
  const LeadNoteScreen({super.key});

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
                                softWrap: true,
                                commonProvider.gettoDate(),
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
        ElevatedButton.icon(
            onPressed: () {
              addNewNotePopup(context);
            },
            style: AppDecoration.buttonStyle(const Color(0xff1890ff)),
            icon: const Icon(Icons.add, color: Colors.white),
            label: Text('Add New Note',
                style: AppStyles.smallText(context, color: Colors.white))),
        Expanded(
          child: ListView.builder(
              itemCount: leadNotesList.length,
              itemBuilder: (context, index) =>
                  BuildLeadNotesCard(leadNoteModel: leadNotesList[index])),
        )
      ],
    );
  }

  addNewNotePopup(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Add New Notes', style: AppStyles.bigText(context)),
              content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Notes', style: AppStyles.mediumText(context)),
                    const Divider(),
                    TextFormField(
                        maxLines: 3,
                        decoration: InputDecoration(
                            hintText: 'Please Enter Notes',
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide()),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide())))
                  ]),
              actions: [
                ElevatedButton.icon(
                    onPressed: () {
                      context.pop();
                    },
                    style: AppDecoration.buttonStyle(AppColors.blue),
                    icon: const Icon(Icons.note_add, color: Colors.white),
                    label: Text('Create',
                        style:
                            AppStyles.smallText(context, color: Colors.white))),
                ElevatedButton(
                    onPressed: () {
                      context.pop();
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(),
                            borderRadius: BorderRadius.circular(8))),
                    child: Text('Cancel', style: AppStyles.smallText(context)))
              ],
              actionsAlignment: MainAxisAlignment.spaceEvenly,
            ));
  }
}
