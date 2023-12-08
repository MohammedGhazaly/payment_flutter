import 'package:flutter/material.dart';
import 'package:flutter_payments/core/utils/app_themes.dart';
import 'package:flutter_payments/features/checkout/presentation/views/my_cart_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/checkout/presentation/views/thank_you_view.dart';

void main() {
  runApp(const CheckoutApp());
}

class CheckoutApp extends StatelessWidget {
  const CheckoutApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: AppTheme.lightTheme,
          home: ThankYouView(),
        );
      },
    );
  }
}
