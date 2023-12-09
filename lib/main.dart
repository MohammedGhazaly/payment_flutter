import 'package:flutter/material.dart';
import 'package:flutter_payments/core/utils/app_themes.dart';
import 'package:flutter_payments/features/checkout/presentation/views/my_cart_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() {
  Stripe.publishableKey =
      "pk_test_51OLI1XBbSGdL5kbawIt2XlMFS5pfYYvTQLawKVtqjiTWYnsdrzSKSXx4P0zBbyQ5xJjBc0Q9adBZF22E0kpiKkfI00Ugcaf3Tx";
  runApp(const CheckoutApp());
}

class CheckoutApp extends StatelessWidget {
  const CheckoutApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 850),
      // designSize: const Size(350, 750),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: AppTheme.lightTheme,
          home: MyCartView(),
        );
      },
    );
  }
}
