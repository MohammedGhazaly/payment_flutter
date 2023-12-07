import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_payments/core/utils/app_colors.dart';
import 'package:flutter_payments/core/widgets/custom_button.dart';

class CustomCreditCard extends StatefulWidget {
  const CustomCreditCard({super.key});

  @override
  State<CustomCreditCard> createState() => _CustomCreditCardState();
}

class _CustomCreditCardState extends State<CustomCreditCard> {
  String cardNumber = "123456",
      expiryDate = "",
      cardHolderName = "",
      cvvCode = "";

  bool showBackView = true;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardWidget(
          isHolderNameVisible: true,
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          showBackView: showBackView,
          onCreditCardWidgetChange: (brand) {},
        ),
        Theme(
          data: ThemeData(
              colorScheme:
                  ColorScheme.fromSeed(seedColor: AppColors.primaryColor)),
          child: CreditCardForm(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              onCreditCardModelChange: (model) {
                cardHolderName = model.cardHolderName;
                cvvCode = model.cvvCode;
                cardNumber = model.cardNumber;
                expiryDate = model.expiryDate;
                showBackView = model.isCvvFocused;
                setState(() {});
              },
              formKey: formKey),
        ),
      ],
    );
  }
}
