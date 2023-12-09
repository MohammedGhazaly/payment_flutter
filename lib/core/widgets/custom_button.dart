import 'package:flutter/material.dart';
import 'package:flutter_payments/core/utils/app_colors.dart';
import 'package:flutter_payments/core/utils/app_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final Function()? onTap;
  final bool isLoading;
  final String text;
  const CustomButton({
    super.key,
    required this.onTap,
    required this.text,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 60.h,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(
            16.r,
          ),
        ),
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : Center(
                child: Text(
                  text,
                  style: AppStyles.style18.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
      ),
    );
  }
}
