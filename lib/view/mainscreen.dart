import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leadpro/constant/color.dart';
import 'package:leadpro/constant/styles.dart';
import 'package:leadpro/main.dart';
import 'package:leadpro/provider/common_provider.dart';
import 'package:leadpro/view/tabs/call_log_screen.dart';
import 'package:leadpro/view/tabs/lead_note_screen.dart';
import 'package:leadpro/view/tabs/leaddata_screen.dart';
import 'package:leadpro/widgets/common_widgets/build_drawer_items.dart';
import 'package:leadpro/widgets/salesman_booking_widget/basic_details_items.dart';
import 'package:provider/provider.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key, required this.child});
  final Widget child;

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen>
    with SingleTickerProviderStateMixin {
  final ValueNotifier<int> _selectedNotifier = ValueNotifier<int>(0);
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          key: scaffoldKey,
          endDrawerEnableOpenDragGesture: false,
          endDrawer: Drawer(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              context.pop();
                            },
                            icon: const Icon(Icons.close)),
                        Text('Lead Details', style: AppStyles.bigText(context))
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Basic Details',
                          style: AppStyles.bigText(context),
                        ),
                        GestureDetector(
                          onTap: () {
                            Provider.of<CommonProvider>(context, listen: false)
                                .triggerOntap();
                          },
                          child: Consumer<CommonProvider>(
                            builder: (context, commonProvider, child) => Icon(
                              commonProvider.isSelected
                                  ? Icons.remove
                                  : Icons.add,
                              size: 32,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Consumer<CommonProvider>(
                          builder: (context, commonProvider, child) => Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    BuildBasicDetailsItems(
                                      title: 'First Actioner',
                                      content: 'Admin',
                                    ),
                                    BuildBasicDetailsItems(
                                      title: 'Campaign Name',
                                      content: 'Live Event Campaign',
                                    ),
                                  ],
                                ),
                                if (commonProvider.isSelected) ...[
                                  const SizedBox(height: 15),
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      BuildBasicDetailsItems(
                                        title: 'Reference Number',
                                        content: 'MEP_7840105',
                                      ),
                                      BuildBasicDetailsItems(
                                        title: 'Last Actioner',
                                        content: 'Admin',
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 15),
                                  const Center(
                                    child: BuildBasicDetailsItems(
                                      title: 'Call Duration',
                                      content: '4 M,19 S',
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    TabBar(
                      labelPadding: EdgeInsets.zero,
                      padding: EdgeInsets.zero,
                      indicatorPadding: EdgeInsets.zero,
                      indicatorColor: AppColors.secondaryColor,
                      labelColor: AppColors.secondaryColor,
                      unselectedLabelColor: Colors.black87,
                      controller: _tabController,
                      tabs: const [
                        Tab(text: 'Lead Data', icon: Icon(Icons.list_rounded)),
                        Tab(text: 'Call Logs', icon: Icon(Icons.call_outlined)),
                        Tab(
                            text: 'Lead Notes',
                            icon: Icon(Icons.note_alt_outlined)),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: const [
                          LeaddataScreen(),
                          CallLogScreen(),
                          LeadNoteScreen(),
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
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
                  ),
                )
              ])),
          body: widget.child),
    );
  }
}
