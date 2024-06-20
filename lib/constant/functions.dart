import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leadpro/constant/color.dart';
import 'package:leadpro/constant/styles.dart';

class AppFunctions {
  static Future warningPopUp(BuildContext context,
      {required String title,
      required String content,
      void Function()? onYESPressed,
      void Function()? onNOPressed}) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
            title: Row(children: [
              const Icon(Icons.error_outline, color: Colors.orange),
              const SizedBox(width: 10),
              Text(title, style: AppStyles.bigText(context))
            ]),
            content: Text(content, style: AppStyles.smallText(context)),
            actions: [
              ElevatedButton(
                  onPressed: onNOPressed ??
                      () {
                        context.pop();
                      },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: const BorderSide()),
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent),
                  child: Text('No', style: AppStyles.smallText(context))),
              ElevatedButton(
                  onPressed: onYESPressed ??
                      () {
                        context.pop();
                      },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: const BorderSide(color: Colors.red)),
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent),
                  child: Text('Yes',
                      style: AppStyles.smallText(context, color: Colors.red)))
            ],
            actionsAlignment: MainAxisAlignment.end));
  }

  static void pickDate(BuildContext context, provider, bool isFromDate) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime.now(),
      initialDatePickerMode: DatePickerMode.day,
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(
            primary: AppColors.primaryColor, // header background color
            onPrimary: Colors.white, // header text color
            onSurface: Colors.black, // body text color
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: AppColors.teal, // button text color
            ),
          ),
        ),
        child: child!,
      ),
    );

    if (pickedDate != null) {
      if (isFromDate) {
        provider.setFromdate(pickedDate);
      } else {
        provider.setTodate(pickedDate);
      }
    }
  }
}
