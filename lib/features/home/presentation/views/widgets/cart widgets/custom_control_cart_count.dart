import 'package:flutter/material.dart';
import 'package:nectar/core/models/cart_item_model.dart';
import '../../../../../../core/utils/styles.dart';
import 'custom_cart_icon_add.dart';
import 'custom_cart_icon_remove.dart';
import 'custom_cart_price.dart';

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
        const CustomCartIconRemove(),
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
        const CustomCartIconAdd(),
        const Spacer(),
        CustomMyCartPrice(cart: cart)
      ],
    );
  }
}
