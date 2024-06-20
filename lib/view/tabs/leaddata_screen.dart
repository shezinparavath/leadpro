import 'package:flutter/material.dart';
import 'package:leadpro/constant/styles.dart';

class LeaddataScreen extends StatelessWidget {
  const LeaddataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Card(
          surfaceTintColor: Colors.red[900],
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('First Name: Veronica',
                    style: AppStyles.mediumText(context)),
                const SizedBox(height: 5),
                Text('Last Name: Krajcik',
                    style: AppStyles.mediumText(context)),
                const SizedBox(height: 5),
                Text('Phone Number: +14044574887',
                    style: AppStyles.mediumText(context)),
                const SizedBox(height: 5),
                Text('Email: makenzie@example.org',
                    style: AppStyles.mediumText(context)),
                const SizedBox(height: 5),
                Text('Company: Hoeger,Ritchie and Stanford',
                    style: AppStyles.mediumText(context)),
                const SizedBox(height: 5),
                Text('Website: friesen.com',
                    style: AppStyles.mediumText(context)),
                const SizedBox(height: 5),
                Text("Notes: Rabbit; 'in fact,there's nothing written on the.",
                    style: AppStyles.mediumText(context)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
