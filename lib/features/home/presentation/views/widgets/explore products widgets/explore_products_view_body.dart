import 'package:flutter/material.dart';
import 'package:nectar/core/utils/colors.dart';
import 'package:nectar/core/widgets/custom_textformfield.dart';

import '../../../../../../core/utils/styles.dart';
import 'custom_gridview.dart';

class ExploreProductsViewBody extends StatelessWidget {
  const ExploreProductsViewBody({super.key, required this.searchController});
  final TextEditingController searchController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30, bottom: 30),
          child: Text(
            'Find Categories',
            style: Styles.styleTimberGreen20
                .copyWith(color: AppColors.blackRussian),
          ),
        ),
        CustomTextFormField(
            searchController: searchController,
            onChanged: (String test) {
              debugPrint(test);
            }),
        const CustomexploreProductGridView()
      ],
    );
  }
}
