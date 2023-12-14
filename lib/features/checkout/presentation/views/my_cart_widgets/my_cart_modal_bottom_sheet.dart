import 'package:flutter/material.dart';
import 'package:flutter_payments/core/widgets/custom_button.dart';
import 'package:flutter_payments/features/checkout/presentation/manager/payment_cubit.dart';
import 'package:flutter_payments/features/checkout/presentation/manager/payment_states.dart';
import 'package:flutter_payments/features/checkout/presentation/views/my_cart_widgets/custom_button_bloc_consumer.dart';
import 'package:flutter_payments/features/checkout/presentation/views/payment_details_widgets/payment_methods_list_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentBottomSheet extends StatelessWidget {
  const PaymentBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: Column(
        children: [
          Spacer(),
          SizedBox(
            height: 60.h,
            child: PaymentMethodsListView(),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            // child: CustomButton(
            //   onTap: () async {
            //     await PaymentCubit.get(context).makePayment(
            //         paymentIntentInputModel: paymentIntentInputModel);
            //   },
            //   text: "Continue",
            // ),

            child: CustomButtonBlocConsumer(),
          ),
          Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
