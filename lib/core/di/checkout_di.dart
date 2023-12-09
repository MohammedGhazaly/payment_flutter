import 'package:flutter_payments/core/services/api_service.dart';
import 'package:flutter_payments/core/services/stripe_service.dart';
import 'package:flutter_payments/features/checkout/data/repos/checkout_repo.dart';
import 'package:flutter_payments/features/checkout/data/repos/checkout_repo_impl.dart';

StripeService injectStripeService() {
  return StripeService(apiService: ApiService.getInstance());
}

CheckoutRepo injectCheckOutRepo() {
  return CheckoutRepoImpl(stripeService: injectStripeService());
}
