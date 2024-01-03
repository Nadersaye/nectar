import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../../core/models/cart_item_model.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../home/presentation/manager/count total order cubit/count_total_order_cubit.dart';
import '../../../manager/delete cart cubit/delete_cart_cubit.dart';
import '../../../manager/get carts cubit/get_carts_cubit.dart';

class CustomCheckoutPriceText extends StatefulWidget {
  const CustomCheckoutPriceText({
    super.key,
  });

  @override
  State<CustomCheckoutPriceText> createState() =>
      _CustomCheckoutPriceTextState();
}

class _CustomCheckoutPriceTextState extends State<CustomCheckoutPriceText> {
  List<CartItemModel> dCarts = [];
  String userId = '';
  num total = 0;
  getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String id = sharedPreferences.getString("id")!;
    userId = id;
    // ignore: use_build_context_synchronously
    BlocProvider.of<GetCartsCubit>(context).getCarts(userId: userId);
  }

  changeTotal() {
    BlocProvider.of<CountTotalOrderCubit>(context).cartItems = dCarts;
    BlocProvider.of<CountTotalOrderCubit>(context).generalTotalPrice = total;
    BlocProvider.of<CountTotalOrderCubit>(context).countTotal();
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteCartCubit, DeleteCartState>(
      listener: (context, state) {
        if (state is DeleteCartSuccess) {
          BlocProvider.of<GetCartsCubit>(context).getCarts(userId: userId);
        }
      },
      child: BlocListener<GetCartsCubit, GetCartsState>(
        listener: (context, state) {
          if (state is GetCartsSuccess) {
            dCarts = state.carts;
            changeTotal();
          }
        },
        child: Container(
          height: 22,
          width: 43,
          decoration: BoxDecoration(
              color: AppColors.deepGreen,
              borderRadius: BorderRadius.circular(4)),
          child: BlocBuilder<CountTotalOrderCubit, CountTotalOrderState>(
            builder: (context, state) {
              return Center(
                child: Text(
                  '\$ '
                  '${BlocProvider.of<CountTotalOrderCubit>(context).generalTotalPrice}',
                  style: Styles.styleblackRussian12
                      .copyWith(color: AppColors.snow),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
