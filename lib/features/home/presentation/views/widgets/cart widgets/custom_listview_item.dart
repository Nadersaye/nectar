import 'package:animated_digit/animated_digit.dart';
import 'package:flutter/material.dart';
import 'package:nectar/core/utils/assets.dart';
import '../../../../../../core/widgets/increase_decrease_product_count.dart';
import 'custom_delete_item_widget.dart';

class CartListViewItem extends StatelessWidget {
  const CartListViewItem(
      {super.key,
      required this.deleteItem,
      required this.countController,
      required this.priceController,
      required this.price,
      required this.isOfferProduct,
      required this.offerPrice});
  final Function deleteItem;
  final AnimatedDigitController countController;
  final AnimatedDigitController priceController;
  final double price;
  final bool isOfferProduct;
  final double offerPrice;
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
          ProductCartDetails(
              deleteItem: deleteItem,
              countController: countController,
              priceController: priceController,
              price: price,
              isOfferProduct: isOfferProduct,
              offerPrice: offerPrice),
        ],
      ),
    );
  }
}

class ProductCartDetails extends StatelessWidget {
  const ProductCartDetails({
    super.key,
    required this.deleteItem,
    required this.countController,
    required this.priceController,
    required this.price,
    required this.isOfferProduct,
    required this.offerPrice,
  });

  final Function deleteItem;
  final AnimatedDigitController countController;
  final AnimatedDigitController priceController;
  final double price;
  final bool isOfferProduct;
  final double offerPrice;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomDeleteItem(
          deleteItem: deleteItem,
        ),
        IncreaseAndDecreaseProductCount(
          countController: countController,
          priceController: priceController,
          price: price,
          isOfferProduct: isOfferProduct,
          offerPrice: offerPrice,
        ),
      ],
    );
  }
}
