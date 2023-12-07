import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_payments/core/assets/app_assets.dart';
import 'package:flutter_payments/core/utils/app_colors.dart';
import 'package:flutter_payments/core/widgets/custom_button.dart';
import 'package:flutter_payments/features/checkout/presentation/views/payment_details_widgets/custom_credit_card.dart';
import 'package:flutter_payments/features/checkout/presentation/views/payment_details_widgets/payment_method_item.dart';
import 'package:flutter_payments/features/checkout/presentation/views/payment_details_widgets/payment_methods_list_view.dart';
import 'package:flutter_payments/models/payment.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentDetailsBody extends StatelessWidget {
  const PaymentDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: 25.h,
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 60.h,
            child: PaymentMethodsListView(),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 35.h,
          ),
        ),
        SliverToBoxAdapter(
          child: CustomCreditCard(),
        ),
        SliverToBoxAdapter(
            child: SizedBox(
          height: 35.h,
        )),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: CustomButton(
                onTap: () {},
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
            child: SizedBox(
          height: 18.h,
        )),
      ],
    );
  }
}
