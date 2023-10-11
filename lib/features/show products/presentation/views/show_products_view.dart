import 'package:flutter/material.dart';
import 'package:nectar/core/utils/colors.dart';
import 'package:nectar/core/utils/styles.dart';

import '../../../../core/models/cart_item_model.dart';
import 'widgets/show_products_view_body.dart';

class ShowProductsView extends StatefulWidget {
  const ShowProductsView({
    super.key,
  });

  @override
  State<ShowProductsView> createState() => _ShowProductsViewState();
}

class _ShowProductsViewState extends State<ShowProductsView> {
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
  //final List<CartItemModel> productsItems;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Beverages',
            style: Styles.styleTimberGreen20
                .copyWith(color: AppColors.blackRussian),
          ),
          centerTitle: true,
          actions: const [],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: ShowProductsViewBody(
            productsItems: productItems,
          ),
        ),
      ),
    );
  }
}
