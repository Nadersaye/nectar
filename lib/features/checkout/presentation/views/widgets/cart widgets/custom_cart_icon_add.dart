import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/core/models/cart_item_model.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../../home/presentation/views/widgets/product details widgets/custom_appbar_icon.dart';
import '../../../manager/edit cart cubit/edit_cart_cubit.dart';
import '../../../manager/get carts cubit/get_carts_cubit.dart';

class CustomCartIconAdd extends StatefulWidget {
  const CustomCartIconAdd({
    super.key,
    required this.cart,
  });
  final CartItemModel cart;
  @override
  State<CustomCartIconAdd> createState() => _CustomCartIconAddState();
}

class _CustomCartIconAddState extends State<CustomCartIconAdd> {
  num? myQuantatity;
  num? total;
  @override
  void initState() {
    myQuantatity = widget.cart.count!;
    total = widget.cart.totalPrice;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 46.w,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.lightGray),
          borderRadius: BorderRadius.circular(17.r)),
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: CustomIcon(
            icon: const Icon(
              Icons.add,
              color: AppColors.oceanGreen,
              size: 23,
            ),
            onPressed: () async {
              myQuantatity = myQuantatity! + 1;
              total = (total! + widget.cart.totalPrice!);
              await BlocProvider.of<EditCartCubit>(context).editCart(
                  cart: widget.cart,
                  userId: widget.cart.userId,
                  count: myQuantatity,
                  totalPrice: total);
              await BlocProvider.of<GetCartsCubit>(context)
                  .getCarts(userId: widget.cart.userId);
            }),
      ),
    );
  }
}
