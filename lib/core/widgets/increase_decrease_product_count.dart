import 'package:animated_digit/animated_digit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';
import '../utils/styles.dart';
import '../../features/home/presentation/views/widgets/product details widgets/custom_appbar_icon.dart';
import '../../features/home/presentation/views/widgets/product details widgets/custom_product_price_widget.dart';
import 'custom_product_total_price_widget.dart';

class IncreaseAndDecreaseProductCount extends StatelessWidget {
  const IncreaseAndDecreaseProductCount(
      {super.key,
      required this.countController,
      required this.priceController,
      required this.price,
      required this.isOfferProduct,
      required this.offerPrice});
  final AnimatedDigitController countController;
  final AnimatedDigitController priceController;
  final double price;
  final bool isOfferProduct;
  final double offerPrice;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 47.w,
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.lightGray),
              borderRadius: BorderRadius.circular(17.r)),
          child: AspectRatio(
            aspectRatio: 1 / 1,
            child: CustomIcon(
                icon: const Icon(Icons.remove),
                size: 23,
                onPressed: decreaseProductsNumber),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Center(
          child: AnimatedDigitWidget(
            controller: countController,
            textStyle: Styles.styleBlackRussian18,
            enableSeparator: true,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          width: 46.w,
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.lightGray),
              borderRadius: BorderRadius.circular(17.r)),
          child: AspectRatio(
            aspectRatio: 1 / 1,
            child: CustomIcon(
                icon: const Icon(
                  Icons.add,
                  color: AppColors.oceanGreen,
                  size: 23,
                ),
                onPressed: increaseProductsNumber),
          ),
        ),
        const Spacer(),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomProductPrice(
                price: price,
                offerPrice: offerPrice,
                isOfferProduct: isOfferProduct),
            ProductTotalPrice(animatedDigitController: priceController),
          ],
        )
      ],
    );
  }

  void increaseProductsNumber() {
    countController.addValue(1);
    priceController.addValue(price);
  }

  void decreaseProductsNumber() {
    if (countController.value != 0) {
      countController.minusValue(1);
      priceController.minusValue(price);
    }
  }
}
