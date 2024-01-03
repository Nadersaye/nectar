import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../manager/get carts cubit/get_carts_cubit.dart';
import 'custom_checkout_price.dart';

class CartActionButton extends StatelessWidget {
  const CartActionButton({
    super.key,
    required this.gotToCheckoutonTap,
  });
  final Function() gotToCheckoutonTap;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCartsCubit, GetCartsState>(
      builder: (context, state) {
        return AnimatedOpacity(
          opacity: gCarts!.isNotEmpty ? 1 : .2,
          duration: const Duration(milliseconds: 300),
          child: Stack(children: [
            CustomActionButton(
              buttonText: 'Go to Checkout',
              onTap: gotToCheckoutonTap,
            ),
            const Positioned(
              right: 22,
              top: 22,
              child: CustomCheckoutPriceText(),
            ),
          ]),
        );
      },
    );
  }
}
