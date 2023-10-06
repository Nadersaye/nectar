import 'package:flutter/material.dart';

import '../../../../../../core/widgets/custom_button.dart';
import '../../../../data/models/expansion_tile_model.dart';
import 'custom_checkout_price.dart';

class CartActionButton extends StatelessWidget {
  const CartActionButton({
    super.key,
    required this.expansionItems,
    required this.gotToCheckoutonTap,
  });
  final List<ExpansionTileModel> expansionItems;
  final Function() gotToCheckoutonTap;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CustomActionButton(
        buttonText: 'Go to Checkout',
        onTap: gotToCheckoutonTap,
      ),
      const Positioned(
        right: 22,
        top: 22,
        child: CustomCheckoutPriceText(),
      ),
    ]);
  }
}
