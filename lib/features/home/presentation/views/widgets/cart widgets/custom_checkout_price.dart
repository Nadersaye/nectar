import 'package:flutter/material.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/styles.dart';

class CustomCheckoutPriceText extends StatelessWidget {
  const CustomCheckoutPriceText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 22,
      width: 43,
      decoration: BoxDecoration(
          color: AppColors.deepGreen, borderRadius: BorderRadius.circular(4)),
      child: Center(
        child: Text(
          '\$12.5',
          style: Styles.styleblackRussian12.copyWith(color: AppColors.snow),
        ),
      ),
    );
  }
}
