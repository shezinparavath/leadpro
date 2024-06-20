import 'package:flutter/material.dart';
import 'package:leadpro/constant/functions.dart';
import 'package:leadpro/constant/styles.dart';
import 'package:leadpro/model/lead_notes_model.dart';
import 'package:leadpro/provider/common_provider.dart';
import 'package:leadpro/widgets/lead_notes_widgets/lead_notes_card.dart';
import 'package:provider/provider.dart';

class LeadNoteScreen extends StatefulWidget {
  const LeadNoteScreen({super.key});

  @override
  State<LeadNoteScreen> createState() => _LeadNoteScreenState();
}

class _LeadNoteScreenState extends State<LeadNoteScreen> {
  String? _selectedDropDownText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xFFBDBDBD)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xFFBDBDBD)),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          ),
          value: _selectedDropDownText,
          items: const [
            DropdownMenuItem(
              value: 'data1',
              child: Text('data1'),
            ),
            DropdownMenuItem(
              value: 'data2',
              child: Text('data2'),
            ),
            DropdownMenuItem(
              value: 'data3',
              child: Text('data3'),
            ),
            DropdownMenuItem(
              value: 'data4',
              child: Text('data4'),
            ),
          ],
          onChanged: (String? value) {
            setState(() {
              _selectedDropDownText = value;
            });
          },
          hint: const Text(
            'Select User...',
            style: TextStyle(fontSize: 12, color: Color(0xFFBDBDBD)),
          ),
          icon: const Icon(Icons.keyboard_arrow_down_rounded,
              color: Color(0xFFBDBDBD)),
          borderRadius: BorderRadius.circular(10),
        ),
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
                      height: MediaQuery.of(context).size.height * 0.05,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFBDBDBD)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              commonProvider.getfromDate(),
                              style: AppStyles.smallText(context),
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
                      height: MediaQuery.of(context).size.height * 0.05,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              commonProvider.gettoDate(),
                              style: AppStyles.smallText(context),
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
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff1890ff),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
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
}