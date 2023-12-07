import 'package:flutter/material.dart';
import 'package:flutter_payments/core/assets/app_assets.dart';
import 'package:flutter_payments/core/utils/app_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {},
          child: Center(
            child: SvgPicture.asset(
              AppAssets.arrowBack,
              width: 20.h,
              height: 20.h,
            ),
          ),
        ),
        title: Text(
          'My Cart',
          textAlign: TextAlign.center,
          style: AppStyles.style25,
        ),
      ),
    );
  }
}
