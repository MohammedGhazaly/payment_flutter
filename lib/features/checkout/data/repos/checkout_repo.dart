import 'package:dartz/dartz.dart';
import 'package:flutter_payments/core/failures/failure.dart';
import 'package:flutter_payments/features/checkout/data/models/payment_intent_input_model.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, void>> startCheckout(
      {required PaymentIntentInputModel paymentIntentInputModel});
}
