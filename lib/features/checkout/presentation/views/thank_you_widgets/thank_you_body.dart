import 'package:flutter/material.dart';
import 'package:flutter_payments/core/assets/app_assets.dart';
import 'package:flutter_payments/core/utils/app_styles.dart';
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
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Padding(
                padding:
                    EdgeInsets.only(top: 50.h + 16.h, left: 20.w, right: 20.w),
                child: Column(
                  children: [
                    Text(
                      'Thank you!',
                      textAlign: TextAlign.center,
                      style: AppStyles.style25,
                    ),
                    Text(
                      'Your transaction was successful',
                      textAlign: TextAlign.center,
                      style: AppStyles.style18,
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    PaymentItemInfo(itemKey: "Day", itemValue: "01/24/2023"),
                    SizedBox(
                      height: 20.h,
                    ),
                    PaymentItemInfo(itemKey: "Time", itemValue: "10:15 AM"),
                    SizedBox(
                      height: 20.h,
                    ),
                    PaymentItemInfo(
                      itemKey: "To",
                      itemValue: "Sam louis",
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Divider(
                      thickness: 2,
                      color: Color(0xFFC6C6C6),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: AppStyles.style24,
                        ),
                        Text(
                          "\$50.97",
                          style: AppStyles.style24,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Container(
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          16.r,
                        ),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            AppAssets.masterCardLogo,
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Credit card",
                                  style: AppStyles.style18,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                Text(
                                  "Mastercard **78",
                                  style: AppStyles.style16,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const WhiteBottomCircle(xOffset: -0.5),
            const WhiteBottomCircle(xOffset: 0.5, right: 0),
            GreenCircle(),
            CustomDashedLines()
          ],
        ),
      ),
    );
  }
}
