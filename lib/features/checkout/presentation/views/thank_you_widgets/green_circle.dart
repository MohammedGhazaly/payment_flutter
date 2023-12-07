import 'package:flutter/material.dart';
import 'package:flutter_payments/core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GreenCircle extends StatelessWidget {
  const GreenCircle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      child: FractionalTranslation(
        translation: Offset(0, -0.5),
        child: CircleAvatar(
          backgroundColor: Color(0xFFD9D9D9),
          radius: 50.r,
          child: CircleAvatar(
            backgroundColor: AppColors.primaryColor,
            radius: 40,
            child: Icon(
              Icons.done_rounded,
              color: Colors.white,
              size: 64.sp,
            ),
          ),
        ),
      ),
    );
  }
}
