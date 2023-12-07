import 'package:flutter/material.dart';
import 'package:flutter_payments/core/widgets/build_app_bar.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: "Payment Details",
        onTapFunction: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
