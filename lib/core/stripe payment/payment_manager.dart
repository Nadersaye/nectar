import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:nectar/core/stripe%20payment/stripe_keys.dart';

abstract class StripePaymentManager {
  static bool isSucceeded = false;
  static Future makePayment(int amount, String currency) async {
    try {
      String clientSecret =
          await _getClientSecret((amount * 100).toString(), currency);
      await _initialPaymentSheet(clientSecret);
      Stripe.instance.presentPaymentSheet();
      isSucceeded = true;
    } catch (error) {
      isSucceeded = false;
      throw Exception(error.toString());
    }
  }

  static Future _initialPaymentSheet(String clientSecret) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: clientSecret,
            merchantDisplayName: 'nectar'));
  }

  static Future<String> _getClientSecret(String amount, String currency) async {
    Dio dio = Dio();
    var response = await dio.post('https://api.stripe.com/v1/payment_intents',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${StripeKeys.secretkey}',
            'Content-Type': 'application/x-www-form-urlencoded',
          },
        ),
        data: {
          'amount': amount,
          'currency': currency,
        });
    return response.data['client_secret'];
  }
}
