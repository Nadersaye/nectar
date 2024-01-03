import 'package:flutter/material.dart';
import 'package:nectar/core/function/cache_network_image.dart';
import '../../../../../../core/models/cart_item_model.dart';
import 'custom_control_cart_count.dart';
import 'custom_delete_item_widget.dart';

class CartListViewItem extends StatelessWidget {
  const CartListViewItem(
      {super.key, required this.deleteItem, required this.productItem});
  final Function deleteItem;
  final CartItemModel productItem;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment.center,
                child: cachedMyNetworkImage(
                    imageUrl: productItem.imageUrl,
                    height: 70,
                    width: 70,
                    fit: BoxFit.fitHeight)),
            const SizedBox(
              width: 20,
            ),
            ProductCartDetails(
              deleteItem: deleteItem,
              productItem: productItem,
            )
          ],
        ),
      ),
    );
  }
}

class ProductCartDetails extends StatelessWidget {
  const ProductCartDetails({
    super.key,
    required this.deleteItem,
    required this.productItem,
  });

  final Function deleteItem;
  final CartItemModel productItem;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomDeleteItem(
            deleteItem: deleteItem,
            title: productItem.title,
            type: productItem.type,
            size: productItem.size,
          ),
          const Spacer(),
          CustomControlCartCount(cart: productItem)
        ],
      ),
    );
  }
}
