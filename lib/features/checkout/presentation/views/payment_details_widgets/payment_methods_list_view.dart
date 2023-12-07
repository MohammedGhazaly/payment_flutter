import 'package:flutter/material.dart';
import 'package:flutter_payments/features/checkout/presentation/views/payment_details_widgets/payment_method_item.dart';
import 'package:flutter_payments/models/payment.dart';

class PaymentMethodsListView extends StatelessWidget {
  const PaymentMethodsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: Payment.getPaymentsList().map((e) {
        return PaymentMethodItem(imagePath: e.imagePath);
      }).toList(),
    );
  }
}
