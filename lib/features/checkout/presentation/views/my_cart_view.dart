import 'package:flutter/material.dart';
import 'package:flutter_payments/core/widgets/build_app_bar.dart';
import 'package:flutter_payments/features/checkout/presentation/views/my_cart_widgets/my_cart_body.dart';

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
