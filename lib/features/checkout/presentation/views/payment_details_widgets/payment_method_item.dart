import 'package:flutter/material.dart';
import 'package:flutter_payments/core/assets/app_assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PaymentMethodItem extends StatelessWidget {
  final bool isActive;
  const PaymentMethodItem({
    super.key,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      width: 100.w,
      height: 60.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: Colors.white,
        border: Border.all(
          color: isActive ? Color(0xFF34A853) : Colors.grey[700]!,
        ),
        boxShadow: isActive
            ? [
                BoxShadow(
                  color: Color(0xFF34A853),
                  blurRadius: 4,
                  offset: Offset(0, 0),
                  spreadRadius: 1,
                )
              ]
            : null,
      ),
      child: Center(
        child: SvgPicture.asset(
          AppAssets.masterCard,
          // width: 45.h,
          height: 40.h,
        ),
      ),
    );
  }
}
