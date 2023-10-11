import 'package:flutter/material.dart';
import 'package:nectar/core/utils/colors.dart';
import 'package:nectar/core/utils/styles.dart';
import '../../../../../../core/stripe payment/payment_manager.dart';
import '../../../../../../core/models/cart_item_model.dart';
import '../../../../data/models/expansion_tile_model.dart';
import 'animated_dialog.dart';
import 'cart_action_button.dart';
import 'checkout_body.dart';
import 'custom_cart_listview.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody({super.key});

  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  List<CartItemModel> productItems = [
    CartItemModel(
        7.35, 7, 'assets/images/apple.png', 'apple', '2 kg ,price', true, 0, 0),
    CartItemModel(2.35, 2, 'assets/images/apple2.png', 'apple', '.5 kg ,price',
        true, 0, 0),
    CartItemModel(3.35, 3, 'assets/images/apple3.png', 'apple', '1 kg ,price',
        true, 0, 0),
    CartItemModel(
        2.35, 2, 'assets/images/apple.png', 'apple', '3 kg ,price', true, 0, 0),
    CartItemModel(2.35, 2, 'assets/images/apple2.png', 'apple', '1 kg ,price',
        true, 0, 0),
    CartItemModel(12.75, 11, 'assets/images/apple3.png', 'apple', '4 kg ,price',
        true, 0, 0),
    CartItemModel(
        2.35, 2, 'assets/images/apple.png', 'apple', '1 kg ,price', true, 0, 0),
    CartItemModel(15.35, 13, 'assets/images/apple.png', 'apple', '5 kg ,price',
        true, 0, 0),
    CartItemModel(
        2.35, 2, 'assets/images/apple.png', 'apple', '1 kg ,price', true, 0, 0),
    CartItemModel(30.35, 25, 'assets/images/apple2.png', 'apple', '7 kg ,price',
        true, 0, 0),
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
              gotToCheckoutonTap: () {
                goToCheckoutFunction(
                  expansionItems: expansionTileItems,
                  onTap: () {},
                );
              }),
        )
      ],
    );
  }

  Future<void> placeOrderFunction() async {
    await StripePaymentManager.makePayment(100, 'USD');
    if (StripePaymentManager.isSucceeded == true) {
      // ignore: use_build_context_synchronously
      animatedDialog(
          // ignore: use_build_context_synchronously
          context: context,
          width: MediaQuery.of(context).size.width - 60);
      AwesomeNotifications().createNotification(
          content: NotificationContent(
              id: 0,
              channelKey: 'nectar',
              title: 'Successful order',
              body:
                  'Congratulation !, your order create successfully and it will sended to you in an hour'));
    } else {
      // ignore: use_build_context_synchronously
      animatedDialog(
          context: context,
          // ignore: use_build_context_synchronously
          width: MediaQuery.of(context).size.width - 60,
          massege: 'Something went tembly wrong.',
          title: 'Oops! Order Failed',
          text2: 'Try Again',
          animation: 'failure');
    }
    //AppRoutes.router.pop();
    /*animatedDialog(
        context: context, width: MediaQuery.of(context).size.width - 60);
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 0,
            channelKey: 'nectar',
            title: 'Successful order',
            body:
                'Congratulation !, your order create successfully and it will sended to you in an hour'));*/
    /*animatedDialog(
        context: context,
        width: MediaQuery.of(context).size.width - 60,
        massege: 'Something went tembly wrong.',
        title: 'Oops! Order Failed',
        text2: 'Try Again',
        animation: 'failure');*/
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
            placeOrderOnTap: () {
              placeOrderFunction();
            },
          ),
        );
      },
    );
  }
}
