import 'package:flutter/material.dart';
import '../../../../../../core/widgets/increase_decrease_product_count.dart';
import '../../../../data/models/cart_item_model.dart';
import 'custom_delete_item_widget.dart';

class CartListViewItem extends StatelessWidget {
  const CartListViewItem(
      {super.key, required this.deleteItem, required this.productItem});
  final Function deleteItem;
  final CartItemModel productItem;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                productItem.image,
                width: 70,
                height: 70,
                fit: BoxFit.fill,
              ),
            ),
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
            subTitle: productItem.subTitle,
          ),
          const Spacer(),
          IncreaseAndDecreaseProductCount(
            countController: productItem.countController,
            priceController: productItem.priceController,
            price: productItem.price,
            isOfferProduct: productItem.isOfferProduct,
            offerPrice: productItem.offerPrice,
          ),
        ],
      ),
    );
  }
}
