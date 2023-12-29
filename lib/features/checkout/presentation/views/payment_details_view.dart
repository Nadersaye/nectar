import 'package:flutter/material.dart';
import 'widgets/custom_appbar.dart';
import 'widgets/payment details widgets/payment_details_view_body.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context: context, appbarTitle: 'Payment Details'),
      body: const PaymentDetailsViewBody(),
    );
  }
}
