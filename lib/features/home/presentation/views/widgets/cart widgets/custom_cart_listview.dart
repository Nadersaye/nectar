import 'package:animated_digit/animated_digit.dart';
import 'package:flutter/material.dart';
import 'package:nectar/core/utils/colors.dart';

import 'custom_listview_item.dart';

class CartListView extends StatefulWidget {
  const CartListView(
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
  State<CartListView> createState() => _CartListViewState();
}

class _CartListViewState extends State<CartListView> {
  final List items = [];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return AnimatedList(
        controller: _scrollController,
        key: _listKey,
        itemBuilder: ((context, index, animation) {
          return SlideTransition(
              position: animation.drive(Tween<Offset>(
                  begin: const Offset(1, 0), end: const Offset(0, 0))),
              child: MainCartListViewItem(
                deleteItem: widget.deleteItem,
                countController: widget.countController,
                priceController: widget.priceController,
                price: widget.price,
                isOfferProduct: widget.isOfferProduct,
                offerPrice: widget.offerPrice,
              ));
        }));
  }

  void deleteItem(int index) {
    _listKey.currentState!.removeItem(index, (context, animation) {
      return SizeTransition(
          sizeFactor: animation,
          child: MainCartListViewItem(
              deleteItem: deleteItem,
              countController: widget.countController,
              priceController: widget.priceController,
              price: widget.price,
              isOfferProduct: widget.isOfferProduct,
              offerPrice: widget.offerPrice));
    });
  }
}

class MainCartListViewItem extends StatelessWidget {
  const MainCartListViewItem({
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
      children: [
        CartListViewItem(
          deleteItem: deleteItem,
          countController: countController,
          priceController: priceController,
          price: price,
          isOfferProduct: isOfferProduct,
          offerPrice: offerPrice,
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
