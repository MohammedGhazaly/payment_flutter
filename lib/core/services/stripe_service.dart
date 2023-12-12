import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_payments/core/services/api_keys.dart';
import 'package:flutter_payments/core/services/api_service.dart';
import 'package:flutter_payments/features/checkout/data/models/ephemerial_key_model/ephemerial_key_model.dart';
import 'package:flutter_payments/features/checkout/data/models/init_payment_sheet_input_model.dart';
import 'package:flutter_payments/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:flutter_payments/features/checkout/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  final ApiService apiService;

  StripeService({required this.apiService});

  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiService.post(
        data: paymentIntentInputModel.toJson(),
        contentType: Headers.formUrlEncodedContentType,
        url: "https://api.stripe.com/v1/payment_intents",
        token: ApiKeys.secretKey);
    var paymentModel = PaymentIntentModel.fromJson(response.data);
    return paymentModel;
  }

  Future<void> initPaymentSheet(
      {required InitiPaymentSheetInputModel
          initiPaymentSheetInputModel}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: initiPaymentSheetInputModel.clientSecret,
          customerEphemeralKeySecret:
              initiPaymentSheetInputModel.ephemeralKeySecret,
          customerId: initiPaymentSheetInputModel.customerId,
          merchantDisplayName: "Tharwat",
          style: ThemeMode.dark),
    );
  }

  Future<void> displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future<void> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    PaymentIntentModel paymentIntentModel =
        await createPaymentIntent(paymentIntentInputModel);

    EphemerialKeyModel ephemerialKeyModel = await createEphemerialKey(
        customerId: paymentIntentInputModel.customerId);

    InitiPaymentSheetInputModel initiPaymentSheetInputModel =
        InitiPaymentSheetInputModel(
            customerId: paymentIntentInputModel.customerId,
            clientSecret: paymentIntentModel.clientSecret ?? "",
            ephemeralKeySecret: ephemerialKeyModel.secret ?? "");

    await initPaymentSheet(
        initiPaymentSheetInputModel: initiPaymentSheetInputModel);
    await displayPaymentSheet();
  }

  Future<String> createCustomer() async {
    var response = await apiService.post(
        data: {"name": "tharwat"},
        contentType: Headers.formUrlEncodedContentType,
        url: "https://api.stripe.com/v1/customers",
        token: ApiKeys.secretKey);
    return response.data["id"];
  }

  Future<EphemerialKeyModel> createEphemerialKey(
      {required String customerId}) async {
    var response = await apiService.post(
        headers: {
          "Stripe-Version": "2023-10-16",
          "Authorization":
              "Bearer sk_test_51OLI1XBbSGdL5kba0vwLGkgB130fXoAucRLMegWIZ3nAZHtTOcgco4VtTMGQNsfVu3s32KPq0NA0Eh0pqtpLqSj2005WAXdU4U"
        },
        data: {
          "customer": customerId,
        },
        contentType: Headers.formUrlEncodedContentType,
        url: "https://api.stripe.com/v1/ephemeral_keys",
        token: ApiKeys.secretKey);
    var ephemerialKey = EphemerialKeyModel.fromJson(response.data);
    return ephemerialKey;
  }
}
