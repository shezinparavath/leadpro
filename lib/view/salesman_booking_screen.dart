import 'package:flutter/material.dart';
import 'package:leadpro/model/salesman_booking_model.dart';
import 'package:leadpro/widgets/salesman_booking_widget/saleman_booking_card.dart';

class SalesmanBookingScreen extends StatefulWidget {
  const SalesmanBookingScreen({super.key});

  @override
  State<SalesmanBookingScreen> createState() => _SalesmanBookingScreenState();
}

class _SalesmanBookingScreenState extends State<SalesmanBookingScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: salemansBookingList.length,
      itemBuilder: (context, index) => BuildSalemanBookingCard(
          salesmanBookingModel: salemansBookingList[index]),
    );
  }
}
