import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leadpro/constant/color.dart';
import 'package:leadpro/constant/decoration.dart';
import 'package:leadpro/constant/functions.dart';
import 'package:leadpro/constant/routes.dart';
import 'package:leadpro/constant/styles.dart';
import 'package:leadpro/model/lead_history_model.dart';
import 'package:leadpro/provider/common_provider.dart';
import 'package:leadpro/view/tabs/call_log_screen.dart';
import 'package:leadpro/view/tabs/lead_details.dart';
import 'package:leadpro/view/tabs/lead_note_screen.dart';
import 'package:leadpro/widgets/common_widgets/build_textfield.dart';
import 'package:leadpro/widgets/common_widgets/drop_down_widget.dart';
import 'package:leadpro/widgets/resume_lead_widgets/drop_down_card.dart';
import 'package:leadpro/widgets/resume_lead_widgets/resume_lead_timer.dart';
import 'package:leadpro/widgets/resume_lead_widgets/timeline_event.dart';
import 'package:provider/provider.dart';

class ResumeLead extends StatefulWidget {
  const ResumeLead({super.key});

  @override
  State<ResumeLead> createState() => _ResumeLeadState();
}

class _ResumeLeadState extends State<ResumeLead>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: IconButton(
            onPressed: () {
              AppFunctions.warningPopUp(context,
                  title: 'Are you sure?',
                  content: 'Are you sure you want to save and exit this lead?',
                  onYESPressed: () => context.go(AppRoutes.dashboard));
            },
            icon: const Icon(Icons.arrow_back, color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(children: [
          Text('Website Development Campaign\n(MEP_8778643)',
              textAlign: TextAlign.center, style: AppStyles.bigText(context)),
          const Divider(indent: 20, endIndent: 20),
          const SizedBox(height: 30),
          Column(children: [
            ElevatedButton(
                onPressed: () {
                  AppFunctions.warningPopUp(context,
                      title: 'Are you sure?',
                      content: 'Are you sure you want to go to previous lead?');
                },
                style: AppDecoration.buttonStyle(Colors.lightGreen),
                child: Row(children: [
                  const Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 5),
                  Text('Previous Lead',
                      style:
                          AppStyles.mediumText(context, color: Colors.white)),
                ])),
            const SizedBox(width: 10),
            ElevatedButton(
                onPressed: () {
                  AppFunctions.warningPopUp(context,
                      title: 'Are you sure?',
                      content: 'Are you sure you want to go to next lead?');
                },
                style: AppDecoration.buttonStyle(Colors.amber),
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Text('Next Lead',
                      style:
                          AppStyles.mediumText(context, color: Colors.white)),
                  const SizedBox(width: 5),
                  const Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.white,
                  )
                ])),
          ]),
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.access_time, size: 36),
              CustomTimer(),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    leadFollowUpPopup(context);
                  },
                  icon: const Icon(Icons.fact_check_outlined,
                      color: Colors.white),
                  label: Text('Lead Follow Up',
                      style: AppStyles.smallText(context, color: Colors.white)),
                  style: AppDecoration.buttonStyle(AppColors.blue),
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    salesmanBookingPopup(context);
                  },
                  icon: const Icon(Icons.shopping_cart_outlined,
                      color: Colors.white),
                  label: Text('Salesman Booking',
                      style: AppStyles.smallText(context, color: Colors.white)),
                  style: AppDecoration.buttonStyle(AppColors.blue),
                ),
              ),
            ],
          ),
          const Divider(indent: 20, endIndent: 20),
          BuildDropDownCard(
            title: 'Lead Details',
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Lead Number', style: AppStyles.mediumText(context)),
                Text('21/87', style: AppStyles.smallText(context)),
                const SizedBox(height: 10),
                Text('Last Actioner', style: AppStyles.mediumText(context)),
                Text('Miss Loma Quigley DDS',
                    style: AppStyles.smallText(context)),
                const SizedBox(height: 10),
                Text('Follow Up', style: AppStyles.mediumText(context)),
                Text('-', style: AppStyles.smallText(context)),
                const SizedBox(height: 10),
                Text('Salesman Booking', style: AppStyles.mediumText(context)),
                Text('Darron Stamm on 25-05-2024 05:28am',
                    style: AppStyles.smallText(context)),
                const SizedBox(height: 10),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const BuildDropDownCard(title: 'Campaign Details'),
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
              Tab(text: 'Notes', icon: Icon(Icons.note_alt_outlined)),
            ],
          ),
          SizedBox(
            height: 500,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TabBarView(
                controller: _tabController,
                children: const [
                  LeadDetails(),
                  CallLogScreen(),
                  LeadNoteScreen(),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                  onPressed: () {},
                  style: AppDecoration.buttonStyle(AppColors.blue),
                  icon: const Icon(Icons.save, color: Colors.white),
                  label: Text('Save',
                      style:
                          AppStyles.smallText(context, color: Colors.white))),
              const SizedBox(width: 20),
              ElevatedButton.icon(
                  onPressed: () {
                    AppFunctions.warningPopUp(
                      context,
                      title: 'Are You Sure?',
                      content:
                          'Are You Sure You Want To Save And Exit This Lead?',
                      onYESPressed: () => context.go(AppRoutes.dashboard),
                    );
                  },
                  style: AppDecoration.buttonStyle(AppColors.blue),
                  icon: const Icon(Icons.save_alt, color: Colors.white),
                  label: Text('Save & Exit',
                      style: AppStyles.smallText(context, color: Colors.white)))
            ],
          ),
          const SizedBox(height: 20),
          Text('Lead History',
              style: AppStyles.bigText(context, color: AppColors.darkGreen)),
          const Divider(indent: 20, endIndent: 20),
          const SizedBox(height: 10),
          Container(
            constraints: const BoxConstraints(maxHeight: 300),
            child: CustomScrollView(
              shrinkWrap: true,
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => TimeLineEvent(
                      leadHistoryModel: leadHistoryList[index],
                      isLast: leadHistoryList.length - 1 == index,
                    ),
                    childCount: leadHistoryList.length,
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }

  leadFollowUpPopup(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Lead Follow Up', style: AppStyles.bigText(context)),
              content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Staff Member', style: AppStyles.mediumText(context)),
                    const BuildDropDown(hintText: 'Select Staff Member'),
                    const SizedBox(height: 10),
                    Text('Follow Up Time',
                        style: AppStyles.mediumText(context)),
                    GestureDetector(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      commonProvider.gettoDate(),
                                      softWrap: true,
                                      style: AppStyles.smallText(context),
                                    ),
                                  ),
                                  Icon(Icons.date_range_outlined,
                                      size: MediaQuery.of(context).size.width *
                                          .05,
                                      color: const Color(0xFFBDBDBD))
                                ])),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const BuildTextfield(
                        label: 'Notes', hintText: 'Please Enter Notes')
                  ]),
              actions: [
                ElevatedButton.icon(
                    onPressed: () {
                      context.pop();
                    },
                    style: AppDecoration.buttonStyle(AppColors.blue),
                    icon: const Icon(Icons.create, color: Colors.white),
                    label: Text('Create',
                        style:
                            AppStyles.smallText(context, color: Colors.white))),
                ElevatedButton(
                    onPressed: () {
                      context.pop();
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide())),
                    child: Text('Cancel', style: AppStyles.smallText(context)))
              ],
              actionsAlignment: MainAxisAlignment.spaceEvenly,
            ));
  }

  salesmanBookingPopup(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Saleman Booking', style: AppStyles.bigText(context)),
              content: SingleChildScrollView(
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Text('Salesman', style: AppStyles.mediumText(context)),
                  const BuildDropDown(hintText: 'Select Salesman'),
                  const SizedBox(height: 10),
                  Text('Booking Time', style: AppStyles.mediumText(context)),
                  GestureDetector(
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
                                    size:
                                        MediaQuery.of(context).size.width * .05,
                                    color: const Color(0xFFBDBDBD))
                              ])),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const BuildTextfield(
                      label: 'Notes', hintText: 'Please Enter Notes')
                ]),
              ),
              actions: [
                ElevatedButton.icon(
                    onPressed: () {
                      context.pop();
                    },
                    style: AppDecoration.buttonStyle(AppColors.blue),
                    icon: const Icon(Icons.create, color: Colors.white),
                    label: Text('Update',
                        style:
                            AppStyles.smallText(context, color: Colors.white))),
                ElevatedButton.icon(
                    onPressed: () {
                      context.pop();
                    },
                    style: AppDecoration.buttonStyle(Colors.red),
                    icon: const Icon(Icons.delete, color: Colors.white),
                    label: Text('Delete',
                        style:
                            AppStyles.smallText(context, color: Colors.white))),
                ElevatedButton(
                    onPressed: () {
                      context.pop();
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide())),
                    child: Text('Cancel', style: AppStyles.smallText(context)))
              ],
              actionsAlignment: MainAxisAlignment.spaceEvenly,
            ));
  }
}
