import 'package:flutter/material.dart';
import 'package:leadpro/constant/styles.dart';
import 'package:leadpro/widgets/common_widgets/build_textfield.dart';
import 'package:leadpro/widgets/common_widgets/drop_down_widget.dart';

class LeadDetails extends StatelessWidget {
  const LeadDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(children: [
            const Expanded(
              child: BuildTextfield(
                  label: 'Reference Number',
                  hintText: 'Please Enter Reference Number'),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lead Status',
                      style: AppStyles.smallText(context),
                    ),
                    const BuildDropDown(hintText: 'Lead Status')
                  ]),
            )
          ]),
          const SizedBox(height: 10),
          const Row(children: [
            Expanded(
              child: BuildTextfield(
                  label: 'First Name', hintText: 'Please Enter First Name'),
            ),
            SizedBox(width: 10),
            Expanded(
              child: BuildTextfield(
                  label: 'Last Name', hintText: 'Please Enter Last Name'),
            ),
          ]),
          const SizedBox(height: 10),
          const Row(children: [
            Expanded(
                child: BuildTextfield(
                    label: 'Company', hintText: 'Please Enter Company')),
            SizedBox(width: 10),
            Expanded(
                child: BuildTextfield(
                    label: 'Email', hintText: 'please Enter Email')),
          ]),
          const SizedBox(height: 10),
          const Row(children: [
            Expanded(
                child: BuildTextfield(
                    label: 'Website', hintText: 'Please Enter Website')),
            SizedBox(width: 10),
            Expanded(
              child: BuildTextfield(
                  label: 'Reference Number',
                  hintText: 'Please Enter Phone Number'),
            ),
          ]),
          const SizedBox(height: 10),
          const Row(children: [
            Expanded(
                child: BuildTextfield(
                    label: 'Notes', hintText: 'Please Enter Notes')),
            SizedBox(width: 10),
            Expanded(
              child: BuildTextfield(
                  label: 'Company Name', hintText: 'Please Enter Company Name'),
            )
          ]),
          const SizedBox(height: 10),
          const Row(children: [
            Expanded(
              child: BuildTextfield(
                  label: 'Contact Number',
                  hintText: 'Please Enter Contact Number'),
            ),
            SizedBox(width: 10),
            Expanded(
              child: BuildTextfield(
                  label: 'Software Name',
                  hintText: 'Please Enter Software Name'),
            )
          ]),
          const SizedBox(height: 10),
          const Row(children: [
            Expanded(
                child: BuildTextfield(
                    label: 'Duration', hintText: 'Please Enter Duration')),
            SizedBox(width: 10),
            Expanded(
                child: BuildTextfield(
                    label: 'Budget', hintText: 'Please Enter Budget')),
          ]),
          const SizedBox(height: 10)
        ],
      ),
    );
  }
}
