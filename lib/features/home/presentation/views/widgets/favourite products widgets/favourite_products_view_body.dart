import 'package:flutter/material.dart';
import 'package:nectar/core/utils/colors.dart';
import 'package:nectar/core/utils/styles.dart';
import '../../../../../../core/models/cart_item_model.dart';
import 'favourite_list_view.dart';

class FavouriteProductsViewBody extends StatelessWidget {
  const FavouriteProductsViewBody({super.key, required this.cartItems});
  final List<CartItemModel> cartItems;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30, bottom: 30),
          child: Text(
            'My Cart',
            style: Styles.styleTimberGreen20
                .copyWith(color: AppColors.blackRussian),
          ),
        ),
        const Divider(
          height: 1,
          color: AppColors.lightGray,
        ),
        Expanded(
          child: FavouriteProductsListView(
            productItems: cartItems,
          ),
        ),
      ],
    );
  }
}
