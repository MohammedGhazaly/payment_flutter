import 'package:flutter/material.dart';
import 'package:flutter_payments/features/checkout/presentation/views/thank_you_widgets/green_circle.dart';
import 'package:flutter_payments/features/checkout/presentation/views/thank_you_widgets/white_bottom_circle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThankYouBody extends StatelessWidget {
  const ThankYouBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(32.h),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
            const WhiteBottomCircle(xOffset: -0.5),
            const WhiteBottomCircle(xOffset: 0.5, right: 0),
            GreenCircle()
          ],
        ),
      ),
    );
  }
}
