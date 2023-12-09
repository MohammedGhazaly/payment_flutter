import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_payments/core/widgets/custom_button.dart';
import 'package:flutter_payments/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:flutter_payments/features/checkout/presentation/manager/payment_cubit.dart';
import 'package:flutter_payments/features/checkout/presentation/manager/payment_states.dart';
import 'package:flutter_payments/features/checkout/presentation/views/thank_you_view.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentStates>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.push(context, CupertinoPageRoute(builder: (context) {
            return ThankYouView();
          }));
        } else if (state is PaymentFailure) {
          if (state.errorMessage != "STRIPE EXCEPTION") {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
              ),
            );
          }
        }
      },
      builder: (context, state) {
        return CustomButton(
          onTap: () async {
            if (state is! PaymentLoading) {
              await PaymentCubit.get(context).makePayment(
                  paymentIntentInputModel:
                      PaymentIntentInputModel(amount: "1.5", currency: "USD"));
            }
          },
          text: "Continue",
          isLoading: state is PaymentLoading ? true : false,
        );
      },
    );
  }
}
