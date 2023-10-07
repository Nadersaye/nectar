import 'package:flutter/material.dart';
import 'package:nectar/core/utils/colors.dart';
import 'package:nectar/core/utils/styles.dart';

import '../../../../data/models/category_model.dart';

class GridviewItemBody extends StatelessWidget {
  const GridviewItemBody({
    super.key,
    required this.categoryItem,
  });
  final CategoryModel categoryItem;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          'assets/images/${categoryItem.image}.jpg',
          height: MediaQuery.of(context).size.height / 2 - 15,
          fit: BoxFit.contain,
        ),
        Text(
          categoryItem.categoryName,
          style: Styles.styleMagnoliaWhite16.copyWith(
              color: AppColors.blackRussian, fontWeight: FontWeight.w700),
        )
      ],
    );
  }
}
