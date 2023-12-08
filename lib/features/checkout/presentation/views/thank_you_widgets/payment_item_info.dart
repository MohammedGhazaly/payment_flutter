import 'package:flutter/material.dart';
import 'package:flutter_payments/core/utils/app_styles.dart';

class PaymentItemInfo extends StatelessWidget {
  final String itemKey;
  final String itemValue;
  const PaymentItemInfo(
      {super.key, required this.itemKey, required this.itemValue});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          itemKey,
          style: AppStyles.style18,
        ),
        Text(
          itemValue,
          style: AppStyles.styleSemiBold18,
        ),
      ],
    );
  }
}
