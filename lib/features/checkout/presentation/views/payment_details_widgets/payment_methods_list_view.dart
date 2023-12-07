import 'package:flutter/material.dart';
import 'package:flutter_payments/features/checkout/presentation/views/payment_details_widgets/payment_method_item.dart';
import 'package:flutter_payments/models/payment.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentMethodsListView extends StatefulWidget {
  const PaymentMethodsListView({super.key});

  @override
  State<PaymentMethodsListView> createState() => _PaymentMethodsListViewState();
}

class _PaymentMethodsListViewState extends State<PaymentMethodsListView> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ListView(
        clipBehavior: Clip.none,
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        scrollDirection: Axis.horizontal,
        children: List.generate(
          Payment.getPaymentsList().length,
          (index) {
            return InkWell(
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                activeIndex = index;
                setState(() {});
              },
              child: PaymentMethodItem(
                  imagePath: Payment.getPaymentsList()[index].imagePath,
                  isActive: activeIndex == index),
            );
          },
        ));
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_payments/features/checkout/presentation/views/payment_details_widgets/payment_method_item.dart';
// import 'package:flutter_payments/models/payment.dart';

// class PaymentMethodsListView extends StatefulWidget {
//   const PaymentMethodsListView({super.key});

//   @override
//   State<PaymentMethodsListView> createState() => _PaymentMethodsListViewState();
// }

// class _PaymentMethodsListViewState extends State<PaymentMethodsListView> {
//   int activeIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         itemCount: Payment.getPaymentsList().length,
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (context, index) {
//           return InkWell(
//             focusColor: Colors.transparent,
//             hoverColor: Colors.transparent,
//             splashColor: Colors.transparent,
//             highlightColor: Colors.transparent,
//             onTap: () {
//               activeIndex = index;
//               setState(() {});
//             },
//             child: PaymentMethodItem(
//               imagePath: Payment.getPaymentsList()[index].imagePath,
//               isActive: activeIndex == index,
//             ),
//           );
//         });
//   }
// }
