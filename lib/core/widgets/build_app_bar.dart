import 'package:flutter/material.dart';
import 'package:flutter_payments/core/assets/app_assets.dart';
import 'package:flutter_payments/core/utils/app_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

AppBar buildAppBar({String? title, required Function()? onTapFunction}) {
  return AppBar(
    leading: InkWell(
      onTap: onTapFunction,
      child: Center(
        child: SvgPicture.asset(
          AppAssets.arrowBack,
          width: 20.h,
          height: 20.h,
        ),
      ),
    ),
    title: Text(
      title ?? "",
      textAlign: TextAlign.center,
      style: AppStyles.style25,
    ),
  );
}
