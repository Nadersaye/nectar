import 'package:flutter/material.dart';

import '../../../../../../core/function/convert_data.dart';
import '../../../../../../core/models/cart_item_model.dart';
import '../../../../../../core/widgets/custom_product_total_price_widget.dart';
import '../product details widgets/custom_product_price_widget.dart';

class CustomMyCartPrice extends StatelessWidget {
  const CustomMyCartPrice({
    super.key,
    required this.cart,
  });

  final CartItemModel cart;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomProductPrice(
          product: convertToProduct(cart),
        ),
        const ProductTotalPrice(), /////////////////////
      ],
    );
  }
}
