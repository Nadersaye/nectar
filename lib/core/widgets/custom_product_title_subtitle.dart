import 'package:flutter/material.dart';
import 'package:nectar/core/utils/colors.dart';
import 'package:nectar/core/widgets/custom_product_name.dart';
import '../utils/styles.dart';

class CustomProductTitleAndSubtitle extends StatelessWidget {
  const CustomProductTitleAndSubtitle(
      {super.key, required this.title, required this.subTitle});
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
            padding: const EdgeInsets.only(top: 7),
            child: CustomProductName(
              title: title,
            )),
        const SizedBox(
          height: 5,
        ),
        Text(
          subTitle,
          style: Styles.styleMagnoliaWhite16.copyWith(color: AppColors.grey),
        ),
      ],
    );
  }
}
