import 'package:flutter/material.dart';
import 'package:flutter_payments/core/assets/app_assets.dart';
import 'package:flutter_payments/core/utils/app_styles.dart';
import 'package:flutter_payments/features/checkout/presentation/views/thank_you_widgets/cart_info.dart';
import 'package:flutter_payments/features/checkout/presentation/views/thank_you_widgets/custom_dashed_lines.dart';
import 'package:flutter_payments/features/checkout/presentation/views/thank_you_widgets/green_circle.dart';
import 'package:flutter_payments/features/checkout/presentation/views/thank_you_widgets/payment_item_info.dart';
import 'package:flutter_payments/features/checkout/presentation/views/thank_you_widgets/white_bottom_circle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ThankYouBody extends StatelessWidget {
  const ThankYouBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(32.h),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            CartInfo(),
            const WhiteBottomCircle(xOffset: -0.5),
            const WhiteBottomCircle(xOffset: 0.5, right: 0),
            GreenCircle(),
            CustomDashedLines(),
            Positioned(
                top: -30.h,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(
                    AppAssets.arrowBack,
                    height: 20.h,
                    width: 20.h,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
