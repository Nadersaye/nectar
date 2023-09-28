import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nectar/core/utils/colors.dart';

import '../product details widgets/custom_appbar_icon.dart';
import '../product details widgets/product_details_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.honeydew,
          elevation: 0,
          actions: [
            CustomIcon(
              icon: const Icon(
                FontAwesomeIcons.arrowUpFromBracket,
                color: AppColors.blackRussian,
              ),
            )
          ],
          leading: CustomIcon(
            icon: const Icon(
              FontAwesomeIcons.angleLeft,
              color: AppColors.blackRussian,
            ),
          )),
      body: const ProductDetailsBody(),
    );
  }
}
