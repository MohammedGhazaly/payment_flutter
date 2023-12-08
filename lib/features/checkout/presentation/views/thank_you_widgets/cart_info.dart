import 'package:flutter/material.dart';
import 'package:flutter_payments/core/assets/app_assets.dart';
import 'package:flutter_payments/core/utils/app_colors.dart';
import 'package:flutter_payments/core/utils/app_styles.dart';
import 'package:flutter_payments/features/checkout/presentation/views/thank_you_widgets/payment_item_info.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartInfo extends StatelessWidget {
  const CartInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xffEDEDED),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 50.h + 16.h, left: 20.w, right: 20.w),
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
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
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
            ),
            Spacer(),
            FractionalTranslation(
              translation: Offset(0, 0.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    FontAwesomeIcons.barcode,
                    size: 64.sp,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 35.h,
                      vertical: 15.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      border:
                          Border.all(color: AppColors.primaryColor, width: 1.5),
                      // color: AppColors.primaryColor,
                    ),
                    child: Center(
                      child: Text(
                        "Paid",
                        style: AppStyles.style24.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: (MediaQuery.sizeOf(context).height * 0.15 + 20) / 2,
            )
          ],
        ),
      ),
    );
  }
}
