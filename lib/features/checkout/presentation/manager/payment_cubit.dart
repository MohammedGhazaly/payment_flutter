import 'package:bloc/bloc.dart';
import 'package:flutter_payments/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:flutter_payments/features/checkout/data/repos/checkout_repo.dart';
import 'package:flutter_payments/features/checkout/presentation/manager/payment_states.dart';

class PaymentCubit extends Cubit<PaymentStates> {
  PaymentCubit(this.checkoutRepo) : super(PaymentInitial());
  final CheckoutRepo checkoutRepo;
  Future<void> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var data = await checkoutRepo.startCheckout(
        paymentIntentInputModel: paymentIntentInputModel);
    data.fold((l) {
      emit(PaymentFailure(errorMessage: l.errorMessage));
    }, (r) {
      emit(PaymentSuccess());
    });
  }
}
