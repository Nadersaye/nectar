import 'package:flutter/material.dart';
import 'package:nectar/core/utils/colors.dart';
import 'package:nectar/core/widgets/custom_product_name.dart';
import '../../../../../../core/utils/styles.dart';

class CustomProductTitleAndSubtitle extends StatelessWidget {
  const CustomProductTitleAndSubtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
            padding: EdgeInsets.only(top: 7), child: CustomProductName()),
        const SizedBox(
          height: 10,
        ),
        Text(
          '1 kg, price',
          style: Styles.styleMagnoliaWhite16.copyWith(color: AppColors.grey),
        ),
      ],
    );
  }
}
