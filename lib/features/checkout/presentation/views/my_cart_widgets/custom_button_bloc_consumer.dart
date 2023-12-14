import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_payments/core/widgets/custom_button.dart';
import 'package:flutter_payments/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:flutter_payments/features/checkout/presentation/manager/payment_cubit.dart';
import 'package:flutter_payments/features/checkout/presentation/manager/payment_states.dart';
import 'package:flutter_payments/features/checkout/presentation/views/thank_you_view.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

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
              // await PaymentCubit.get(context).makePayment(
              //     paymentIntentInputModel: PaymentIntentInputModel(
              //         amount: "1.5",
              //         currency: "USD",
              //         customerId: "cus_P9lS5YfXssMkMm"));
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => PaypalCheckoutView(
                  sandboxMode: true,
                  clientId: "YOUR CLIENT ID",
                  secretKey: "YOUR SECRET KEY",
                  transactions: const [
                    {
                      "amount": {
                        "total": "100",
                        "currency": "USD",
                        "details": {
                          "subtotal": "100",
                          "shipping": "0",
                          "shipping_discount": 0
                        }
                      },
                      "description": "The payment transaction description.",
                      // "payment_options": {
                      //   "allowed_payment_method":
                      //       "INSTANT_FUNDING_SOURCE"
                      // },
                      "item_list": {
                        "items": [
                          {
                            "name": "Apple",
                            "quantity": 4,
                            "price": '10',
                            "currency": "USD"
                          },
                          {
                            "name": "Pineapple",
                            "quantity": 5,
                            "price": '12',
                            "currency": "USD"
                          }
                        ],

                        // Optional
                        //   "shipping_address": {
                        //     "recipient_name": "Tharwat samy",
                        //     "line1": "tharwat",
                        //     "line2": "",
                        //     "city": "tharwat",
                        //     "country_code": "EG",
                        //     "postal_code": "25025",
                        //     "phone": "+00000000",
                        //     "state": "ALex"
                        //  },
                      }
                    }
                  ],
                  note: "Contact us for any questions on your order.",
                  onSuccess: (Map params) async {
                    log("onSuccess: $params");
                    Navigator.pop(context);
                  },
                  onError: (error) {
                    log("onError: $error");
                    Navigator.pop(context);
                  },
                  onCancel: () {
                    print('cancelled:');
                    Navigator.pop(context);
                  },
                ),
              ));
            }
          },
          text: "Continue",
          isLoading: state is PaymentLoading ? true : false,
        );
      },
    );
  }
}
