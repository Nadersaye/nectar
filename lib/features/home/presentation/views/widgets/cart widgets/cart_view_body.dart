import 'package:animated_digit/animated_digit.dart';
import 'package:flutter/material.dart';
import 'package:nectar/core/utils/app_routes.dart';
import 'package:nectar/core/utils/colors.dart';
import 'package:nectar/core/utils/styles.dart';
import 'package:nectar/core/widgets/custom_button.dart';
import '../../../../data/models/cart_item_model.dart';
import '../product details widgets/custom_appbar_icon.dart';
import 'custom_cart_listview.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody({super.key});

  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  List<CartItemModel> productItems = [
    CartItemModel(7.35, 7, 'assets/images/apple.png', 'apple', '2 kg ,price',
        true, AnimatedDigitController(1), AnimatedDigitController(7.37)),
    CartItemModel(2.35, 2, 'assets/images/apple2.png', 'apple', '.5 kg ,price',
        true, AnimatedDigitController(1), AnimatedDigitController(7.37)),
    CartItemModel(3.35, 3, 'assets/images/apple3.png', 'apple', '1 kg ,price',
        true, AnimatedDigitController(1), AnimatedDigitController(7.37)),
    CartItemModel(2.35, 2, 'assets/images/apple.png', 'apple', '3 kg ,price',
        true, AnimatedDigitController(1), AnimatedDigitController(7.37)),
    CartItemModel(2.35, 2, 'assets/images/apple2.png', 'apple', '1 kg ,price',
        true, AnimatedDigitController(1), AnimatedDigitController(7.37)),
    CartItemModel(12.75, 11, 'assets/images/apple3.png', 'apple', '4 kg ,price',
        true, AnimatedDigitController(1), AnimatedDigitController(7.37)),
    CartItemModel(2.35, 2, 'assets/images/apple.png', 'apple', '1 kg ,price',
        true, AnimatedDigitController(1), AnimatedDigitController(7.37)),
    CartItemModel(15.35, 13, 'assets/images/apple.png', 'apple', '5 kg ,price',
        true, AnimatedDigitController(1), AnimatedDigitController(7.37)),
    CartItemModel(2.35, 2, 'assets/images/apple.png', 'apple', '1 kg ,price',
        true, AnimatedDigitController(1), AnimatedDigitController(7.37)),
    CartItemModel(30.35, 25, 'assets/images/apple2.png', 'apple', '7 kg ,price',
        true, AnimatedDigitController(1), AnimatedDigitController(7.37)),
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
        /*CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          title: Text(
            'My Cart',
            style: Styles.styleTimberGreen20
                .copyWith(color: AppColors.blackRussian),
          ),
          centerTitle: true,
          pinned: true,
          leading: const SizedBox(),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        const SliverToBoxAdapter(
          child: Divider(
            height: 1,
            color: AppColors.lightGray,
          ),
        ),
        CartListView(
          productItems: productItems,
        ),
      ],
      
    );*/
        Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30, bottom: 30),
          child: Text(
            'My Cart',
            style: Styles.styleTimberGreen20
                .copyWith(color: AppColors.blackRussian),
          ),
        ),
        const Divider(
          height: 1,
          color: AppColors.lightGray,
        ),
        Expanded(
          child: CartListView(
            productItems: productItems,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(right: 25, left: 25, bottom: 25),
          child: CartActionButton(),
        )
      ],
    );
  }
}

class CartActionButton extends StatelessWidget {
  const CartActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CustomActionButton(
        buttonText: 'Go to Checkout',
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                height: 531,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: AppColors.honeydew,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30))),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [CheckOutAppBar()],
                ),
              );
            },
          );
        },
      ),
      Positioned(
        right: 22,
        top: 22,
        child: Container(
          height: 22,
          width: 43,
          decoration: BoxDecoration(
              color: AppColors.deepGreen,
              borderRadius: BorderRadius.circular(4)),
          child: Center(
            child: Text(
              '\$12.5',
              style: Styles.styleblackRussian12.copyWith(color: AppColors.snow),
            ),
          ),
        ),
      ),
    ]);
  }
}

class CheckOutAppBar extends StatelessWidget {
  const CheckOutAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Checkout',
          style: Styles.stylebBackRussian24,
        ),
        const Spacer(),
        CustomIcon(
          icon: const Icon(
            Icons.close,
            size: 17,
            color: AppColors.blackRussian,
          ),
          onPressed: () {
            AppRoutes.router.pop();
          },
        ),
      ],
    );
  }
}
