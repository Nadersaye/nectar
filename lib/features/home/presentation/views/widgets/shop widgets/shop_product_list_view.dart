import 'package:flutter/material.dart';
import 'package:nectar/features/home/presentation/views/widgets/shop%20widgets/custom_product_card.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({super.key, required this.isOffer});
  final bool isOffer;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding:
            const EdgeInsetsDirectional.only(start: 25, top: 10, bottom: 10),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsetsDirectional.only(end: 15),
            child: CustomProductCard(
              isOffer: isOffer,
            ),
          );
        },
      ),
    );
  }
}
