import 'package:flutter/material.dart';

import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/widgets/custom_product_title_subtitle.dart';
import '../product details widgets/custom_appbar_icon.dart';

class CustomDeleteItem extends StatelessWidget {
  const CustomDeleteItem(
      {super.key,
      required this.deleteItem,
      required this.title,
      required this.subTitle});
  final Function deleteItem;
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomProductTitleAndSubtitle(
          title: title,
          subTitle: subTitle,
        ),
        CustomIcon(
          icon: const Icon(
            Icons.close,
            size: 17,
            color: AppColors.pinkSwan,
          ),
          onPressed: () {
            deleteItem;
          },
        )
      ],
    );
  }
}
