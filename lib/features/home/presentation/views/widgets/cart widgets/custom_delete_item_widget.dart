import 'package:flutter/material.dart';

import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/widgets/custom_product_title_subtitle.dart';
import '../product details widgets/custom_appbar_icon.dart';

class CustomDeleteItem extends StatelessWidget {
  const CustomDeleteItem({super.key, required this.deleteItem});
  final Function deleteItem;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CustomProductTitleAndSubtitle(),
        CustomIcon(
          icon: const Icon(
            Icons.close,
            size: 17,
            color: AppColors.pinkSwan,
          ),
          onPressed: deleteItem(),
        )
      ],
    );
  }
}
