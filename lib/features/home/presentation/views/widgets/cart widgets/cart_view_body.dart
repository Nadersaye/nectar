import 'package:animated_digit/animated_digit.dart';
import 'package:flutter/material.dart';
import 'package:nectar/core/utils/colors.dart';
import 'package:nectar/core/utils/styles.dart';
import 'package:nectar/core/widgets/custom_button.dart';
import '../../../../data/models/cart_item_model.dart';
import '../../../../data/models/expansion_tile_model.dart';
import 'animated_dialog.dart';
import 'checkout_body.dart';
import 'custom_cart_listview.dart';
import 'custom_checkout_price.dart';

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
  List<ExpansionTileModel> expansionTileItems = [
    ExpansionTileModel('Delivery', 'Select Method'),
    ExpansionTileModel('Payment', ''),
    ExpansionTileModel('Promo Code', 'Pick Discount'),
    ExpansionTileModel('Total Cost', '\$13.7'),
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Padding(
          padding: const EdgeInsets.only(right: 25, left: 25, bottom: 25),
          child: CartActionButton(
            expansionItems: expansionTileItems,
          ),
        )
      ],
    );
  }

  void placeOrderFunction() {
    //AppRoutes.router.pop();
    /*animatedDialog(
                              context: context,
                              width: MediaQuery.of(context).size.width - 60);*/
    animatedDialog(
        context: context,
        width: MediaQuery.of(context).size.width - 60,
        massege: 'Something went tembly wrong.',
        title: 'Oops! Order Failed',
        text2: 'Try Again',
        animation: 'failure');
  }

  void goToCheckoutFunction({
    required List<ExpansionTileModel> expansionItems,
    required dynamic Function() onTap,
  }) {
    debugPrint('clicked');
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 531,
          width: double.infinity,
          decoration: const BoxDecoration(
              color: AppColors.honeydew,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30))),
          child: CheckoutBody(
            expansionItems: expansionItems,
            onTap: () {},
          ),
        );
      },
    );
  }
}

class CartActionButton extends StatelessWidget {
  const CartActionButton({
    super.key,
    required this.expansionItems,
    required this.onTap,
  });
  final List<ExpansionTileModel> expansionItems;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CustomActionButton(
        buttonText: 'Go to Checkout',
        onTap: onTap,
      ),
      const Positioned(
        right: 22,
        top: 22,
        child: CustomCheckoutPriceText(),
      ),
    ]);
  }
}
