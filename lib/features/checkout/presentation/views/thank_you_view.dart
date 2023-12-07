import 'package:flutter/material.dart';
import 'package:flutter_payments/features/checkout/presentation/views/thank_you_widgets/thank_you_body.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ThankYouBody(),
    );
  }
}
