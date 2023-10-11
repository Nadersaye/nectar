import 'package:animated_digit/animated_digit.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/widgets/increase_decrease_product_count.dart';
import '../../../../../../core/models/cart_item_model.dart';
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

class ProductCartDetails extends StatefulWidget {
  const ProductCartDetails({
    super.key,
    required this.deleteItem,
    required this.productItem,
  });

  final Function deleteItem;
  final CartItemModel productItem;

  @override
  State<ProductCartDetails> createState() => _ProductCartDetailsState();
}

class _ProductCartDetailsState extends State<ProductCartDetails> {
  late AnimatedDigitController countController;
  late AnimatedDigitController totalController;
  @override
  void initState() {
    countController =
        AnimatedDigitController(widget.productItem.countController);
    totalController =
        AnimatedDigitController(widget.productItem.countController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomDeleteItem(
            deleteItem: widget.deleteItem,
            title: widget.productItem.title,
            subTitle: widget.productItem.subTitle,
          ),
          const Spacer(),
          IncreaseAndDecreaseProductCount(
            countController: countController,
            priceController: totalController,
            price: widget.productItem.price,
            isOfferProduct: widget.productItem.isOfferProduct,
            offerPrice: widget.productItem.offerPrice,
          ),
        ],
      ),
    );
  }
}
