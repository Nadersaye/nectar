import 'package:animated_digit/animated_digit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/core/utils/colors.dart';
import 'package:nectar/core/utils/styles.dart';
import 'package:nectar/features/home/presentation/manager/manage%20favourite%20cubit/manage_favourite_cubit.dart';
import '../../../../../../core/models/cart_item_model.dart';
import '../product details widgets/custom_appbar_icon.dart';

class FavouriteProductsListViewItem extends StatefulWidget {
  const FavouriteProductsListViewItem({
    super.key,
    required this.deleteItem,
    required this.productItem,
    this.onPressed,
  });
  final Function deleteItem;
  final CartItemModel productItem;
  final dynamic Function()? onPressed;
  @override
  State<FavouriteProductsListViewItem> createState() =>
      _FavouriteProductsListViewItemState();
}

class _FavouriteProductsListViewItemState
    extends State<FavouriteProductsListViewItem> {
  @override
  void initState() {
    ManageFavouriteCubit.get(context).manageIconAndColor();
    super.initState();
  }

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
                BlocBuilder<ManageFavouriteCubit, ManageFavouriteState>(
                  builder: (context, state) {
                    var favouriteCubit = ManageFavouriteCubit.get(context);
                    return CustomIcon(
                      onPressed: widget.onPressed,
                      icon: Icon(
                        favouriteCubit.icon,
                        size: 25.r,
                      ),
                      iconColor: favouriteCubit.color,
                    );
                  },
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
