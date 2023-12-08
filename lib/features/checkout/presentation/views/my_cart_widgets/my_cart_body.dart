import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_payments/core/assets/app_assets.dart';
import 'package:flutter_payments/core/utils/app_styles.dart';
import 'package:flutter_payments/core/widgets/custom_button.dart';
import 'package:flutter_payments/features/checkout/presentation/views/my_cart_widgets/my_cart_modal_bottom_sheet.dart';
import 'package:flutter_payments/features/checkout/presentation/views/my_cart_widgets/order_info_item.dart';
import 'package:flutter_payments/features/checkout/presentation/views/payment_details_view.dart';
import 'package:flutter_payments/features/checkout/presentation/views/payment_details_widgets/payment_methods_list_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCartBody extends StatelessWidget {
  const MyCartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Expanded(
            child: Image.asset(
              AppAssets.basket,
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          OrderInfoItem(
            title: "Order Subtotal",
            money: "42.97",
          ),
          SizedBox(
            height: 3.h,
          ),
          OrderInfoItem(
            title: "Discount",
            money: "0",
          ),
          SizedBox(
            height: 3.h,
          ),
          OrderInfoItem(
            title: "Shipping",
            money: "8",
          ),
          SizedBox(
            height: 17.h,
          ),
          Divider(
            thickness: 2,
            indent: 15,
            endIndent: 15,
            color: Color(0xffC6C6C6),
          ),
          SizedBox(
            height: 15.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total price",
                style: AppStyles.style24,
              ),
              Text(
                "\$50.97",
                style: AppStyles.style24,
              )
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          CustomButton(
              text: "Complete payment",
              onTap: () {
                // Navigator.push(context, CupertinoPageRoute(builder: (context) {
                //   return PaymentDetailsView();
                // }));
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return const ModalBottomSheetWidget();
                    });
              }),
          SizedBox(
            height: 46.h,
          ),
        ],
      ),
    );
  }
}
