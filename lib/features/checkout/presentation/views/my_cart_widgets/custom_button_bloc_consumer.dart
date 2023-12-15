import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_payments/core/widgets/custom_button.dart';
import 'package:flutter_payments/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:flutter_payments/features/checkout/data/models/paypal_models/paypal_amount_model/details.dart';
import 'package:flutter_payments/features/checkout/data/models/paypal_models/paypal_amount_model/paypal_amount_model.dart';
import 'package:flutter_payments/features/checkout/data/models/paypal_models/paypal_items_model/item.dart';
import 'package:flutter_payments/features/checkout/data/models/paypal_models/paypal_items_model/paypal_items_model.dart';
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
              var transactionsData = getTransactionsData();
              executePaypalPayment(context, transactionsData);
            }
          },
          text: "Continue",
          isLoading: state is PaymentLoading ? true : false,
        );
      },
    );
  }

  void executePaypalPayment(
      BuildContext context,
      ({
        PaypalAmountModel amountModel,
        PaypalItemsModel paypalItems
      }) transactionsData) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId:
            "Ab1GxBOLuj9XfpRb_sS31CpCbaKCP99kZTscClA9p5aN23ub2Hc1SC5oyM30wYiH8nkA89Dsl3LDs3Ax",
        secretKey:
            "EA8nW52QDiwpgSvEmCzjyfPtn90LJ2xAfnFhNa1UC8AoIlwtYM-XPjux7jv4ADtZDlkI1Dnp64Dg-QXe",
        transactions: [
          {
            "amount": transactionsData.amountModel.toJson(),
            "description": "The payment transaction description.",
            // "payment_options": {
            //   "allowed_payment_method":
            //       "INSTANT_FUNDING_SOURCE"
            // },
            "item_list": transactionsData.paypalItems.toJson()
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

  ({PaypalAmountModel amountModel, PaypalItemsModel paypalItems})
      getTransactionsData() {
    var amount = PaypalAmountModel(
      total: "100",
      currency: "USD",
      details: Details(
        shipping: "0",
        shippingDiscount: 0,
        subtotal: "100",
      ),
    );
    var paypalItems = PaypalItemsModel(
      items: [
        Item(
          name: "Apple",
          currency: "USD",
          price: "10",
          quantity: 4,
        ),
        Item(
          name: "Pineapple",
          currency: "USD",
          price: "12",
          quantity: 5,
        ),
      ],
    );
    return (amountModel: amount, paypalItems: paypalItems);
  }
}
