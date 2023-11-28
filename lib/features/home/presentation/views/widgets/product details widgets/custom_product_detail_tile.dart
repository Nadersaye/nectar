import 'package:flutter/material.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/styles.dart';
import 'product_details_body.dart';

class CustomProductDetailTile extends StatelessWidget {
  const CustomProductDetailTile({
    super.key,
    required this.widget,
  });

  final ProductDetailsBody widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border.symmetric(
              horizontal: BorderSide(color: AppColors.lightGray))),
      child: ExpansionTile(
        tilePadding: EdgeInsets.zero,
        title: Text(
          'Product Detail',
          style: Styles.styleBlackRussian18,
        ),
        children: [
          Text(
            widget.product.details,
            style: Styles.styleGrey13,
          ),
        ],
      ),
    );
  }
}
