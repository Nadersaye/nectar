import 'package:flutter/material.dart';
import 'package:nectar/core/utils/colors.dart';
import '../../../../data/models/cart_item_model.dart';
import 'custom_listview_item.dart';

class CartListView extends StatefulWidget {
  const CartListView({
    super.key,
    required this.productItems,
  });
  final List<CartItemModel> productItems;
  @override
  State<CartListView> createState() => _CartListViewState();
}

class _CartListViewState extends State<CartListView> {
  @override
  Widget build(BuildContext context) {
    return /*SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return MainCartListViewItem(
              deleteItem: deleteItem, productItem: widget.productItems[index]);
        },
        childCount: widget.productItems.length,
      ),
    );*/

        ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: ((context, index) {
        return CartListViewItem(
            deleteItem: deleteItem, productItem: widget.productItems[index]);
      }),
      itemCount: widget.productItems.length,
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          height: 1,
          indent: 25,
          endIndent: 25,
          color: AppColors.lightGray,
        );
      },
    );
    /* AnimatedList(
        initialItemCount: widget.productItems.length,
        controller: _scrollController,
        key: _listKey,
        itemBuilder: ((context, index, animation) {
          return SlideTransition(
              position: animation.drive(Tween<Offset>(
                  begin: const Offset(1, 0), end: const Offset(0, 0))),
              child: MainCartListViewItem(
                deleteItem: deleteItem,
                productItem: widget.productItems[index],
              ));
        })); */
  }

  void deleteItem(int index) {
    setState(() {
      widget.productItems.removeAt(index);
    });

    /* _listKey.currentState!.removeItem(index, (context, animation) {
      return SizeTransition(
          sizeFactor: animation,
          child: MainCartListViewItem(
            deleteItem: deleteItem,
            productItem: widget.productItems[index],
          ));
    }); */
  }
}

class MainCartListViewItem extends StatelessWidget {
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
}
