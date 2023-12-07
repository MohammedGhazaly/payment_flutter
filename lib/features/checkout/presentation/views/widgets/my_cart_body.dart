import 'package:flutter/material.dart';
import 'package:flutter_payments/core/assets/app_assets.dart';
import 'package:flutter_payments/core/utils/app_styles.dart';
import 'package:flutter_payments/features/checkout/presentation/views/widgets/order_info_item.dart';
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
            ),
            SizedBox(
              height: 17.h,
            ),
            Divider(
              thickness: 2,
              indent: 15,
              endIndent: 15,
              color: Color(0xffC6C6C6),
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total price",
                  style: AppStyles.style24,
                ),
                Text(
                  "\$50.97",
                  style: AppStyles.style24,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
