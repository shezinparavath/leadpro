import 'package:flutter/material.dart';
import 'package:leadpro/constant/color.dart';
import 'package:leadpro/model/item_count_card_model.dart';
import 'package:leadpro/widgets/common_widgets/fade_in_animation.dart';
import 'package:leadpro/widgets/dashboard_widgets/item_count_card.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<ItemCountCardModel> itemCountCardList = [
    const ItemCountCardModel(
        color: AppColors.teal,
        count: '20',
        icon: Icons.copyright,
        title: 'Active Campaigns'),
    const ItemCountCardModel(
        color: AppColors.darkGreen,
        count: '10',
        icon: Icons.fact_check_outlined,
        title: 'Total Follow Up'),
    const ItemCountCardModel(
        color: AppColors.darkOrange,
        count: '30',
        icon: Icons.phone_android_outlined,
        title: 'Call Made'),
    const ItemCountCardModel(
        color: AppColors.lightPink,
        count: '1 H,32 M,45 S',
        icon: Icons.access_time,
        title: 'Total Duration')
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      FadeInAnimation(
        direction: FadeInDirection.ttb,
        delay: 2,
        fadeOffset: 90,
        child: GridView.builder(
            padding: const EdgeInsets.all(10),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: calculateAspectRatio(context)),
            itemCount: itemCountCardList.length,
            itemBuilder: (context, index) => BuildItemCountCard(
                itemCountCardModel: itemCountCardList[index])),
      ),
      const SizedBox(height: 20),
      FadeInAnimation(
        direction: FadeInDirection.btt,
        delay: 2,
        fadeOffset: 90,
        child: SizedBox(
          height: MediaQuery.of(context).size.height * .6,
          child: SfCartesianChart(
              primaryXAxis: const CategoryAxis(labelRotation: -45),
              series: <CartesianSeries>[
                ColumnSeries<CallData, String>(
                  name: 'Call Data',
                  dataLabelSettings: const DataLabelSettings(isVisible: true),
                  color: AppColors.secondaryColor,
                  dataSource: const <CallData>[
                    CallData(numberOfCallsMade: 40, date: '30-12-2010'),
                    CallData(numberOfCallsMade: 30, date: '30-12-2011'),
                    CallData(numberOfCallsMade: 20, date: '30-12-2012'),
                    CallData(numberOfCallsMade: 10, date: '30-12-2013')
                  ],
                  xValueMapper: (CallData sales, _) => sales.date,
                  yValueMapper: (CallData sales, _) => sales.numberOfCallsMade,
                ),
              ],
              tooltipBehavior: TooltipBehavior(
                animationDuration: 100,
                header: 'Call Data',
                enable: true,
                activationMode: ActivationMode.singleTap,
              ),
              legend: const Legend(
                isVisible: true,
              )),
        ),
      ),
    ]);
  }

  double calculateAspectRatio(BuildContext context) {
    // Get the device's font scaling factor
    double textScaleFactor = MediaQuery.of(context).textScaler.scale(1);

    // Calculate the aspect ratio based on the font scaling factor
    // You can adjust this calculation based on your specific requirements
    double aspectRatio = 2 / textScaleFactor;

    // Ensure that the aspect ratio is within a reasonable range
    aspectRatio = aspectRatio.clamp(1.0, double.infinity);

    return aspectRatio;
  }
}

class CallData {
  final int numberOfCallsMade;
  final String date;
  const CallData({required this.numberOfCallsMade, required this.date});
}
