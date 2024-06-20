import 'package:flutter/material.dart';
import 'package:leadpro/constant/functions.dart';
import 'package:leadpro/constant/styles.dart';
import 'package:leadpro/model/lead_notes_model.dart';

class BuildLeadNotesCard extends StatelessWidget {
  const BuildLeadNotesCard({super.key, required this.leadNoteModel});
  final LeadNotesModel leadNoteModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.green[900],
      child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListTile(
            minLeadingWidth: 10,
            contentPadding: EdgeInsets.zero,
            leading: const CircleAvatar(),
            title: Text.rich(TextSpan(
                text: 'Admin ',
                style: TextStyle(
                    fontSize: 12 * MediaQuery.of(context).size.width / 360,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87),
                children: [
                  TextSpan(
                      text: leadNoteModel.time,
                      style: AppStyles.smallText(context))
                ])),
            subtitle: Text(leadNoteModel.content,
                style: AppStyles.mediumText(context)),
            trailing: SizedBox(
              width: 50,
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                GestureDetector(
                    onTap: () {
                      AppFunctions.warningPopUp(context,
                          title: 'Delete',
                          content:
                              'Are you sure you want to delete this note?');
                    },
                    child: const Icon(Icons.delete, size: 18)),
                const SizedBox(width: 10),
                GestureDetector(
                    onTap: () {}, child: const Icon(Icons.edit, size: 18))
              ]),
            ),
          )),
    );
  }
}
