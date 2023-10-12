import 'package:animated_digit/animated_digit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/core/utils/colors.dart';
import 'package:nectar/core/utils/styles.dart';
import '../../../../../../core/models/cart_item_model.dart';
import '../product details widgets/custom_appbar_icon.dart';

class FavouriteProductsListViewItem extends StatefulWidget {
  const FavouriteProductsListViewItem(
      {super.key, required this.deleteItem, required this.productItem});
  final Function deleteItem;
  final CartItemModel productItem;

  @override
  State<FavouriteProductsListViewItem> createState() =>
      _FavouriteProductsListViewItemState();
}

class _FavouriteProductsListViewItemState
    extends State<FavouriteProductsListViewItem> {
  bool changedIcon = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 114,
      width: MediaQuery.of(context).size.width,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child: ListTile(
            isThreeLine: true,
            titleAlignment: ListTileTitleAlignment.top,
            leading: Image.asset(
              widget.productItem.image,
              width: 70,
              height: 70,
              fit: BoxFit.contain,
            ),
            title: Text(
              widget.productItem.title,
              style: Styles.styleMagnoliaWhite16.copyWith(
                  color: AppColors.blackRussian, fontWeight: FontWeight.w700),
            ),
            subtitle: Text(
              widget.productItem.subTitle,
              style: Styles.styleGrey14,
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: FractionalOffset.centerLeft,
                  child: Text(
                    '\$' '${widget.productItem.price}',
                    style: Styles.styleMagnoliaWhite16.copyWith(
                        color: AppColors.blackRussian,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                CustomIcon(
                  onPressed: () {
                    setState(() {
                      changedIcon = !changedIcon;
                    });
                  },
                  icon: Icon(
                    changeIcon(changedIcon),
                    size: 25.r,
                  ),
                  iconColor: changeIconColor(),
                ),
              ],
            ),
            contentPadding: EdgeInsets.zero,
          )

          /*Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                productItem.image,
                width: 70,
                height: 70,
                fit: BoxFit.contain,
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
        ),*/
          ),
    );
  }

  IconData changeIcon(bool changedIcon) {
    return changedIcon ? Icons.favorite : Icons.favorite_border_outlined;
  }

  Color changeIconColor() {
    return changedIcon ? Colors.red : AppColors.grey;
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
  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Spacer(),
        ],
      ),
    );
  }
}
