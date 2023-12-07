import 'package:flutter/material.dart';
import 'package:flutter_payments/core/assets/app_assets.dart';
import 'package:flutter_payments/core/utils/app_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCartBody extends StatelessWidget {
  const MyCartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Image.asset(
              AppAssets.basket,
              width: 250.w,
            ),
            SizedBox(
              height: 25.h,
            ),
            OrderInfoItem(
              title: "Order Subtotal",
              money: "42.97",
            ),
            SizedBox(
              height: 3.h,
            ),
            OrderInfoItem(
              title: "Discount",
              money: "0",
            ),
            SizedBox(
              height: 3.h,
            ),
            OrderInfoItem(
              title: "Shipping",
              money: "8",
            )
          ],
        ),
      ),
    );
  }
}

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
