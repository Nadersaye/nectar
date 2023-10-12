import 'package:flutter/material.dart';
import 'package:nectar/core/utils/colors.dart';
import 'package:nectar/core/utils/styles.dart';
import '../../../../../../core/models/cart_item_model.dart';
import 'favourite_list_view.dart';

class FavouriteProductsViewBody extends StatefulWidget {
  const FavouriteProductsViewBody({super.key});

  @override
  State<FavouriteProductsViewBody> createState() =>
      _FavouriteProductsViewBodyState();
}

class _FavouriteProductsViewBodyState extends State<FavouriteProductsViewBody> {
  List<CartItemModel> productItems = [
    CartItemModel(
        7.35, 7, 'assets/images/apple.png', 'apple', '2 kg ,price', true, 0, 0),
    CartItemModel(2.35, 2, 'assets/images/apple2.png', 'apple', '.5 kg ,price',
        true, 0, 0),
    CartItemModel(3.35, 3, 'assets/images/apple3.png', 'apple', '1 kg ,price',
        true, 0, 0),
    CartItemModel(
        2.35, 2, 'assets/images/apple.png', 'apple', '3 kg ,price', true, 0, 0),
    CartItemModel(2.35, 2, 'assets/images/apple2.png', 'apple', '1 kg ,price',
        true, 0, 0),
    CartItemModel(12.75, 11, 'assets/images/apple3.png', 'apple', '4 kg ,price',
        true, 0, 0),
    CartItemModel(
        2.35, 2, 'assets/images/apple.png', 'apple', '1 kg ,price', true, 0, 0),
    CartItemModel(15.35, 13, 'assets/images/apple.png', 'apple', '5 kg ,price',
        true, 0, 0),
    CartItemModel(
        2.35, 2, 'assets/images/apple.png', 'apple', '1 kg ,price', true, 0, 0),
    CartItemModel(30.35, 25, 'assets/images/apple2.png', 'apple', '7 kg ,price',
        true, 0, 0),
  ];
  @override
  void initState() {
    super.initState();
  }

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
            productItems: productItems,
          ),
        ),
      ],
    );
  }
}
