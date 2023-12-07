import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_payments/core/widgets/custom_button.dart';
import 'package:flutter_payments/features/checkout/presentation/views/payment_details_widgets/custom_credit_card.dart';
import 'package:flutter_payments/features/checkout/presentation/views/payment_details_widgets/payment_methods_list_view.dart';
import 'package:flutter_payments/features/checkout/presentation/views/thank_you_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentDetailsBody extends StatefulWidget {
  const PaymentDetailsBody({super.key});

  @override
  State<PaymentDetailsBody> createState() => _PaymentDetailsBodyState();
}

class _PaymentDetailsBodyState extends State<PaymentDetailsBody> {
  final formKey = GlobalKey<FormState>();

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
          child: CustomCreditCard(globalKey: formKey),
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
                text: "Payment",
                onTap: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) {
                    return const ThankYouView();
                  }));
                  if (formKey.currentState!.validate()) {
                    formKey.currentState?.save();
                  }
                },
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
