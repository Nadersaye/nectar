import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/core/models/cart_item_model.dart';
import 'package:nectar/core/models/product_item_model.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/custom_product_total_price_widget.dart';
import '../product details widgets/custom_appbar_icon.dart';
import '../product details widgets/custom_product_price_widget.dart';

class CustomControlCartCount extends StatelessWidget {
  const CustomControlCartCount({
    super.key,
    required this.cart,
  });
  final CartItemModel cart;
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
              product: ProductItemModel(
                  title: '',
                  subtitle: '',
                  type: '',
                  category: '',
                  company: '',
                  imageUrl: '',
                  rate: 3,
                  benefits: '',
                  details: '',
                  price: 5,
                  offerPrice: 4),
            ),
            const ProductTotalPrice(), /////////////////////
          ],
        )
      ],
    );
  }
}
