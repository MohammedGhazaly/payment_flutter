import 'package:flutter_payments/core/services/api_keys.dart';
import 'package:flutter_payments/core/services/api_service.dart';
import 'package:flutter_payments/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:flutter_payments/features/checkout/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  ApiService apiService = ApiService();

  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiService.post(
        data: paymentIntentInputModel.toJson(),
        url: "https://api.stripe.com/v1/payment_intents",
        token: ApiKeys.secretKey);
    var paymentModel = PaymentIntentModel.fromJson(response.data);
    return paymentModel;
  }

  Future<void> initPaymentSheet(
      {required String paymentIntentClientSecret}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentClientSecret,
          merchantDisplayName: "Tharwat"),
    );
  }
}
