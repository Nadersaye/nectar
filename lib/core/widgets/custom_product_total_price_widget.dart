import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/styles.dart';

class ProductTotalPrice extends StatelessWidget {
  const ProductTotalPrice({super.key});
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
        Text(
          '\$' '',
          style: Styles.styleBlackRussian18,
        ),
      ],
    );
  }
}
