import 'package:flutter/material.dart';
import 'package:nectar/core/utils/colors.dart';
import 'package:nectar/core/utils/styles.dart';

import 'widgets/show_products_view_body.dart';

class ShowProductsView extends StatelessWidget {
  const ShowProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '',
            style: Styles.styleTimberGreen20
                .copyWith(color: AppColors.blackRussian),
          ),
          centerTitle: true,
          actions: const [],
        ),
        body: const ShowProductsViewBody(),
      ),
    );
  }
}
