import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/core/models/product_item_model.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/styles.dart';
import 'custom_appbar_icon.dart';
import 'custom_product_price_widget.dart';
import '../../../../../../core/widgets/custom_product_total_price_widget.dart';

class CustomControlProductCount extends StatelessWidget {
  const CustomControlProductCount({
    super.key,
    required this.product,
  });
  final ProductItemModel product;
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
                icon: const Icon(Icons.remove), size: 23, onPressed: () {}),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Center(
          child: Text(
            '',
            style: Styles.styleBlackRussian18,
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
                onPressed: () {}),
          ),
        ),
        const Spacer(),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomProductPrice(
              product: product,
            ),
            const ProductTotalPrice(), /////////////////////
          ],
        )
      ],
    );
  }
}
