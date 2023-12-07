import 'package:flutter/material.dart';
import 'package:flutter_payments/core/utils/app_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: 50.h,
        decoration: BoxDecoration(
          color: Color(0xFF34A853),
          borderRadius: BorderRadius.circular(
            16.r,
          ),
        ),
        child: Center(
          child: Text(
            "Complete payment",
            style: AppStyles.style18.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
