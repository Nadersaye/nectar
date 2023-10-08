import 'package:flutter/material.dart';
import 'package:nectar/features/home/data/models/category_model.dart';
import 'custom_gridview_item.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({super.key, required this.categoriesItems});
  final List<CategoryModel> categoriesItems;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: categoriesItems.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          childAspectRatio: 175 / 189,
          mainAxisSpacing: 15),
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
          width: MediaQuery.of(context).size.width / 2 - 32.5,
          child: GridViewItem(
            categoryItem: categoriesItems[index],
          ),
        );
      },
    );
  }
}
