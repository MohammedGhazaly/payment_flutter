import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_payments/core/failures/failure.dart';
import 'package:flutter_payments/core/services/stripe_service.dart';
import 'package:flutter_payments/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:flutter_payments/features/checkout/data/repos/checkout_repo.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  StripeService stripeService = StripeService();
  @override
  Future<Either<Failure, void>> startCheckout(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeService.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);
      return right(null);
    } on Exception catch (e) {
      if (e is DioException) {
        if (e.type == DioExceptionType.connectionTimeout) {
          return left(NetworkFailure(errorMessage: "No internet connection"));
        } else if (e.type == DioExceptionType.badResponse) {
          return left(StripeFailure(
              errorMessage: e.response?.data ?? "Something went wrong"));
        }
      }
      return left(StripeFailure(errorMessage: "Something went wrong"));
    }
  }
}
