import 'dart:math';

import 'package:flutter/material.dart';
import 'package:leadpro/constant/color.dart';
import 'package:leadpro/constant/functions.dart';
import 'package:leadpro/constant/styles.dart';
import 'package:leadpro/main.dart';
import 'package:leadpro/model/salesman_booking_model.dart';

class BuildSalemanBookingCard extends StatefulWidget {
  final SalesmanBookingModel salesmanBookingModel;

  const BuildSalemanBookingCard(
      {super.key, required this.salesmanBookingModel});

  @override
  State<BuildSalemanBookingCard> createState() =>
      _BuildSalemanBookingCardState();
}

class _BuildSalemanBookingCardState extends State<BuildSalemanBookingCard> {
  void _openEndDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        surfaceTintColor:
            Colors.primaries[Random().nextInt(Colors.primaries.length)],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Row(children: [
                    const Icon(Icons.badge_outlined,
                        color: AppColors.primaryColor),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text('Reference Number',
                          softWrap: true,
                          style: AppStyles.smallText(context,
                              color: AppColors.primaryColor)),
                    )
                  ]),
                ),
                Expanded(
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(widget.salesmanBookingModel.referenceNumber,
                          softWrap: true, style: AppStyles.smallText(context))),
                )
              ]),
              const Divider(),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Row(children: [
                      const Icon(Icons.campaign, color: AppColors.primaryColor),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text('Campaign Name',
                            style: AppStyles.smallText(context,
                                color: AppColors.primaryColor)),
                      )
                    ]),
                  ),
                  Expanded(
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Text(widget.salesmanBookingModel.campaignName,
                            softWrap: true,
                            style: AppStyles.smallText(context))),
                  )
                ],
              ),
              const Divider(),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Row(children: [
                      const Icon(Icons.access_time_sharp,
                          color: AppColors.primaryColor),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text('Booking Time',
                            style: AppStyles.smallText(context,
                                color: AppColors.primaryColor)),
                      )
                    ]),
                  ),
                  Expanded(
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Text(widget.salesmanBookingModel.bookingTime,
                            softWrap: true,
                            style: AppStyles.smallText(context))),
                  )
                ],
              ),
              const Divider(),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Row(children: [
                      const Icon(Icons.person, color: AppColors.primaryColor),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text('Salesman',
                            style: AppStyles.smallText(context,
                                color: AppColors.primaryColor)),
                      )
                    ]),
                  ),
                  Expanded(
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Text(widget.salesmanBookingModel.salesMan,
                            softWrap: true,
                            style: AppStyles.smallText(context))),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          AppFunctions.warningPopUp(context,
                              title: 'Are you Sure?',
                              content:
                                  'Are you sure you want to resume this lead?');
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.secondaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                        child: const Icon(Icons.play_circle_outline_rounded,
                            color: Colors.white)),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: ElevatedButton(
                        onPressed: _openEndDrawer,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                        child: const Icon(Icons.visibility_outlined,
                            color: Colors.white)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
