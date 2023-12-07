import 'package:flutter/material.dart';
import 'package:flutter_payments/features/checkout/presentation/views/payment_details_widgets/payment_method_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentDetailsBody extends StatelessWidget {
  const PaymentDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 25.h,
        ),
        PaymentMethodItem(
          isActive: false,
        )
      ],
    );
  }
}
