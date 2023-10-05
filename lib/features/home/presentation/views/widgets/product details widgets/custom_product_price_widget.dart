import 'package:flutter/material.dart';

import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/styles.dart';

class CustomProductPrice extends StatelessWidget {
  const CustomProductPrice(
      {super.key,
      required this.price,
      required this.offerPrice,
      required this.isOfferProduct});
  final double price;
  final double offerPrice;
  final bool isOfferProduct;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
        firstChild: RichText(
          text: TextSpan(children: [
            TextSpan(
                text: 'Price : ',
                style: Styles.styleBlackRussian18.copyWith(
                    color: AppColors.grey, fontWeight: FontWeight.w400)),
            TextSpan(text: r'$' '$price', style: Styles.styleBlackRussian18)
          ]),
        ),
        secondChild: RichText(
            text: TextSpan(
                text: 'Price : ',
                style: Styles.styleBlackRussian18.copyWith(
                    color: AppColors.grey, fontWeight: FontWeight.w400),
                children: [
              TextSpan(
                text: '\$ ' '$offerPrice',
                style: Styles.styleBlackRussian18,
              ),
              TextSpan(
                text: '\n \$' '$price',
                style: Styles.styleBlackRussian18.copyWith(
                    decoration: TextDecoration.lineThrough,
                    color: AppColors.grayHanin),
              ),
            ])),
        crossFadeState: isOfferProduct
            ? CrossFadeState.showSecond
            : CrossFadeState.showFirst,
        duration: Duration.zero);
  }
}
