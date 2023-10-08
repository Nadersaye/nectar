import 'package:flutter/material.dart';

class CustomProductsGridview extends StatelessWidget {
  const CustomProductsGridview({super.key, required this.productsItems});
  final List productsItems;
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 20,
    );
    /*GridView.builder(
      itemCount: categoriesItems.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          childAspectRatio: 175 / 250,
          mainAxisSpacing: 15),
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
          width: MediaQuery.of(context).size.width / 2 - 32.5,
          child: GridViewItem(
            categoryItem: categoriesItems[index],
          ),
        );
      },
    );*/
  }
}
