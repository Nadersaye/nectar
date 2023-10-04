import 'package:flutter/material.dart';
import 'package:nectar/core/utils/assets.dart';

import '../../../../../../core/widgets/custom_product_title_subtitle.dart';

class CartListViewItem extends StatelessWidget {
  const CartListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            testImage,
            width: 70,
            height: 70,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            width: 20,
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomProductTitleAndSubtitle(),
            ],
          )
        ],
      ),
    );
  }
}
