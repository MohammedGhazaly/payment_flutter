import 'package:flutter/material.dart';
import 'package:flutter_payments/core/utils/app_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'My Cart',
          textAlign: TextAlign.center,
          style: AppStyles.style25,
        ),
      ),
    );
  }
}
