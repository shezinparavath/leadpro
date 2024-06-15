import 'package:flutter/material.dart';
import 'package:leadpro/constant/color.dart';
import 'package:leadpro/constant/styles.dart';
import 'package:leadpro/model/item_count_card_model.dart';

class BuildItemCountCard extends StatelessWidget {
  const BuildItemCountCard({super.key, required this.itemCountCardModel});
  final ItemCountCardModel itemCountCardModel;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
            contentPadding: const EdgeInsets.only(left: 10),
            horizontalTitleGap: 10,
            leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: itemCountCardModel.color,
                    borderRadius: BorderRadius.circular(8)),
                child: Icon(itemCountCardModel.icon, color: Colors.white)),
            title: Text(itemCountCardModel.count,
                style: AppStyles.mediumText(context)),
            subtitle: Text(
              itemCountCardModel.title,
              style: AppStyles.smallText(context, color: AppColors.grey),
            )));
  }
}
