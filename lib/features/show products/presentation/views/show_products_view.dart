import 'package:flutter/material.dart';
import 'package:nectar/core/utils/colors.dart';
import 'package:nectar/core/utils/styles.dart';

import '../../../../core/models/cart_item_model.dart';
import 'widgets/show_products_view_body.dart';

class ShowProductsView extends StatelessWidget {
  const ShowProductsView(
      {super.key, required this.productsItems, required this.categoryName});
  final List<CartItemModel> productsItems;
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            categoryName,
            style: Styles.styleTimberGreen20
                .copyWith(color: AppColors.blackRussian),
          ),
          centerTitle: true,
          actions: const [],
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: ShowProductsViewBody(
            productsItems: productsItems,
          ),
        ),
      ),
    );
  }
}
