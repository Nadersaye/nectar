import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../../../../../core/models/cart_item_model.dart';
import '../../../manager/manage favourite cubit/manage_favourite_cubit.dart';
import 'favourite_listview_item.dart';

class FavouriteProductsListView extends StatefulWidget {
  const FavouriteProductsListView({super.key, required this.productItems});
  final List<CartItemModel> productItems;
  @override
  State<FavouriteProductsListView> createState() =>
      _FavouriteProductsListViewState();
}

class _FavouriteProductsListViewState extends State<FavouriteProductsListView> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return AnimatedList(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        initialItemCount: widget.productItems.length,
        key: _listKey,
        itemBuilder: ((context, index, animation) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Slidable(
                startActionPane:
                    ActionPane(motion: const BehindMotion(), children: [
                  SlidableAction(
                    onPressed: (context) {},
                    icon: Icons.delete,
                    backgroundColor: Colors.red,
                    label: "Delete",
                  ),
                ]),
                child: customItem(animation, index)),
          );
        }));
  }

  Widget customItem(Animation<double> animation, int index) {
    return Builder(
      builder: (BuildContext context) => SlideTransition(
          position: animation.drive(Tween<Offset>(
              begin: const Offset(1, 0), end: const Offset(0, 0))),
          child: FavouriteProductsListViewItem(
            deleteItem: deleteItem,
            productItem: widget.productItems[index],
            onPressed: () {
              ManageFavouriteCubit.get(context).changeFavourite();
              ManageFavouriteCubit.get(context).manageIconAndColor();
              final slidable = Slidable.of(context);
              final isClosed =
                  slidable?.actionPaneType.value == ActionPaneType.none;
              if (isClosed) {
                slidable?.openStartActionPane();
              } else {
                slidable?.close();
              }
            },
          )),
    );
  }

  /*void addItem() {
    dynamic index = widget.productItems.length;
    items.add('item ${index + 1}');
    _listKey.currentState!.insertItem(index);
    Future.delayed(const Duration(milliseconds: 300), () {
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 100),
          curve: Curves.bounceInOut);
    });
  }*/

  void deleteItem(int index) {
    var itemValue = widget.productItems.removeAt(index);
    _listKey.currentState!.removeItem(index, (context, animation) {
      return SizeTransition(
          sizeFactor: animation,
          child: FavouriteProductsListViewItem(
              deleteItem: deleteItem, productItem: widget.productItems[index]));
    });
  }
}

/*import 'package:flutter/material.dart';
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
}*/

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
