import 'package:flutter/material.dart';
import 'package:flutter_payments/core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PaymentMethodItem extends StatelessWidget {
  final bool isActive;
  final String imagePath;
  const PaymentMethodItem({
    super.key,
    this.isActive = false,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: 100.w,
        height: 60.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Colors.white,
          border: Border.all(
            color: isActive ? AppColors.primaryColor : Colors.grey[700]!,
          ),
          boxShadow: isActive
              ? [
                  BoxShadow(
                    color: AppColors.primaryColor,
                    blurRadius: 4,
                    offset: Offset(0, 0),
                    spreadRadius: 1,
                  )
                ]
              : null,
        ),
        child: Center(
          child: SvgPicture.asset(
            imagePath,
            // width: 45.h,
            height: 30.h,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}
