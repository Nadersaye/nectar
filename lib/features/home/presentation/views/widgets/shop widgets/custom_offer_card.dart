import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/core/utils/colors.dart';
import 'package:nectar/core/widgets/custom_product_name.dart';

import '../../../../../../core/utils/styles.dart';
import 'custom_add_button.dart';

class CustomOfferCard extends StatelessWidget {
  const CustomOfferCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 173 / 248,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.lightGray),
          borderRadius: BorderRadius.circular(18.r),
          boxShadow: const [
            BoxShadow(
              color: AppColors.black,
              offset: Offset(0, 6),
              blurRadius: 6,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width / 4,
              width: double.infinity,
              child: Stack(
                children: [
                  Image.asset('assets/images/apple.png'),
                  PositionedDirectional(
                    start: 0,
                    top: 0,
                    child: Container(
                      color: AppColors.lightRed,
                      child: Text(
                        '20 %',
                        style: Styles.styleGrey13
                            .copyWith(color: AppColors.mediumRed),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const CustomProductName(),
            Text(
              '1 kg, price',
              style: Styles.styleGrey14.copyWith(color: AppColors.grey),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                    text: TextSpan(children: [
                  TextSpan(text: '\$ 2.88', style: Styles.styleBlackRussian18),
                  TextSpan(
                    text: '\n   3.88',
                    style: Styles.styleBlackRussian18.copyWith(
                        decoration: TextDecoration.lineThrough,
                        color: AppColors.grey),
                  ),
                ])),
                const CustomAddButton()
              ],
            )
          ],
        ),
      ),
    );
  }
}
