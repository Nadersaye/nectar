import 'package:flutter/material.dart';
import '../custom_button.dart';

class PaymentDetailsViewBody extends StatefulWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: CustomButton(
                buttonText: 'Pay',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    setState(() {});
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    /*Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ThankYouView()));*/
                  }
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
