import 'package:flutter/material.dart';
import '../../../../../../core/widgets/custom_divider.dart';
import '../../../../../../core/models/cart_item_model.dart';
import 'favourite_listview_item.dart';

class FavouriteProductsListView extends StatefulWidget {
  const FavouriteProductsListView({
    super.key,
    required this.productItems,
  });
  final List<CartItemModel> productItems;
  @override
  State<FavouriteProductsListView> createState() =>
      _FavouriteProductsListViewState();
}

class _FavouriteProductsListViewState extends State<FavouriteProductsListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: ((context, index) {
        return FavouriteProductsListViewItem(
            deleteItem: deleteItem, productItem: widget.productItems[index]);
      }),
      itemCount: widget.productItems.length,
      separatorBuilder: (BuildContext context, int index) {
        return const CustomDivider();
      },
    );
  }

  void deleteItem(int index) {
    setState(() {
      widget.productItems.removeAt(index);
    });
  }
}

/*class MainCartListViewItem extends StatelessWidget {
  const MainCartListViewItem({
    super.key,
    required this.deleteItem,
    required this.productItem,
  });

  final Function deleteItem;
  final CartItemModel productItem;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CartListViewItem(
          deleteItem: deleteItem,
          productItem: productItem,
        ),
        const Divider(
          height: 1,
          indent: 25,
          endIndent: 25,
          color: AppColors.lightGray,
        )
      ],
    );
  }
}*/
