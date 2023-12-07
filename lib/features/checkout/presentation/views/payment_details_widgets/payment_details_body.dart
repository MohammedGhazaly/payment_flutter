import 'package:flutter/material.dart';
import 'package:flutter_payments/core/assets/app_assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentDetailsBody extends StatelessWidget {
  const PaymentDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 25.h,
        ),
        Container(
          width: 103,
          height: 62,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: Colors.white,
            border: Border.all(color: Color(0xFF34A853)),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF34A853),
                blurRadius: 4,
                offset: Offset(0, 0),
                spreadRadius: 1,
              )
            ],
          ),
          child: Center(
            child: SvgPicture.asset(
              AppAssets.masterCard,
              // width: 45.h,
              height: 40.h,
            ),
          ),
        )
      ],
    );
  }
}
