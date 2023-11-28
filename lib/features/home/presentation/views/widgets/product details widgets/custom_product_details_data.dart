import 'package:flutter/material.dart';
import '../../../../../../core/widgets/custom_button.dart';
import 'custom_control_product_count.dart';
import 'custom_nutritions_tile.dart';
import 'custom_product_detail_tile.dart';
import 'custom_review_tile.dart';
import 'product_details_body.dart';

class CustomProductDetailsData extends StatelessWidget {
  const CustomProductDetailsData({
    super.key,
    required this.widget,
  });

  final ProductDetailsBody widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
      child: SizedBox(
        width: double.infinity,
        child: CustomProductDetailsDataContent(widget: widget),
      ),
    );
  }
}

class CustomProductDetailsDataContent extends StatelessWidget {
  const CustomProductDetailsDataContent({
    super.key,
    required this.widget,
  });

  final ProductDetailsBody widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30,
        ),
        CustomControlProductCount(
          product: widget.product,
        ),
        const SizedBox(
          height: 30,
        ),
        CustomProductDetailTile(widget: widget),
        CustomNutritionsTile(widget: widget),
        CustomReviewTile(widget: widget),
        const SizedBox(
          height: 10,
        ),
        const CustomActionButton(
          buttonText: 'Add To Basket',
        )
      ],
    );
  }
}
