import 'package:animated_digit/animated_digit.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/styles.dart';

class ProductTotalPrice extends StatelessWidget {
  const ProductTotalPrice({super.key, required this.animatedDigitController});
  final AnimatedDigitController animatedDigitController;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Total : ',
          style: Styles.styleBlackRussian18
              .copyWith(color: AppColors.grey, fontWeight: FontWeight.w400),
        ),
        AnimatedDigitWidget(
          controller: animatedDigitController,
          textStyle: Styles.styleBlackRussian18,
          fractionDigits: 2,
          enableSeparator: true,
          prefix: '\$',
        ),
      ],
    );
  }
}
