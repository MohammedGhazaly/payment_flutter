import 'package:flutter/material.dart';
import 'package:flutter_payments/core/utils/app_styles.dart';

class OrderInfoItem extends StatelessWidget {
  final String title;
  final String money;
  const OrderInfoItem({super.key, required this.title, required this.money});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppStyles.style18,
        ),
        Text(
          "\$$money",
          style: AppStyles.style18,
        )
      ],
    );
  }
}
