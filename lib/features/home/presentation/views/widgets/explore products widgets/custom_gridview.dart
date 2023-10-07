import 'package:flutter/material.dart';

class CustomexploreProductGridView extends StatelessWidget {
  const CustomexploreProductGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          childAspectRatio: 175 / 189,
          mainAxisSpacing: 15),
      itemBuilder: (BuildContext context, int index) {
        return GridViewItem();
      },
    );
  }
}
