import 'package:flutter/material.dart';
import 'package:leadpro/constant/color.dart';
import 'package:leadpro/constant/styles.dart';
import 'package:leadpro/widgets/common_widgets/build_drawer_items.dart';

class Mainscreen extends StatelessWidget {
  Mainscreen({super.key, required this.child});
  final Widget child;
  final ValueNotifier<int> _selectedNotifier = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
              backgroundColor: AppColors.primaryColor,
              iconTheme: const IconThemeData(color: Colors.white),
              actions: [
                Text('Leadpro',
                    style: AppStyles.bigText(context, color: Colors.white)),
                const SizedBox(width: 10)
              ]),
          drawer: Drawer(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Column(children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    color: AppColors.primaryColor,
                    child: ListTile(
                      leading: const CircleAvatar(),
                      title: Text('John',
                          style: AppStyles.mediumText(context,
                              color: Colors.white)),
                      subtitle: Text('View Profile',
                          style: TextStyle(
                              fontSize:
                                  12 * MediaQuery.of(context).size.width / 360,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white,
                              color: Colors.white)),
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BuildDrawerItems(
                          icon: Icons.dashboard,
                          title: 'Dashboard',
                          notifier: _selectedNotifier,
                          index: 0),
                      BuildDrawerItems(
                          icon: Icons.support_agent,
                          title: 'Salesman Booking',
                          notifier: _selectedNotifier,
                          index: 1),
                      BuildDrawerItems(
                          icon: Icons.edit_note_sharp,
                          title: 'Follow up',
                          notifier: _selectedNotifier,
                          index: 2),
                      BuildDrawerItems(
                          icon: Icons.logout,
                          title: 'Log Out',
                          notifier: _selectedNotifier,
                          index: 3),
                    ],
                  ),
                )
              ])),
          body: child),
    );
  }
}
