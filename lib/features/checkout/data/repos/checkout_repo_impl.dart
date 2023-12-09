import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_payments/core/failures/failure.dart';
import 'package:flutter_payments/core/services/stripe_service.dart';
import 'package:flutter_payments/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:flutter_payments/features/checkout/data/repos/checkout_repo.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  final StripeService stripeService;

  CheckoutRepoImpl({required this.stripeService});
  @override
  Future<Either<Failure, void>> startCheckout(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeService.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);
      print("Error");
      return right(null);
    } catch (e) {
      if (e is DioException) {
        if (e.type == DioExceptionType.connectionError) {
          return left(NetworkFailure(errorMessage: "No internet connection"));
        } else if (e.type == DioExceptionType.badResponse) {
          return left(StripeFailure(
              errorMessage: e.response?.data ?? "Something went wrong"));
        }
      }
      if (e is StripeException) {
        return left(StripeFailure(errorMessage: "STRIPE EXCEPTION"));
      }
      return left(StripeFailure(errorMessage: "Something went wrong"));
    }
  }
}
