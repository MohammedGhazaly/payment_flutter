import 'package:flutter/material.dart';
import 'package:flutter_payments/core/assets/app_assets.dart';
import 'package:flutter_payments/core/utils/app_styles.dart';
import 'package:flutter_payments/core/widgets/build_app_bar.dart';
import 'package:flutter_payments/features/checkout/presentation/views/my_cart_widgets/my_cart_body.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "My Cart", onTapFunction: () {}),
      body: MyCartBody(),
    );
  }
}
